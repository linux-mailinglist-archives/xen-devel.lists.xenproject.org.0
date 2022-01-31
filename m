Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B74A48E3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 14:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263119.455708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEXCn-0000Rg-CD; Mon, 31 Jan 2022 13:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263119.455708; Mon, 31 Jan 2022 13:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEXCn-0000Pq-8s; Mon, 31 Jan 2022 13:58:53 +0000
Received: by outflank-mailman (input) for mailman id 263119;
 Mon, 31 Jan 2022 13:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEXCl-0000Pk-Bk
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 13:58:51 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9a9f0f9-829d-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 14:58:49 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VCwMD3015484;
 Mon, 31 Jan 2022 13:58:45 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxbec9e1c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:58:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5472.eurprd03.prod.outlook.com (2603:10a6:802:ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 13:58:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 13:58:40 +0000
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
X-Inumbo-ID: e9a9f0f9-829d-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+T2YGYDqQmCDmRdhW2QR/abkTeP4/ggIbOiYFu0R2TFqt37Q+GQzI73aV6LWwV+VPd/K1RObKxmxJXwIs3c7EvZxr/RCIQmPe0DqQjkztYVncQsdGWzP39PeztQnQm1RWHcZZDIdKTjcjEbMN+mslKE8RKneCZ0ouMcHd5tS3ih0xyMTtP0yJ3OnrCcistudGyXzMABxrlY02JLphOlbGU7eFTQa1WQwUrMDraSXxbdFLzekwaEXsBlaKGCKd6aq3CC4n4tge9lRs4pJaBELXzufA1zPoXxLG/yWcNFUtXELIHpGsxsYqMJCIj/r0H4i8wecVG8b1m+mQY0nU4SFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujaAEE0WBFSV0ZMTMUNXhySs4TvUlG+zXbtFZwcAI+w=;
 b=VHHt/TcQ/Ofe3PRkgjdxwugkVKBq/CO9nCxLtBcRGUvs6NmzG1up6M81/DT/MpWQPwSf94VJlqyzMt+QasJtgWftQ0Ts8Ji3be3NjqQHVBOlKLbV4XlqaG6lV6x1ZeUVHXhO6d1ZDf/UEOtS6pHYTbWDAh19pUO3F9wfUydJL3sToWyfmVgx5+b3tgeKBDzqxFQfXS9k6sHbmU8Vfq4P7T5Av2y660xccD60HoDSUFM64/qUkNgmNvykyt0cYq2y4sK0U65RPvqlb3uvM20Pt9+gcXHJZtPpDbhyW+eKlV7fAMeNK70rp92J//gGjgT0boHtwRAjMZ3motDYK6lCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujaAEE0WBFSV0ZMTMUNXhySs4TvUlG+zXbtFZwcAI+w=;
 b=MlFEDzvRRSHCe/AWBXh7IylPoeXgdc2l36oOmGkrBbzXE3DfDDNYAUjQf7YvNYUcTybVuAV6SGfKrUUU+ud60OPjZMbqC6yDgUJ+cAmaw8w4g5ez8Yiig2MnJedRX6TP71BM1YIhLuyqcUSqd22BmI0UJVhu94RLE+uHk1n8ecvSi4huCOvoPJ1LCM0RXDKbJrTEBvTtp75d1b55D9Vnz7WX6e/CHo2UX/C3gaTsGX+GrH1Qsk8Co2gBP1DPXoTXtH6YJTTVSkMVzx7hhvMnGQYhhgRmpvxG8dtard97Z98yDP341bb7MXIdnMlrss31Xb37DNxRGJBAFvY3VxvAQw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AIAACECAgAADxgCAAARsgIAAHxiAgAABegCAAAGFAIAAAqwAgAACFgA=
Date: Mon, 31 Jan 2022 13:58:40 +0000
Message-ID: <eb7f4f5f-63a6-57a8-80a2-a93c73cf04f1@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
 <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
 <0b20be9a-61e6-d286-b379-92c29ee9a804@epam.com>
 <2cfb6134-ab5e-3231-45f4-692c31302b1e@suse.com>
 <39966ef4-ed69-3bf5-ef6b-a4790c7164a2@epam.com>
 <75b6e181-c0ab-a95b-2e17-7dc0b3dce8e9@suse.com>
In-Reply-To: <75b6e181-c0ab-a95b-2e17-7dc0b3dce8e9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 834682ae-abf9-407d-3572-08d9e4c1c96f
x-ms-traffictypediagnostic: VE1PR03MB5472:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB54722D7907F402DFAF45D4A0E7259@VE1PR03MB5472.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RKC8yNzgaAJ+mc4DPDsaEs+SOSjVVO6GK/YVtcYpCTycHjvpk7QNDFbB+xtCPja7P9i8DqqglnIX+DybxQLVX6oN+OuMz8HPXwVkv6pniZHcEmCbR0DiMLHE15cCFTWgZjWZvm7tVchp7qUK+5NQZhNI+uucFnr0NzI7DxMgSyhHWQn8LOathHIlC8CwvZRulF7vX1HZIR5fVHBY8WU8nBWTlV3g3idl4agE58iS9q8odDVAkfzF1+sRMEjbc+hgPhMXosLxq7gbst+XsHl3AijQkQ3Dex4gjT3zcm/GXhZMtX/0Ppa4MzgfUiKHiyhu2byRGK06E/MXhzcBKh2/YN23iettKK+Q9ltBccRXvWXSLFZ0RwtOoITnSudXtXm1B9fPwlf02gt2Q7jo404gzFDxp3w1BzYhGhgf1UdDPsz0RuhTnuJX3MrR3mBRZsptkSKxBGQOkLIHUWb7B/yE1ejQqYfyTr/vCpqv32Ku6cKvD56JGcgNN34qg58LYShE2aQTx9rErJ+pv5rIjucmMKO8yTLqZMuAacz475e7YrDo1aN1A5aHZYPdd1lqIpvF59quM2YZs/TolgR2LMGlGmBbifdT/53U7z1M/bLfM20bInTHp21m9tb4t7jmpy+4hFsqNUooKb1lMGo1Orr3D2TWBRQdWKDZVG5JutE9H+zCLTpPfo4D5sEyn87tJohZtBsQLR4UZlqpdXgHymNS9DaPMhqFJfGxLGhoTF0ZAB6tlUSJA9/l/B/4NYhexcXQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(31696002)(71200400001)(186003)(26005)(83380400001)(5660300002)(7416002)(76116006)(66476007)(66556008)(36756003)(66446008)(64756008)(66946007)(86362001)(91956017)(38070700005)(122000001)(31686004)(2906002)(8936002)(508600001)(8676002)(6506007)(6486002)(6512007)(53546011)(38100700002)(54906003)(316002)(6916009)(4326008)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VTVZMURHTjAwT29Wb2VINDJyeFI0d1MzWXdmOVYyWG9qN1lyeHdEQTQybHpq?=
 =?utf-8?B?d3NQN2FLL20wQ0hiR1ZnL1d4eHQwekNtb2JicDdSQXE3SWZncDFHbnIyQWs5?=
 =?utf-8?B?TUtBRnNQTzdId2pYcmlDYnhXemtjSjFPNW12dUV1M1dVbUlOTXp6Zzd6dXFu?=
 =?utf-8?B?Vys4N1BxckdSZFJwZmVOK3B5VTMxOGVOM1h5ZTlpNTJnenc4KzN6OXVHUnlC?=
 =?utf-8?B?Mi9jMzlRM2VqbHAza3pmVjFyNTJsR3NQanlReTZwTUMvM0ZCRXMyeWZvZHlF?=
 =?utf-8?B?SFZjVHdSbS9MNTNtTHU1dVk4cUdQVllONXFyVTFPUm9RK3V3SmY2Y0pzQ1lz?=
 =?utf-8?B?dzVPN1RtbkVXemlaS0Rjayt0d2pJeFJHbHZudldKcFhPNzM4WmVkSnk0T2pj?=
 =?utf-8?B?NENLZ1JrKzY5YXBoR3BKQ25Pc0tQNFRSaitUclh5VVU5ME0yY1lzTDYrcFEw?=
 =?utf-8?B?S210R2E3aFBmQitpR1JQRXpMSEJVQnRsbVNLSGx0dE5LL253Z3l3OVljOHpr?=
 =?utf-8?B?dXFOUFFyNEVBQzdYc3B6c1JmUVVsMm9GR0pBbnFFTnJrd3BUUU0xQnRySEpF?=
 =?utf-8?B?a2d5anQ5YmNGaTRqK0JsSmU2cGszM2tueUZqelZGbFRiOWZXVVpsZDVzUzZI?=
 =?utf-8?B?YlM3Z1ZoYkdFZlZwMlJ5aGE5cFlrMWk5T2cxZXc4LzIwVEdMQXloY3VsdkJE?=
 =?utf-8?B?N1Vua2dBVnc2VXZ4R0VQUTYvRnRHSmdGRXdmM1BCeiswbTdHdTJ2TDMwOGpq?=
 =?utf-8?B?L3E2Sk5yQnAxQkwzdUpoWXpxNnlqTnVrRlJTc0FxTFd2N2tqc0tVSXg4WENM?=
 =?utf-8?B?MjBZRkl5U0Q1a0xNMFQxNGRsbEZrM0NFblRvOXJ5STQwV25VT3JramsyYU9Z?=
 =?utf-8?B?WGh6KzhKeHdmbUFCY1BYdWNsaW54Wnk5ZFlkVnhGcWp5VzVmTm1ZZmwzWUhy?=
 =?utf-8?B?dEE3S094RnFMWHZOMCtuaVJSRUR2MVByMjRNanAzQ0V6dGVOeDRwN3FIK3dI?=
 =?utf-8?B?UmN4eVN2Y0tkS1NZZlowQTlDTmpGVk04cEoreTBaRWlYOEJsWE5oYUt0am1k?=
 =?utf-8?B?a3B5U2RLWkxWS0pYNzhISWhsT0I1ZVdEbmdEOUxFU0NUVEsrdTc4R3RrNlM1?=
 =?utf-8?B?aE5sTUlqUDluM1A2NFNwSjRtZFNXcU80TTZFZUxEWmdRYmk1RUhFQlR3b09a?=
 =?utf-8?B?TmNVMEhPd2xza2FLTDJvUkN6MXdvbXNBTU1OOEh1aEZjVEtraDluS25VQzhy?=
 =?utf-8?B?MkdMWGZYY1ZseThqWGdtQXpjVW42SDJlVWdQajBaMjhVeWFLV29Edkh5SldG?=
 =?utf-8?B?SlZ5Mzc4L1Izb0hRSmtpaFZFT09PRHBjUGN0cU56NGVRMzhqTUpXWlJRZ3Bh?=
 =?utf-8?B?SmVQM3Bub092YTFJMG5UN1pUTXppK2RGbm5TWktEcGtiTlV5aFFkRmtFUGRJ?=
 =?utf-8?B?UnNyRnVGZFZnb3RudEVWbE9UZW53bCtmZHlNVmovVVJtT0Y1a2tUQWVpMjBl?=
 =?utf-8?B?L2ZkR1FQeXBVTFcwK0JXa3owZDRSRjNkT2Q0c01JbHJ4dkM0OXJvaXB5SzFI?=
 =?utf-8?B?OXNaRDdUcUlUbzk3bGhsZnVES1d2WFEzNXNIckJmbjhHQ0tGRnh6NFZ6TjZy?=
 =?utf-8?B?YTJ1c2YxRmFzMWkzWmd6N2tNa05hZk9nWDJrSktKcjAxTHdNZ1F3RjFRSVVh?=
 =?utf-8?B?YkVnRW5JM3I3M2V3a1dvakZkSmZnVWVFQ3JGVEJJczgvNXZvek1jVDRhRzZv?=
 =?utf-8?B?TEtxYTF6cnE3bjRqbnRPYWhGMFI5bnN1OS9vZkN4Qm5XaXJrYkd4Y2hUc3Jk?=
 =?utf-8?B?ckg5QWljRHBSaGpheXNrb2QvV1F3TlZZU3lucFZmTmFTS0VqV3paU0FGeG12?=
 =?utf-8?B?eVpiNXR2U0RBN0psRlVTbTRtOUEydTIxRHdLRjV4cDBYbHZWTnV4blB4OC9X?=
 =?utf-8?B?dGxkd2lyMksraURiZVdzQ0hvSXZzaVlZMHY2ZWZUY2lYc0lIWGxJZG9SelJD?=
 =?utf-8?B?SGRxek1YWmNRNWFCaFpJclVJRUF0NDlBRSsrcTdGZXV1UUtCZUFKOVN3Tldj?=
 =?utf-8?B?bXp3ZXV6TVV5VS9EVlJTb3pWcjBOekQ0TVFaUk1xVFRtRGp4YVpPU0ZwbDZS?=
 =?utf-8?B?VmttMUFrV1NMcFZLOWNTYjhPanVWZ3dxK204aEFYNWpvUHVyQmNDV0dFRVBF?=
 =?utf-8?B?TndPbWZDZFhodW5RRDJNSXJqUi9zQWRqb01lUmZIL3lLTEo1UytWWkZjWVNI?=
 =?utf-8?B?NSs5dC9mbWtBUTlTeE1sb2RaUEdSMnJxR3lvbkI2SnFQcTB6ak9yZ1VEMjB0?=
 =?utf-8?B?N3pBWXJDL1JnTUJvWXE1WTdZTlpjMmlCcTBNME9HK2xOV1Y3bzJxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A922F4ECD5A3F34DA9120F268610AC3B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834682ae-abf9-407d-3572-08d9e4c1c96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 13:58:40.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 09j20KdhH1Sh9ugpccZ9Z4vuz3XHIeuc47y5F3MM/5jl8Psnf1WjWOlidBEuXRN0rmuY7wCG1azRrOPMkVOXaYOFARql6ZPUOfaGM7RSRaWHQjzjciGPjg5Mmt3r4X7c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5472
X-Proofpoint-GUID: DzfzGDHoJjtFogZrRGxjVXe4yzMmH7cJ
X-Proofpoint-ORIG-GUID: DzfzGDHoJjtFogZrRGxjVXe4yzMmH7cJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_05,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 priorityscore=1501 mlxlogscore=750
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310093

DQoNCk9uIDMxLjAxLjIyIDE1OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzEuMDEuMjAy
MiAxNDo0MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAzMS4wMS4yMiAx
NTozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzEuMDEuMjAyMiAxNDozMCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDMxLjAxLjIyIDEzOjM5LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDMxLjAxLjIwMjIgMTI6MjMsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDMxLjAxLjIyIDEzOjEwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOg0KPj4+Pj4+PiBSaWdodCAoc2VlIG15IHByZXZpb3VzIHJlcGx5IHRvIHRoaXMgY29t
bWVudCkuIEkgdGhpbmsgaXQgd291bGQgYmUNCj4+Pj4+Pj4gZWFzaWVyIChhbmQgY2xlYW5lcikg
aWYgeW91IHN3aXRjaGVkIHRoZSBkZWZhdWx0IGJlaGF2aW9yIHJlZ2FyZGluZw0KPj4+Pj4+PiB1
bmhhbmRsZWQgcmVnaXN0ZXIgYWNjZXNzIGZvciBkb21VcyBhdCB0aGUgc3RhcnQgb2YgdGhlIHNl
cmllcyAoZHJvcA0KPj4+Pj4+PiB3cml0ZXMsIHJlYWRzIHJldHVybnMgfjApLCBhbmQgdGhlbiB5
b3Ugd29uJ3QgbmVlZCB0byBhZGQgYWxsIHRob3NlDQo+Pj4+Pj4+IGR1bW15IGhhbmRsZXIgdG8g
ZHJvcCB3cml0ZXMgYW5kIHJldHVybiB+MCBmb3IgcmVhZHMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEl0
J3MgZ29pbmcgdG8gYmUgbW9yZSB3b3JrIGluaXRpYWxseSBhcyB5b3Ugd291bGQgbmVlZCB0byBz
dXBwb3J0DQo+Pj4+Pj4+IHBhc3N0aHJvdWdoIG9mIG1vcmUgcmVnaXN0ZXJzLCBidXQgaXQncyB0
aGUgcmlnaHQgYXBwcm9hY2ggdGhhdCB3ZQ0KPj4+Pj4+PiBuZWVkIGltcGxlbWVudGF0aW9uIHdp
c2UuDQo+Pj4+Pj4gV2hpbGUgSSBhZ3JlZSBpbiBnZW5lcmFsLCB0aGlzIGVmZmVjdGl2ZWx5IG1l
YW5zIHRoYXQgSSdsbCBuZWVkIHRvIHByb3ZpZGUNCj4+Pj4+PiBoYW5kbGluZyBmb3IgYWxsIFBD
SWUgcmVnaXN0ZXJzIGFuZCBjYXBhYmlsaXRpZXMgZnJvbSB0aGUgdmVyeSBzdGFydC4NCj4+Pj4+
PiBPdGhlcndpc2Ugbm8gZ3Vlc3QgYmUgYWJsZSB0byBwcm9wZXJseSBpbml0aWFsaXplIGEgUENJ
IGRldmljZSB3aXRob3V0IHRoYXQuDQo+Pj4+Pj4gT2YgY291cnNlLCB3ZSBtYXkgd2FudCBzdGFy
dGluZyBmcm9tIHN0dWJzIGluc3RlYWQgb2YgcHJvcGVyIGVtdWxhdGlvbiwNCj4+Pj4+PiB3aGlj
aCB3aWxsIGRpcmVjdCB0aGUgYWNjZXNzIHRvIHJlYWwgSFcgYW5kIGxhdGVyIG9uIHdlIGFkZCBw
cm9wZXIgZW11bGF0aW9uLg0KPj4+Pj4+IEJ1dCwgYWdhaW4sIHRoaXMgaXMgZ29pbmcgdG8gYmUg
YSByYXRoZXIgYmlnIHBpZWNlIG9mIGNvZGUgd2hlcmUgd2UgbmVlZA0KPj4+Pj4+IHRvIGV4cGxp
Y2l0bHkgaGFuZGxlIGV2ZXJ5IHBvc3NpYmxlIGNhcGFiaWxpdHkuDQo+Pj4+PiBTaW5jZSB0aGUg
dHdvIHN1Yi10aHJlYWRzIGFyZSBub3cgYWJvdXQgZXhhY3RseSB0aGUgc2FtZSB0b3BpYywgSSdt
DQo+Pj4+PiBhbnN3ZXJpbmcgaGVyZSBpbnN0ZWFkIG9mIHRoZXJlLg0KPj4+Pj4NCj4+Pj4+IE5v
LCB5b3UgYXJlIG5vdCBnb2luZyB0byBuZWVkIHRvIGVtdWxhdGUgYWxsIHBvc3NpYmxlIGNhcGFi
aWxpdGllcy4NCj4+Pj4+IFdlIChvciByZWFsbHkgcWVtdSkgZG9uJ3QgZG8gdGhpcyBvbiB4ODYg
ZWl0aGVyLiBDZXJ0YWluIGNhcGFiaWxpdGllcw0KPj4+Pj4gbWF5IGJlIGEgbXVzdCwgYnV0IG5v
dCBldmVyeXRoaW5nLiBUaGVyZSBhcmUgYWxzbyBkZXZpY2Ugc3BlY2lmaWMNCj4+Pj4+IHJlZ2lz
dGVycyBub3QgY292ZXJlZCBieSBhbnkgY2FwYWJpbGl0eSBzdHJ1Y3R1cmVzIC0gd2hhdCB0byBk
byB3aXRoDQo+Pj4+PiB0aG9zZSBpcyBldmVuIG1vcmUgb2YgYSBxdWVzdGlvbi4NCj4+Pj4+DQo+
Pj4+PiBGdXJ0aGVybW9yZSBmb3Igc29tZSBvZiB0aGUgZmllbGRzIGp1c3RpZmljYXRpb24gd2h5
IGFjY2VzcyB0byB0aGUNCj4+Pj4+IHJhdyBoYXJkd2FyZSB2YWx1ZSBpcyBmaW5lIGlzIGdvaW5n
IHRvIGJlIGVhc3k6IHIvbyBmaWVsZHMgbGlrZQ0KPj4+Pj4gdmVuZG9yIGFuZCBkZXZpY2UgSUQs
IGZvciBleGFtcGxlLiBCdXQgZXZlcnkgYml0IHlvdSBhbGxvdyBkaXJlY3QNCj4+Pj4+IGFjY2Vz
cyB0byBuZWVkcyB0byBjb21lIHdpdGgganVzdGlmaWNhdGlvbi4NCj4+Pj4+DQo+Pj4+Pj4gQXQg
dGhlIG1vbWVudCB3ZSBhcmUgbm90IGdvaW5nIHRvIGNsYWltIHRoYXQgdlBDSSBwcm92aWRlcyBh
bGwgbWVhbnMgdG8NCj4+Pj4+PiBwYXNzIHRocm91Z2ggYSBQQ0kgZGV2aWNlIHNhZmVseSB3aXRo
IHRoaXMgcmVzcGVjdCBhbmQgdGhpcyBpcyB3aHkgdGhlIGZlYXR1cmUNCj4+Pj4+PiBpdHNlbGYg
d29uJ3QgZXZlbiBiZSBhIHRlY2ggcHJldmlldyB5ZXQuIEZvciB0aGF0IHJlYXNvbiBJIHRoaW5r
IHdlIGNhbiBzdGlsbA0KPj4+Pj4+IGhhdmUgaW1wbGVtZW50ZWQgb25seSBjcnVjaWFsIHNldCBv
ZiBoYW5kbGVycyBhbmQgc3RpbGwgYWxsb3cgdGhlIHJlc3QgdG8NCj4+Pj4+PiBiZSByZWFkL3dy
aXRlIGRpcmVjdGx5IHdpdGhvdXQgZW11bGF0aW9uLg0KPj4+Pj4gSSB0aGluayB5b3UgbmVlZCB0
byBzZXBhcmF0ZSB3aGF0IHlvdSBuZWVkIGZvciBkZXZlbG9wbWVudCBmcm9tIHdoYXQNCj4+Pj4+
IGdvZXMgdXBzdHJlYW06IEZvciBkZXYgcHVycG9zZXMgeW91IGNhbiB2ZXJ5IHdlbGwgaW52ZXJ0
IHRoZSBwb2xpY3kNCj4+Pj4+IGZyb20gd2hpdGUtIHRvIGJsYWNrLWxpc3RpbmcuIEJ1dCBpZiB3
ZSBhY2NlcHRlZCB0aGUgbGF0dGVyIGludG8gdGhlDQo+Pj4+PiBtYWluIHRyZWUsIHRoZSByaXNr
IHdvdWxkIGJlIHRoZXJlIHRoYXQgc29tZXRoaW5nIGdldHMgbWlzc2VkIGF0IHRoZQ0KPj4+Pj4g
dGltZSB3aGVyZSB0aGUgcGVybWlzc2lvbiBtb2RlbCBnZXRzIGNoYW5nZWQgYXJvdW5kLg0KPj4+
Pj4NCj4+Pj4+IFlvdSBjb3VsZCBldmVuIGhhdmUgYSBub24tZGVmYXVsdCBtb2RlIG9wZXJhdGlu
ZyB0aGUgd2F5IHlvdSB3YW50IGl0DQo+Pj4+PiAoYWxvbmcgdGhlIGxpbmVzIG9mIHBjaWJhY2sn
cyBwZXJtaXNzaXZlIG1vZGUpLCBhbGxvd2luZyB5b3UgdG8gZ2V0DQo+Pj4+PiBhd2F5IHdpdGhv
dXQgbmVlZGluZyB0byBjYXJyeSBwcml2YXRlIHBhdGNoZXMuIFRoaW5ncyBtYXkgYWxzbw0KPj4+
Pj4gaW5pdGlhbGx5IG9ubHkgd29yayBpbiB0aGF0IG1vZGUuIEJ1dCB0aGUgZGVmYXVsdCBzaG91
bGQgYmUgYSBtb2RlDQo+Pj4+PiB3aGljaCBpcyBzZWN1cmUgKGFuZCB3aGljaCBwZXJoYXBzIGlu
aXRpYWxseSBvZmZlcnMgb25seSB2ZXJ5IGxpbWl0ZWQNCj4+Pj4+IGZ1bmN0aW9uYWxpdHkpLg0K
Pj4+PiBPaywgc28gdG8gbWFrZSBpdCBjbGVhcjoNCj4+Pj4gMS4gV2UgZG8gbm90IGFsbG93IHVu
aGFuZGxlZCBhY2Nlc3MgZm9yIGd1ZXN0czogZm9yIHRoYXQgSSB3aWxsIGNyZWF0ZSBhDQo+Pj4+
IGRlZGljYXRlZCBwYXRjaCB3aGljaCB3aWxsIGltcGxlbWVudCBzdWNoIHJlc3RyaWN0aW9ucy4g
U29tZXRoaW5nIGxpa2UNCj4+Pj4gdGhlIGJlbG93IChmb3IgYm90aCB2UENJIHJlYWQgYW5kIHdy
aXRlKToNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIv
eGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gaW5kZXggYzVlNjc0OTFjMjRmLi45ZWYyYTFi
NWFmNTggMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IEBAIC0zNDcsNiArMzQ3LDcgQEAgdWlu
dDMyX3QgdnBjaV9yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWdu
ZWQgaW50IHNpemUpDQo+Pj4+ICAgIMKgwqDCoMKgIGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVy
ICpyOw0KPj4+PiAgICDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgZGF0YV9vZmZzZXQgPSAwOw0KPj4+
PiAgICDCoMKgwqDCoCB1aW50MzJfdCBkYXRhID0gfih1aW50MzJfdCkwOw0KPj4+PiArwqDCoMKg
IGJvb2wgaGFuZGxlZCA9IGZhbHNlOw0KPj4+Pg0KPj4+PiAgICDCoMKgwqDCoCBpZiAoICFzaXpl
ICkNCj4+Pj4gICAgwqDCoMKgwqAgew0KPj4+PiBAQCAtNDA1LDYgKzQwNiw4IEBAIHVpbnQzMl90
IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGlu
dCBzaXplKQ0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgIGlmICggY21wID4gMCApDQo+Pj4+ICAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+Pj4NCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGhhbmRsZWQgPSB0cnVlOyAvKiBGb3VuZCB0aGUgaGFuZGxlciBmb3IgdGhpcyBhY2Nl
c3MuICovDQo+Pj4+ICsNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGVtdS5vZmZzZXQg
PCByLT5vZmZzZXQgKQ0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgIHsNCj4+Pj4gICAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIEhlYWRpbmcgZ2FwLCByZWFkIHBhcnRpYWwgY29udGVudCBm
cm9tIGhhcmR3YXJlLiAqLw0KPj4+PiBAQCAtNDMyLDYgKzQzNSwxMCBAQCB1aW50MzJfdCB2cGNp
X3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6
ZSkNCj4+Pj4gICAgwqDCoMKgwqAgfQ0KPj4+PiAgICDCoMKgwqDCoCBzcGluX3VubG9jaygmcGRl
di0+dnBjaV9sb2NrKTsNCj4+Pj4NCj4+Pj4gK8KgwqDCoCAvKiBBbGwgdW5oYW5kbGVkIGd1ZXN0
IHJlcXVlc3RzIHJldHVybiBhbGwgMSdzLiAqLw0KPj4+PiArwqDCoMKgIGlmICggIWlzX2hhcmR3
YXJlX2RvbWFpbihkKSAmJiAhaGFuZGxlZCApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
fih1aW50MzJfdCkwOw0KPj4+PiArDQo+Pj4+ICAgIMKgwqDCoMKgIGlmICggZGF0YV9vZmZzZXQg
PCBzaXplICkNCj4+Pj4gICAgwqDCoMKgwqAgew0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgIC8q
IFRhaWxpbmcgZ2FwLCByZWFkIHRoZSByZW1haW5pbmcuICovDQo+Pj4gRXhjZXB0IHRoYXQgbGlr
ZSBmb3IgdGhlICJ0YWlsaW5nIGdhcCIgeW91IGFsc28gbmVlZCB0byBhdm9pZCB0aGUNCj4+PiAi
aGVhZGluZyBnYXAiIGVuZGluZyB1cCBpbiBhIHJlYWQgb2YgdGhlIHVuZGVybHlpbmcgaGFyZHdh
cmUNCj4+PiByZWdpc3Rlci4gRWZmZWN0aXZlbHkgeW91IHdhbnQgdG8gZGVhbCBwcm9wZXJseSB3
aXRoIGFsbA0KPj4+IHZwY2lfcmVhZF9odygpIGludm9jYXRpb25zIChpbmNsdWRpbmcgdGhlIG9u
ZSB3aGVuIG5vIHBkZXYgd2FzDQo+Pj4gZm91bmQsIHdoaWNoIGZvciBhIERvbVUgbWF5IHNpbXBs
eSBtZWFuIGRvbWFpbl9jcmFzaCgpKS4NCj4+IFllcy4gQW5kIHdpdGggdGhlIGFib3ZlIHBhdGNo
IEkgY2FuIG5vdyByZW1vdmUgdGhlICJUT0RPIHBhdGNoIiB0aGVuPw0KPj4gQmVjYXVzZSBpdCBp
cyBzYXlpbmcgdGhhdCB3ZSBhbGxvdyBhY2Nlc3MgdG8gdGhlIHJlZ2lzdGVycywgYnV0IGl0IGlz
IG5vdCBzYWZlLg0KPj4gQW5kIG5vdywgaWYgd2UgZGlzYWJsZSB0aGF0IGFjY2VzcywgdGhlbiBU
T0RPIHNob3VsZCBiZSBhYm91dCB0aGUgbmVlZCB0bw0KPj4gaW1wbGVtZW50IGVtdWxhdGlvbiBm
b3IgYWxsIHRoZSByZWdpc3RlcnMgd2hpY2ggYXJlIG5vdCB5ZXQgaGFuZGxlZCB3aGljaCBpcw0K
Pj4gb2J2aW91cy4NCj4gWWVzLCBJIHRoaW5rIHRoYXQgb3RoZXIgcGF0Y2ggdGhlbiBzaG91bGQg
aGF2ZSBubyB1c2UgYW55bW9yZS4gKFRvIGJlDQo+IGhvbmVzdCBJIGRvbid0IHJlY2FsbCBzdWNo
IGEgcGF0Y2ggYW55d2F5LikNClRoaXMgaXMgIltQQVRDSCB2NSAxNC8xNF0gdnBjaTogYWRkIFRP
RE8gZm9yIHRoZSByZWdpc3RlcnMgbm90IGV4cGxpY2l0bHkgaGFuZGxlZCINCmluIHRoaXMgc2Vy
aWVzDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

