Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93F4A3EF9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262821.455210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESYC-0006eN-0E; Mon, 31 Jan 2022 09:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262821.455210; Mon, 31 Jan 2022 09:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESYB-0006c7-T3; Mon, 31 Jan 2022 09:00:39 +0000
Received: by outflank-mailman (input) for mailman id 262821;
 Mon, 31 Jan 2022 09:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nESYA-0006bx-9B
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:00:38 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 408740b7-8274-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 10:00:36 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V8RndX003573;
 Mon, 31 Jan 2022 09:00:33 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dx9je8hv9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 09:00:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AS8PR03MB7539.eurprd03.prod.outlook.com (2603:10a6:20b:347::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 09:00:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 09:00:29 +0000
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
X-Inumbo-ID: 408740b7-8274-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjmrCk1KuLnRqsy3szXUvAP3lB6yMITZsYwoeAppJJJAx/9FlIw4FhHOj9ifoS1IHpForwrcFU1lVOIuh28AtCclU4DmSC8E6C5fQB3nywCpdwn4lMYmNQzhqMr8f3LO1gLpxo/aG875jWE64NoBCm3vH7JB6152YpvYQc3uFNP828ScMbhbPkm71OYJFprl/h32juc3FTpRXoiTFbbZRBmMR/2g3aecmKg/yYh+uJgQ7VU3VQdyXGZn2uUXH2zEKoKxG4cBmC6klUglxolvS4/epvrIYFYJOOwZCw4CYfHr96UTf3cHqpojnIVaJIDjygZHPEMI56GlfIYM2rQYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2ZrjqCO/8DtYyY++XS+1x4wrCgByiCzJ9anQUoFMj8=;
 b=QasDB18sJiISDZZTUrlrvtOtoZelMtHq8tgQwyjTgYwrL0G+6wCcCmokH2+KefyLkor2Gn7PqwOuc669Bsuui7KbEp5uSsXY/IQSJsK7fpZ9Yn4qrNfR2ymdg+duAfsbqmBXfCBvj2VzjoYpMj1RtTEDPzo0BtuziOzRVflWR7byO92VieQyBX+njiexpoTKUAWBVrDSiBdjf/IdbPI9G5s5ryPX3rX0D8px44O2SZ+4IjSBfuxQLLgXA3wqVhDp1E3btxaNXf0oZUpbRCsMSS8mEtM3HzKAyJZGUK0ok6d03my+rD2xJNtrKie0/SmvSmVpckgpnSscdYB5QwclRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2ZrjqCO/8DtYyY++XS+1x4wrCgByiCzJ9anQUoFMj8=;
 b=ls3v5tuOr5mdjSIGTmit8HPDKuO3HCjw3L9C8Rv+PnMNiev50bGOu1pTt/gIwEcATEweiQwQTkkDMOE4SNKjTQ8Ov1OY8FZCbr0hIkIvkFFhf5xPGP9pR2tjatXjGTTDz4x4StFm8p3bNWcPdjBiCZUeuNpcl95r4/WjatJlOcEfCl8uew6ne5c+mQT2pPKaELKExDEaBfmdRYgMQ7pQSLLTyKtJAH508sCeMTPc6HLRfkrPM3xasBOBupqq0FU8raGCscXxhMkxhxXPTWsWdtXewqPxxMDcmwQ/unolB5hBCQ+qPV4B9ha/4rfjHeJHqzk/La6TmB6/BDXzXnrNBg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHX4ewHDku9OOCAtECwEMPLB4JkU6xfxaAAgAAMrQCAAALDgIABHnKAgBfrjICABF4TgIAAAQIA
Date: Mon, 31 Jan 2022 09:00:28 +0000
Message-ID: <95121a7f-3002-9784-de15-9e83c9c4c9f7@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
 <Yd73Aq4w2H1Eo01h@Air-de-Roger>
 <4fb1d547-6f6d-c4e8-b2ef-0dea780dd66d@suse.com>
 <Yd/pnYDBwsdyLrPN@Air-de-Roger>
 <c937d26a-5357-1ced-ee6a-ef713a3c5964@epam.com>
 <YfekUyXZZ1cxeObs@Air-de-Roger>
In-Reply-To: <YfekUyXZZ1cxeObs@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8296300-b985-42c4-da58-08d9e498210e
x-ms-traffictypediagnostic: AS8PR03MB7539:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB7539A0E238645D6FD6CAD1E2E7259@AS8PR03MB7539.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /idVhEdWsY90ANc+fHE2vPRrc7wXX5zb847qtVepYqvm1T3SgEPH+DSFNtOXOZGKVuCqYDge8YonXmAAZ8qFe5JQXiyvGRL9AH2kZQw9DMzyhCEQSsDVZolDQ9MOTaDVfiCHi47qix4ndyT51qAgpE0UKtgMLQ85OZNBNuCh0NespShsPLkale0sRHrBkTSRGm+wPsKKrsayM5zSCXKhxcD1j/5HEuJoJmX5lgM8FjJj0uzhSBG3acUhnLyuyAWDqtvlgGjjpLJbgJ14BeOSh5sQDrUt4PN5uLXYTBYMY+Eky5bFEFsyzazKUMizZnK0Dpc5NWSRz0RvMqrx4i9vzSH3C4Ha+eLRT3/LEy5pOxlAXnzZX0XmkpjL5kbOhzrcYxlxe9AGomWcSFZ/ub4JbDEBbUAlCEL0czbwdHKJBCPS4LL1ITikyr7SXeUGa8GdVJyxVVYUfjTW+nW4EagUUb9j0yDdBBgmdLBHPOyF646HVTL5twGR863ZqUEhZgp8Pe1vYEoMvlbBh87GbUEGrONo/a4+Pt3jHGwipUj6PfKzNS38jmUY/vf0ltTexaPTuLczHiKZqVmjDSR1In7QAUMw8XfaqnXbwUly4OGMq/3KHwdB4hwUQm7iDALL7a9GcUXnf5g2srDgO/UmanUpD2nB8dzannMlQ1iSPAPujS2e5NMsl6KbX0P79n2GPooYSPboueHptI9xogxtum1Uyll4HO0/bdKgvsvmI/kBw8b1oQPAMddcyCgmJls3MfgP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6506007)(122000001)(2616005)(6486002)(38070700005)(71200400001)(38100700002)(31686004)(508600001)(2906002)(31696002)(107886003)(186003)(86362001)(316002)(76116006)(91956017)(4326008)(8936002)(66446008)(66476007)(66946007)(64756008)(66556008)(83380400001)(36756003)(6512007)(26005)(54906003)(6916009)(8676002)(5660300002)(7416002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkRpbGdxV2doc2ZpTlRRYm5jSUh3ZEV2UWVQWlpKSnd1Q1p5QTlxRmFrQVRm?=
 =?utf-8?B?c24zRXg5aHlwaE5LUFhTZTZLeFVFRS9YVkx1T2tXMmJUclJhcnphbGYvbGY4?=
 =?utf-8?B?aTNWNGRDZDdVampwaVp3L2cvbXM3N0FBNlhmc2xweHF6ZC9XNEEreVcwWmEw?=
 =?utf-8?B?WnV3YXJnSkV4Q2JyV0J6M0Z1OUZjd0xTM0dxUnRRUHhvdWc4M09IajlGa0dq?=
 =?utf-8?B?SlB3ZGhqMW9xekVJa2Jza0IrWCtQRmgyOHY3ejN5NDJPNTV1d3BvcDJCUDJR?=
 =?utf-8?B?NzAwQ3BmckRNelJsT1owU2k0bU1kVUx5dGV1blpoTWNuL1E3WDNkT0plQmJ1?=
 =?utf-8?B?YVRDbDVlb3d5d09xKy9ZOTFPMzlUeHlrTU0wS2JzaGR2MGc4TE1PZTJDMUt4?=
 =?utf-8?B?cGpxMTBzZkQyTC9ramY3ZHM3cTh2YkFVS2JscUdIK3pna3g4NzdQWERvL1Jl?=
 =?utf-8?B?ZGdXQ0tNZWpIM3hzTzQ1TmhkTEhRQzFNb2N5Uml6T1BmVVhKbWhCcFpyS05r?=
 =?utf-8?B?R091OU4zSVFaUEM2N3VDSnJGYjdGVlZhOTRXc2pjUDI1YXFOQmNaN1FIZjRY?=
 =?utf-8?B?d3BEZCtMdk1Jdm9NR3ZiRnhjUURYbkpEaE5tOE5xYTJ2Z2tUbVhRTG9rdFZh?=
 =?utf-8?B?dmdONHBLOTBVWmNPVjIzQy9pZ243OWJteWN5VVBPRjVobWxnS2hvaWhlZjFz?=
 =?utf-8?B?WlNaam50ai9kY2IxaWRxU291Mnl1NUNaS1kxbjAxSFR3Umk5ZnVZL1poaU9t?=
 =?utf-8?B?ZHFHUnpHMkNYOTlEK0UxSFR5U3Vab0xwUUl0VmJHS0FPRXEvYURmM1dmY3NK?=
 =?utf-8?B?bUNWdTJCQ1RBdmQ4WW5kb3ZSMXFHV200VWxiM0RCVVpQWk9LREFwaUFURFdK?=
 =?utf-8?B?eWFqZjIrVlVMOGVWN2plS2lCOTViM0g4Yk1SWW15WVY0WnlRMkxvWC9zKzNI?=
 =?utf-8?B?emVEL3RxWkJhYjIxcXRNaWtDOGppSXFzVFl4NXRaa2Z0aG5xN3c0T3lsVlZy?=
 =?utf-8?B?OVJDNDNFWkRTUk9Oc3JiY0wrcTg4TGJRRFhRRU9tYzVjOHhCRm0xQnR0V3FF?=
 =?utf-8?B?MTVNTHZ6QnFWWXkydUlObGNkUkZPN0trNFVRY3JMZ0dZOXBhTlpPM1hvM1hO?=
 =?utf-8?B?Z1ZiWjVneTJIcFJFMXVjWUZJRmVLNVFuSFJ4Zk5qSUlBWlAzOFVscEJWcmJH?=
 =?utf-8?B?VUxHancxNGF4WjNrSnBBUTJXZVhRYTdxNnEwb1RYVjl2eUUrNWNGelJVMnFw?=
 =?utf-8?B?Vnk3QU5oYUhrNzZKTGROZldjeVA1OVJKaXZWeFYwaFY5NG9OYTJ2ZnQ0M1hL?=
 =?utf-8?B?OFV4Nkh5MHNPVjJCYWZpODY0T2NHWU1vbzYyMWt3SU1nOFEzUWhSQ1dSdGlR?=
 =?utf-8?B?TFM4VS81alZTalMzY25adjF1dmovVVpmbUZpQm9qSzZxblo4NyttOTg5MFNo?=
 =?utf-8?B?NHJ1bmZSanZDcldYNVZsZ0V4dHhoVmNIcENQV1pCUWExK1dSRHhkNnVwK2Yw?=
 =?utf-8?B?d3ZMekpib3UySUM5STFoZDQ0TGs2NU9GbnZua0JvNnZya0F3eTBzaDdURlJr?=
 =?utf-8?B?YTZRaFNPWlA4alFUVnQ3WGkzajVHM0hCQVN2cS9EdGdqcEE5ZmpaTXVkUnNv?=
 =?utf-8?B?UHVVLzlVckdDaGUxWHpEQWdiVFF4VFFsVkVURTI0ZW84TUltazJnWTZHOWc0?=
 =?utf-8?B?K0Y0RmhVa2xGbGpObVRRVUw4ZXQrYWdQbE9lY1JmbGZkcDhIMEN1bzBmM1ZM?=
 =?utf-8?B?aFo0WFBTWGpzU05adU5vZm1ra2hUeEp2bTZpNUs2TGRRTVlpbjZtMWR2bEhO?=
 =?utf-8?B?OUlHSDBxM3FRTWlkUEhKVTFJTDZRd1AzK3VjSm44QXFPaytYMUMyaVllQXM5?=
 =?utf-8?B?dG5iZGVuMHNRY2t5VURUUWp2Rm52ZGZ0SktOcFlDVUxGRDhjNkw4TlV4V2V2?=
 =?utf-8?B?WE0yVVF2NUl3YnhxV2luaWFZRG04YkdKWjJ4ZXBZMHUxWG9ZeDNLVlpLVkl1?=
 =?utf-8?B?ek1YemM1UmxDTkozaXdBM1NwczV6OWdvTzRrcitHWnE1SDcvRTI4SG92V3JL?=
 =?utf-8?B?TGVWVWx4SlVVNXpST1ZtYlR0c0ZNcWt0NE5mSFc1WGFpM3N4bHhLY3hXYXk3?=
 =?utf-8?B?T0IzSmhXZjZLWGxUZ09wQStKaFlBbzBKOXBJVExNZXNUMEkvaU1RN2wrUC9o?=
 =?utf-8?B?U2t4azRKZWV3M0JuempvM09DcmVhM2xydllKdjBNSzZmZzhpV25rdG5qbWh0?=
 =?utf-8?B?RE1xQ0oyZ1Y3U3YzVWp2ZDYzR3RlMmhocXEra1FEaktZRXRPcUl4QTcxM1pC?=
 =?utf-8?B?MlJGbjFJS3JKdDNqaFVCbDRZNFQvVGZmbVVqL2liL1ZlRk5McE55dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF436B36042F60459ACB93DA721F14F2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8296300-b985-42c4-da58-08d9e498210e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 09:00:28.8857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhXaNvY4jYnlcvOxDVfFDBMwgCTlUoABI4E0euoFgs8Jgzrhz74NccsuLEnNPetu6ILAD19F/FFoY6HtNrYTRZJNW11LbAslwFD+92WFvT0YpGyXlOWu9j6faA35+uxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7539
X-Proofpoint-ORIG-GUID: l9UNFj2XLX6p7c8tkNBR-mcDFjllA19Z
X-Proofpoint-GUID: l9UNFj2XLX6p7c8tkNBR-mcDFjllA19Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310060

SGksIFJvZ2VyIQ0KDQpPbiAzMS4wMS4yMiAxMDo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gRnJpLCBKYW4gMjgsIDIwMjIgYXQgMDI6MTU6MDhQTSArMDAwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgUm9nZXIsIEphbiENCj4+DQo+PiBPbiAxMy4wMS4y
MiAxMDo1OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBXZWQsIEphbiAxMiwgMjAy
MiBhdCAwNDo1Mjo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMTIuMDEu
MjAyMiAxNjo0MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgSmFuIDEy
LCAyMDIyIGF0IDAzOjU3OjM2UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9u
IDI1LjExLjIwMjEgMTI6MDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+
PiBAQCAtMzc5LDcgKzM5Niw2IEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYs
IHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplKQ0KPj4+Pj4+PiAgICANCj4+Pj4+
Pj4gICAgICAgICAgICBkYXRhID0gbWVyZ2VfcmVzdWx0KGRhdGEsIHRtcF9kYXRhLCBzaXplIC0g
ZGF0YV9vZmZzZXQsIGRhdGFfb2Zmc2V0KTsNCj4+Pj4+Pj4gICAgICAgIH0NCj4+Pj4+Pj4gLSAg
ICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+Pj4+ICAgIA0KPj4+Pj4+PiAg
ICAgICAgcmV0dXJuIGRhdGEgJiAoMHhmZmZmZmZmZiA+PiAoMzIgLSA4ICogc2l6ZSkpOw0KPj4+
Pj4+PiAgICB9DQo+Pj4+Pj4gSGVyZSBhbmQgLi4uDQo+Pj4+Pj4NCj4+Pj4+Pj4gQEAgLTQ3NSwx
MyArNDk4LDEyIEBAIHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGlu
dCByZWcsIHVuc2lnbmVkIGludCBzaXplLA0KPj4+Pj4+PiAgICAgICAgICAgICAgICBicmVhazsN
Cj4+Pj4+Pj4gICAgICAgICAgICBBU1NFUlQoZGF0YV9vZmZzZXQgPCBzaXplKTsNCj4+Pj4+Pj4g
ICAgICAgIH0NCj4+Pj4+Pj4gKyAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4+
Pj4+Pj4gICAgDQo+Pj4+Pj4+ICAgICAgICBpZiAoIGRhdGFfb2Zmc2V0IDwgc2l6ZSApDQo+Pj4+
Pj4+ICAgICAgICAgICAgLyogVGFpbGluZyBnYXAsIHdyaXRlIHRoZSByZW1haW5pbmcuICovDQo+
Pj4+Pj4+ICAgICAgICAgICAgdnBjaV93cml0ZV9odyhzYmRmLCByZWcgKyBkYXRhX29mZnNldCwg
c2l6ZSAtIGRhdGFfb2Zmc2V0LA0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0
YSA+PiAoZGF0YV9vZmZzZXQgKiA4KSk7DQo+Pj4+Pj4+IC0NCj4+Pj4+Pj4gLSAgICBzcGluX3Vu
bG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+Pj4+ICAgIH0NCj4+Pj4+PiAuLi4gZXZlbiBt
b3JlIHNvIGhlcmUgSSdtIG5vdCBzdXJlIG9mIHRoZSBjb3JyZWN0bmVzcyBvZiB0aGUgbW92aW5n
DQo+Pj4+Pj4geW91IGRvOiBXaGlsZSBwZGV2LT52cGNpIGluZGVlZCBkb2Vzbid0IGdldCBhY2Nl
c3NlZCwgSSB3b25kZXINCj4+Pj4+PiB3aGV0aGVyIHRoZXJlIHdhc24ndCBhbiBpbnRlbnRpb24g
dG8gYXZvaWQgcmFjaW5nIGNhbGxzIHRvDQo+Pj4+Pj4gdnBjaV97cmVhZCx3cml0ZX1faHcoKSB0
aGlzIHdheS4gSW4gYW55IGV2ZW50IEkgdGhpbmsgc3VjaCBtb3ZlbWVudA0KPj4+Pj4+IHdvdWxk
IG5lZWQganVzdGlmaWNhdGlvbiBpbiB0aGUgZGVzY3JpcHRpb24uDQo+Pj4+PiBJIGFncmVlIGFi
b3V0IHRoZSBuZWVkIGZvciBqdXN0aWZpY2F0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSwgb3IN
Cj4+Pj4+IGV2ZW4gYmV0dGVyIHRoaXMgYmVpbmcgc3BsaXQgaW50byBhIHByZS1wYXRjaCwgYXMg
aXQncyBub3QgcmVsYXRlZCB0bw0KPj4+Pj4gdGhlIGxvY2sgc3dpdGNoaW5nIGRvbmUgaGVyZS4N
Cj4+Pj4+DQo+Pj4+PiBJIGRvIHRoaW5rIHRoaXMgaXMgZmluZSBob3dldmVyLCBhcyByYWNpbmcg
Y2FsbHMgdG8NCj4+Pj4+IHZwY2lfe3JlYWQsd3JpdGV9X2h3KCkgc2hvdWxkbid0IGJlIGEgcHJv
YmxlbS4gVGhvc2UgYXJlIGp1c3Qgd3JhcHBlcnMNCj4+Pj4+IGFyb3VuZCBwY2lfY29uZl97cmVh
ZCx3cml0ZX0gZnVuY3Rpb25zLCBhbmQgdGhlIHJlcXVpcmVkIGxvY2tpbmcgKGluDQo+Pj4+PiBj
YXNlIG9mIHVzaW5nIHRoZSBJTyBwb3J0cykgaXMgYWxyZWFkeSB0YWtlbiBjYXJlIGluDQo+Pj4+
PiBwY2lfY29uZl97cmVhZCx3cml0ZX0uDQo+Pj4+IElPVyB5b3UgY29uc2lkZXIgaXQgYWNjZXB0
YWJsZSBmb3IgYSBndWVzdCAocmVhbGx5OiBEb20wKSByZWFkIHJhY2luZw0KPj4+PiBhIHdyaXRl
IHRvIHJlYWQgYmFjayBvbmx5IHBhcnQgb2Ygd2hhdCB3YXMgd3JpdHRlbiAoc28gZmFyKT8gSSB3
b3VsZA0KPj4+PiB0aGluayBpbmRpdmlkdWFsIG11bHRpLWJ5dGUgcmVhZHMgYW5kIHdyaXRlcyBz
aG91bGQgYXBwZWFyIGF0b21pYyB0bw0KPj4+PiB0aGUgZ3Vlc3QuDQo+Pj4gV2Ugc3BsaXQgNjRi
aXQgd3JpdGVzIGludG8gdHdvIDMyYml0IG9uZXMgd2l0aG91dCB0YWtpbmcgdGhlIGxvY2sgZm9y
DQo+Pj4gdGhlIHdob2xlIGR1cmF0aW9uIG9mIHRoZSBhY2Nlc3MsIHNvIGl0J3MgYWxyZWFkeSBw
b3NzaWJsZSB0byBzZWUgYQ0KPj4+IHBhcnRpYWxseSB1cGRhdGVkIHN0YXRlIGFzIGEgcmVzdWx0
IG9mIGEgNjRiaXQgd3JpdGUuDQo+Pj4NCj4+PiBJJ20gZ29pbmcgb3ZlciB0aGUgUENJKGUpIHNw
ZWMgYnV0IEkgZG9uJ3Qgc2VlbSB0byBmaW5kIGFueXRoaW5nIGFib3V0DQo+Pj4gd2hldGhlciB0
aGUgRUNBTSBpcyBhbGxvd2VkIHRvIHNwbGl0IG1lbW9yeSB0cmFuc2FjdGlvbnMgaW50byBtdWx0
aXBsZQ0KPj4+IENvbmZpZ3VyYXRpb24gUmVxdWVzdHMsIGFuZCB3aGV0aGVyIHRob3NlIGNvdWxk
IHRoZW4gaW50ZXJsZWF2ZSB3aXRoDQo+Pj4gcmVxdWVzdHMgZnJvbSBhIGRpZmZlcmVudCBDUFUu
DQo+PiBTbywgd2l0aCB0aGUgYWJvdmUgaXMgaXQgc3RpbGwgZmluZSBmb3IgeW91IHRvIGhhdmUg
dGhlIGNoYW5nZSBhcyBpcyBvcg0KPj4geW91IHdhbnQgdGhpcyBvcHRpbWl6YXRpb24gdG8gZ28g
aW50byBhIGRlZGljYXRlZCBwYXRjaCBiZWZvcmUgdGhpcyBvbmU/DQo+IFRoZSBjaGFuZ2Ugc2Vl
bXMgc2xpZ2h0bHkgY29udHJvdmVyc2lhbCwgc28gSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0DQo+
IGlmIGl0IHdhcyBzcGxpdCBpbnRvIGEgc2VwYXJhdGUgcGF0Y2ggd2l0aCBhIHByb3BlciByZWFz
b25pbmcgaW4gdGhlDQo+IGNvbW1pdCBtZXNzYWdlLg0KU3VyZSwgd2lsbCBtb3ZlIGludG8gYSBk
ZWRpY2F0ZWQgcGF0Y2ggdGhlbg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xl
a3NhbmRy

