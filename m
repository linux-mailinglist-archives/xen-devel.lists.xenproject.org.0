Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EB24AC121
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267037.460740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH51C-0004bb-IG; Mon, 07 Feb 2022 14:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267037.460740; Mon, 07 Feb 2022 14:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH51C-0004Zl-Ew; Mon, 07 Feb 2022 14:29:26 +0000
Received: by outflank-mailman (input) for mailman id 267037;
 Mon, 07 Feb 2022 14:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH51B-0004ZZ-6P
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:29:25 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 581f47eb-8822-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 15:29:24 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EE0rl030905;
 Mon, 7 Feb 2022 14:29:19 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e350h026e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:29:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2589.eurprd03.prod.outlook.com (2603:10a6:800:df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:28:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:28:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 581f47eb-8822-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZCv1l1F64NzO+6U1RzvK+J89Jkf0xvaln1i6eJ5XNlQdB+JlDc+WXHlGmH6aEqPfqO5Tdza1zuNeYA7cnYiHY9fpsZU1Y5pfi+X64i4tqTrokYuklPpoy6vp36czl+ChL+Rafc7uBo2ngUPIlidRzWUVKLkhkUDU6gP7e9CHpkT+Vmd8TMTXZya4UvQrnxSqQA/u5/QuTlaqTXilD4BlT9PVh7iiatwmSfxnJTSM2MVZ4eICek4k9E4+5k9jG7ibgHnlmlUiHFnmPpAYRFnbmlHLJK3Kqj9nkDtUh1T4a9HakaTnQjcteHzwklA4wU4W/TnSA84e500GsBotpljIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAcMnT8uCKiLODXO71H8yGt0byHfus7KS6BKcroKuNc=;
 b=OkTyZJLH/84zmBFEQ7+UlX/jdzehfo03PiFaofXig5JJMAY2QDYwMW8Qer35cnvIpuunjoSTyKHYe/V3uoT6+vgEI8qyeDUuvd4/v9fV0oCviUK/BFW5yN8Aq38HB4/1SQVNdytCmDhXq3g9488Zrh9XcAw4vUDIBidYDbf2mIM64ba84Xzzsw/0UNcYXjrjx90LZMlq4QfBABRTVq6o8+oFqBxoTGBMhAR8VPkLXdw2eQyfzFjQ1ShS/J/kaQe6f8tCrVzv71yv6mIqQKh9pZxls3YX2Y/C/EMtGXzTjbgTzhXEKBfjy8KKVnPocF8xlODDtt0t+7/0zD43xPeegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAcMnT8uCKiLODXO71H8yGt0byHfus7KS6BKcroKuNc=;
 b=T3v/3DnYPo1uyW0/vV0JU2dcZFgJSs2Y8AVh3m+DKRqhk3oPq/NoyFSbi8DCBXBggRTY8HI1i+Sq0GV17zaFSXjmpPah1nAMz8zrw1YV2U24elehauIYDnjs/SiZmwV6hMOSOnMbHtmHGfEc4j5hhScCSA/X0HbCl/WxoQuJHl7MAtoRxmgvD1/YlJTnL/Z1x3BAdDV8Cwo+Ffaw9xGnXU7wNg2YahX1PfZkdLlm5vN7JdtVG2d1QRCiJ2v3gRpvujvR1DhadMtWaO5xJ4u/HQ04fkXqgTPX9Ov54fKKkFOyhCGAxieqIxcB9vL9On/ZE77amKaFhRRbYN5II5buHw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAATvAA==
Date: Mon, 7 Feb 2022 14:28:43 +0000
Message-ID: <2a66bdf0-a284-4d76-17c1-0e147a262c25@epam.com>
References: <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
In-Reply-To: <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66e6ff66-2aa7-40af-106b-08d9ea4624a1
x-ms-traffictypediagnostic: VI1PR0302MB2589:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2589B3C08BE5136186FD75ADE72C9@VI1PR0302MB2589.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QKseVBaSOccA7AV2k4BQ4wzRvYXyVF4imWxNFfi1P+sjPGYrZjLyc3tf//12RpLVzH55Ciye8pTk8iNg6SRyXdqfJyHZwKSY0ktLx+JpK7I+Dg0mGbVfNSYrQzWlCmVlGpK/Muk9RMFtWK5aYI4KmxqWxogH7uxonJdFfn7XL5I9iF8IRFPnccEqUe7p0u0vl0LxFynaUKRxdQ5vkLNz1t4AfnYED+tw5UuZEF+UBj0l7MY9KMuGXQOSRcJmk5P3Dkpl/qeJ5JRm9FzLpbnnp9RqeeoUxMfC7BuTzggbUdl7QaIg2+wVj9Y5Ogg6HqCw/b46RxyyJPDMnhvO2pkAUKzL2aQcjJV1C2a/1XTLOSzTcTXvx1xEpF5SDtLW1asnLZMS+QteRa6E9GlufKCKZQhI+teEMGJTwXcPgBYl4X/VWC6cNpW77Dg8g5yZ5c2wuV4C9SV95yPSH2eXOkG9oxkSieatlF6D4iXHanXpbzBlSIhrOs2ZV32WGPDL+wjqQmTixELqOHqTM1UyTgYlTS0n0MYhfeg0syexjsf0zkP3u1g1zotfLevmGaKppC+gGnvsViEKjEe6yVxO+7yNmJ7no9hXT8pWDo/5HsmWrvhuQ5p9xlbLmZNBpH8PJ/5+Oni0oDyqzdyJu086AEIoue6HbO5hCMWN7Dyj8J6cQllcKaOCAj2ZtAvcMeHqr0zJrEPoPbF5vEfQbKY6uk+ZOwu8Weu6DnBCPPlbzHKOK0s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(508600001)(91956017)(66476007)(8936002)(66556008)(8676002)(6916009)(64756008)(66446008)(76116006)(66946007)(83380400001)(54906003)(6512007)(6486002)(26005)(186003)(38070700005)(2616005)(2906002)(316002)(7416002)(36756003)(31686004)(31696002)(6506007)(122000001)(55236004)(53546011)(38100700002)(86362001)(71200400001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QmtMUWd5MStlSUpFeTBOUWI2Zjg2UEM4TTRoYjhTVzBVVXdRNTZpbzdPVTNJ?=
 =?utf-8?B?dmYvNE82WlhhZ1o5OVd2ZmRQYTAxbHd3MUFNQ256d1FCU0treE0rRjFXY2pM?=
 =?utf-8?B?SWlyMERiRkF1N29HTi9WaWZVeHJrQVNJVDVZVis1MWhScmJXRzZKbGJtdnZo?=
 =?utf-8?B?dUswd3hXMFZYVWdHT1BWaTRza3JUV0RtamRQUGV6YVdlT2E0STE4NXFDSVNJ?=
 =?utf-8?B?RUxSM25nOWkzaFJzZ29BWXVGbjVwblREUWM1RVZ0Rk1BeXJFaTIyYlR2VDF6?=
 =?utf-8?B?OWtlN3NxaXQ4TDNWRGppb0ZjcG82OUtEaW1zZnBVNUVWWW9PTGZaQmVrODRy?=
 =?utf-8?B?dmpoWUNlcElydks4Q0JuQ3kzVVJrd1ZEYVd4K0EzRVZJOWlwS04yNkh5RnlT?=
 =?utf-8?B?T3hETnNlNjFHa2hHa0R6dVB1TUFCUW9PanJXS0xIcTNrQ2p0WmttYXdUaUdK?=
 =?utf-8?B?VWo3Z2s5ci81c3RueHNUK2FCMUZmc3VtcWFkQXpqbGFkS3NXNjNLVDQ2UWsx?=
 =?utf-8?B?NE5pTmlOc3BQM0Fpb0xpL2VYVDg4NWp2dFAxQmJpaEJvVW1sMXdzbUdydSto?=
 =?utf-8?B?b1dReDdhV0ZNQ1R6Um9kaXlWQ2ZYWHRNQkFiOTAwNWVMQlhFeG5jVFZNYmdX?=
 =?utf-8?B?WVd3Mlc4b1RrS0g0SGJSb1pSN0xsa2JtN1p2eGlFR1NKaFdvb0FmMk1obmRq?=
 =?utf-8?B?dlQzeGNqc2JnaDkzU3RmU1RoUW42N1JmcGdndWhGNmhiZDh4NGQ2WUlsRkI1?=
 =?utf-8?B?OVVxTkJiWjhJRWErVHZTUDBWVmh1SjR4M3d5VDZYNzA5ZW1vMW9yM214V0ZT?=
 =?utf-8?B?MzNOZE5ZcUpldVBSMzdzbnNCeEc3S1lTOVhYNFBxY2kxVFI5TWFQUHNIR3dB?=
 =?utf-8?B?REY5NU1ob1V4ZW4ySkxFTnZOc2wrdkhuYlBJa3pQd1BQNFN3WFVLTm5LRDNM?=
 =?utf-8?B?SVVkdVhVampjQmZsamhEVlkzbVFrTEl1Vmd3UXdncUphVHIvMmlDYnFsNlRo?=
 =?utf-8?B?WExDM2hxakZyQVFxNi9JR0I1UUt6dktabnVod3VsRy9VZndjRVE0SjVIZmdJ?=
 =?utf-8?B?L3B0b2Y1eTVGTjJ3VzdKTTgvT0pVOVQyODlLalorVUhmVDd6TGdRdnIrMkdE?=
 =?utf-8?B?c2ptUmsyNlRqYm5RWG53TFRveEFyMmhNdHdPbGlscEJkamtzNzlaMzlsZDU3?=
 =?utf-8?B?cHdLcmRDV21Lekx5dWNmVmRFcGxiSFZpMWJFMkxsMW1iR3VWbFRJcGZic0dG?=
 =?utf-8?B?MjZnM3I4eWVkbHNDWitVamxYUVFHakV4UGxPV2NlemVYWnp1V1NiQnJneVo4?=
 =?utf-8?B?VUtDb3ZLOVl5TnhieE5YWkhhVDVXamFSaE9BVitSdWRxZjMxUE5ka2t5ZkF3?=
 =?utf-8?B?SFpqWkxQeUhDdlFBcC9ncGpCMGlCK2pIY0ZkajQ4WEJkTkFkQ2hzRytHWWxM?=
 =?utf-8?B?cmgvNkNnTXpKckpxMFVVSjVJN05PL2dPcERSS3VMaHV6TVR2SngrWG9ta3Mx?=
 =?utf-8?B?M3c4Y2xLZlNpcXA1R21TSnJGSk94TmVUUFRuUEhtaC9OamhNMzFsbnRxS2xa?=
 =?utf-8?B?M0NMa0cvdVJIb0kxNm5TczFGSElHTi8xMTdRYllZM0Y3OC9oeVpRY2RSQkhm?=
 =?utf-8?B?a1ZwRjJaTm1iSkJxTGdua0JzRmhUb3hJS0phRzU1RkI0TzJMQkRVdjYzYzBj?=
 =?utf-8?B?NTdVMjZKeEZjK0tVeXBvbFNiNitMQmxyeGFzcFVtQWNkM0JDQnJJZTBORzA1?=
 =?utf-8?B?SUg5OHNtaWlFekQrUmFnR2F3bm9CM29JcFRRRDhxaXVFOUdmb3dGM2p3NWRL?=
 =?utf-8?B?d1JKU2t1bXArUjkwTmtyZG1zS3h6M2V3SUdWeG1aZ2kreVZpcWMrbitiWDZT?=
 =?utf-8?B?cDVTRGRidWNEL2ZFRjFITTNjZExLSURnS2wya1VVNVlabEExNWpCeGVUcXhU?=
 =?utf-8?B?c0IyOXNtVjRCNzF5S3dkVThITEt5Tk5pY3NsVENudXpOK1QrSXBDYnBTMXBq?=
 =?utf-8?B?S0Zqc3VvQS9PLy80T3daSlRrL0tBdDhONGI4cDVBS2xuN2pBaWpzSEM5cDRp?=
 =?utf-8?B?bEhrNG9laEZibEhnUmtxMWpqSmdBanp6ZTRBYjJZUVJDcDh2R2IyWFB0QzFV?=
 =?utf-8?B?YUpSRGl0VzU5YjZiY0lJMlJROHRoZnY0TzlOcVVsR2ptcHV2a2NLS1g0UUlJ?=
 =?utf-8?B?aFlKTFhSL1h5dkF3aklURTQzeVMyMWV3T3pNQmFOQ3I4cHVsQmk4YVNwM09n?=
 =?utf-8?B?b0FUSG1FcTNPd2tZQS9XM2pseVhETngzRGdTT2pmZ05pNG82WjBsU3pndkhj?=
 =?utf-8?B?YXBKQWJoL3hBbE5HU2FGNjlOZ0pZU3RTcDFNbUhCdVF0OG11UGliZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E2900BE4F34104295F3BE1E964AFCAC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e6ff66-2aa7-40af-106b-08d9ea4624a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:28:43.1363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAirtDUZ7kYotQGlk+xHcRYAwESCiP5BCdvbudxmmWg8Oy77IrCyTrpaTLpOXG4WysogrjqTYaBAJfHMXhHybsSy0jnN4yoDvDK7vNneJxq1+OlFdR/4eW+WUxsNvf1W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2589
X-Proofpoint-ORIG-GUID: vudyfM0hjtvwmvh8sDMwoLmnfJixRQRi
X-Proofpoint-GUID: vudyfM0hjtvwmvh8sDMwoLmnfJixRQRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=707 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070093

DQoNCk9uIDA3LjAyLjIyIDE2OjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNDo1MywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNy4wMi4yMiAx
NDo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBJIHRoaW5rIHRoZSBwZXItZG9tYWlu
IHJ3bG9jayBzZWVtcyBsaWtlIGEgZ29vZCBvcHRpb24uIEkgd291bGQgZG8NCj4+PiB0aGF0IGFz
IGEgcHJlLXBhdGNoLg0KPj4gSXQgaXMuIEJ1dCBpdCBzZWVtcyBpdCB3b24ndCBzb2x2ZSB0aGUg
dGhpbmcgd2Ugc3RhcnRlZCB0aGlzIGFkdmVudHVyZSBmb3I6DQo+Pg0KPj4gV2l0aCBwZXItZG9t
YWluIHJlYWQgbG9jayBhbmQgc3RpbGwgQUJCQSBpbiBtb2RpZnlfYmFycyAoaG9wZSB0aGUgYmVs
b3cNCj4+IGlzIGNvcnJlY3RseSBzZWVuIHdpdGggYSBtb25vc3BhY2UgZm9udCk6DQo+Pg0KPj4g
Y3B1MDogdnBjaV93cml0ZS0+IGQtPlJMb2NrIC0+IHBkZXYxLT5sb2NrIC0+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm9tX3dyaXRlIC0+IG1vZGlmeV9iYXJzOiB0
bXAgKHBkZXYyKSAtPmxvY2sNCj4+IGNwdTE6wqDCoMKgwqDCoMKgwqAgdnBjaV93cml0ZS0+IGQt
PlJMb2NrIHBkZXYyLT5sb2NrIC0+IGNtZF93cml0ZSAtPiBtb2RpZnlfYmFyczogdG1wIChwZGV2
MSkgLT5sb2NrDQo+Pg0KPj4gVGhlcmUgaXMgbm8gQVBJIHRvIHVwZ3JhZGUgcmVhZCBsb2NrIHRv
IHdyaXRlIGxvY2sgaW4gbW9kaWZ5X2JhcnMgd2hpY2ggY291bGQgaGVscCwNCj4+IHNvIGluIGJv
dGggY2FzZXMgdnBjaV93cml0ZSBzaG91bGQgdGFrZSB3cml0ZSBsb2NrLg0KPiBIbW0sIHllcywg
SSB0aGluayB5b3UncmUgcmlnaHQ6IEl0J3Mgbm90IG1vZGlmeV9iYXJzKCkgaXRzZWxmIHdoaWNo
IG5lZWRzDQo+IHRvIGFjcXVpcmUgdGhlIHdyaXRlIGxvY2ssIGJ1dCBpdHMgKHBlcmhhcHMgaW5k
aXJlY3QpIGNhbGxlci4gRWZmZWN0aXZlbHkNCj4gdnBjaV93cml0ZSgpIHdvdWxkIG5lZWQgdG8g
dGFrZSB0aGUgd3JpdGUgbG9jayBpZiB0aGUgcmFuZ2Ugd3JpdHRlbg0KPiBvdmVybGFwcyB0aGUg
QkFScyBvciB0aGUgY29tbWFuZCByZWdpc3Rlci4NCkV4YWN0bHksIHZwY2lfd3JpdGUgbmVlZHMg
YSB3cml0ZSBsb2NrLCBidXQgaXQgaXMgbm90IGRlc2lyYWJsZS4NCkFuZCBhZ2FpbiwgdGhlcmUg
aXMgYSBzaW5nbGUgb2ZmZW5kaW5nIHBpZWNlIG9mIGNvZGUgd2hpY2ggd2FudHMgdGhhdC4uLg0K
PiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

