Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679824296F4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 20:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206503.362100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma04l-0003zh-I8; Mon, 11 Oct 2021 18:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206503.362100; Mon, 11 Oct 2021 18:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma04l-0003xl-El; Mon, 11 Oct 2021 18:31:03 +0000
Received: by outflank-mailman (input) for mailman id 206503;
 Mon, 11 Oct 2021 18:31:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRsb=O7=epam.com=prvs=0918241709=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1ma04j-0003xf-M4
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 18:31:01 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 617937c8-2ac1-11ec-80f0-12813bfff9fa;
 Mon, 11 Oct 2021 18:30:59 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BI419E003994; 
 Mon, 11 Oct 2021 18:30:55 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bmt7dr2h7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 18:30:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5698.eurprd03.prod.outlook.com (2603:10a6:208:171::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 18:30:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 18:30:51 +0000
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
X-Inumbo-ID: 617937c8-2ac1-11ec-80f0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNgOcWshRjKQRbYbo2rGzVtB7SBl86h9sNLgAKDtRMctyWh/H0b4iCwSdFgoGNxp7aMQNmew8k1T/X0LB1zh5ZjwPFlmvB5VXMRyBVB23ACiM7HO3Ah2X8J/Fd0AAm3X8DEk81/ODFKicxm4+Vx1DwggMai0oqV3S2VLgFwdMUoFPbScsCU2IWQrTITPFcrCKICUfkBeVtfS63Am/wOHtVT0SMfiv2WPnkbuIsPlaI3r339QAUbBFgrhVYpi8U7AeC8SWo/laqn0CUk7+5uWy99+yVKuLbnAPQdzxapvMU7YRmjGuSIfa6ld0ZcvwQ0nmP4VkD0kkEaneYfno0LFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz0PKuct4bXofYOTPrFEEgYI039qmUUKQNsSnLtdC0w=;
 b=BVh7NIGCnYdgLEXVQOqoxA8YF7VxulSiM4uJjBUlvbtv20AOEXc4eSkpokSqo5Sr5uTKMxJkFQbB6r5Zmz7I5uzFijpmTqwERyqWAbUF/AHvZ1PGOqZhNgdRarqMjwwSeA6LwQPRPA2MYuo0pWusk3N6KieMCPcsyHdrXFMP7K0GEZQqasAMz6+64NRAXzoE4ICQIZhJe9eFbe2n+O39Wjdo9CkppT0+gpTlC/AbNPAQ0/hs9BqLAcqpkSj0eKtzxlKS6gdMZeQvuJZd5Mwywj18y4u8KRS6ga5zqY+fnELKOuqxO19N9ylnbDAQQxnWj3ZeFto/CcnJQBWupimHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz0PKuct4bXofYOTPrFEEgYI039qmUUKQNsSnLtdC0w=;
 b=Dy5D5loUsrSuTncxhAg9hkzmDz0YoXTGdXMDP2QIVuio2kd1ESgZtkcYiCTjZlBs966BjjSmvkTZ/+FT7x4JGPTE53KLHBzVF36+MINzlOVgttT++QCmtTwuxMamA030Yyzpjv9qiIji802oG8hQHnWz9Au/kUL6aj0M3/LKaopbUM+oTg5+Aufi3N8NbePyybIviAL8MShUgRYLJlNwOHrpj4c+OcMTp5jblMUld4J2fGYpi71d0UVNXGqVYGbwFk5+dT0AelrtwrIlb6OQPfZOIet0ldH83qdxp4zBd8gh0QZyigknpzk1Y78FWgb0s+jKGEOOkBenSAeEQQD66g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andre Przywara <Andre.Przywara@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: 
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavNphKAgABZ5QCAAAISgIAABoqAgAAJBQCAABTvgA==
Date: Mon, 11 Oct 2021 18:30:50 +0000
Message-ID: <611b61a4-9635-f1e6-a078-e40d4cbd49fd@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
 <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
 <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
 <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local>
 <AF7AB609-3E79-4017-A296-CC7C87E1705F@arm.com>
In-Reply-To: <AF7AB609-3E79-4017-A296-CC7C87E1705F@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44b6c739-f68f-4312-c38f-08d98ce540b7
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB56986566D83222E64E2B79D9E7B59@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uJmYRgb9XQcCIgoqLYHC42ckxrsZs68ApPOMl4wFVlFu51OTgBIl5CUMXVtmT4SOwaDQsi8BgbErFYlxESuDK25ZA10dJDOxqvZTea9im2gtEIfDvjFKVDBNkM0+NkA28WG0D+Ozgn3qfFZNyZf3q7Ue++ZpfRqo6MNT8Sb0kJ488I69hX7VYw7aelqVYjHch7zezP1yLMz6ggWH6Svw00I/jsPm8P67S5kK0avRXZi8vO7yWMVNRCgK6JixmTuSpwJ4BzkZ5tLqJmCzV6NjU5NTShPFA6G/+nEi6Ej0pG5nVsj5xW0K62LDhHwcLRR5qaQCYv2OXcMpmdXLBbNfXZmC+6dQ5VVHQPAFm/7jjDOwbmVzgWjicrqcsDP3FXBYrlrEKwnQ+91AfJMX1GN9F5+6xzIw/TLYxAY8e1XMcX5PkV0yuugvATPPHI7bU+NU1GJiTg2eYqrPcFXiQjSjN8DbWgpMY4VpqbHU/cgGcmWHcvxmUOmWYGSVH35zbIC5wDWM1q/NMq+/kPULySM8EgGcKr/qpdVYo4a5bEvDgqSjqE679n6goOY1XtbHkLvHqUbl60UD9mGSdwN6rluYiLGlT8V0RuDhjIAvMxqnGRQy4/CN0YpgbfH1sauwz/xP21/TUtgkkIUtRvcNskfY0HUThqwucOTnMRk5Yu514dSpmmY3M05rLak52LR5QXiPTQLrk6mEXfw/cLFKEV+gfuTtHUAsnf1kViJHyuLkJO1zDsnDDVl0Gy3tzZFVp4YA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(316002)(55236004)(54906003)(26005)(38100700002)(5660300002)(2616005)(110136005)(31686004)(4326008)(6512007)(7416002)(2906002)(186003)(64756008)(122000001)(66556008)(66476007)(38070700005)(66946007)(86362001)(31696002)(8936002)(8676002)(53546011)(6486002)(66446008)(6506007)(76116006)(508600001)(36756003)(83380400001)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y2pnQmlEWHVMZVE1V3FPajhHbkR3TUVuT0FmdDBwRjhMU1VlL002SFJoZzV1?=
 =?utf-8?B?YUtwYndjRWtIemRwSEVvRmJINnJhQnpiWlZSanpOcjRVYVd3ZndoV3BNalA2?=
 =?utf-8?B?MHpoOTMrSytxbStlbkFrbDg3eWhTdWxYN0N2ZE5GUFlIL2lLTTlTS0h1YnBh?=
 =?utf-8?B?REI3WHBtSE5lRFZiU0VyODFtVCtCN0pIYUE4dnZ1ZzYrVHJ0QVk4MGtHU1Rh?=
 =?utf-8?B?dlNockpwL3pLSk1qSzZ1Z09ROWU0SEJ6SDVaYXZHTjhkcHQzV1VTKzYydERk?=
 =?utf-8?B?d0IxMUJ6QkxmSTBFaDBpbkhTNUoxM2YzZi9sTEQ1aUJOS095c0lrRlNLMXFx?=
 =?utf-8?B?Z0U1YmF1NWI2R1lJZUVPQ0ZINGpmWmlJc3V3Sk9YRFlxMXlJcGJnR1ZVRnRk?=
 =?utf-8?B?UDUvSTlVQ0Q1WU5UeCsvUDVRVFRSdWpjMzc1SFZaYzJMSEdBd3pTTXFzR0ty?=
 =?utf-8?B?MEswL0lVVlE5QysvVHY3ck8yQnRWZlhmS2pJa0pheWp5ZDNzZ3V3Ny8yZU9H?=
 =?utf-8?B?VEl4SkJSTlJoNFlFVzdGVy9XbkU3aEFpSzNJNjNLbmV3WHRkYlQrQmJKcTEy?=
 =?utf-8?B?SlFyZFN0WE04b2lrbTBvWFFRTVc1YkhIRnRZcTBreFV1WTZhOXVzTE8wRjcw?=
 =?utf-8?B?WkdOTytKZWZ0eVpTMy9pYWlLVnpSNjZmNDFTVjhmZi9Rdm44dGxsQThxTGxh?=
 =?utf-8?B?TFJrdjRrTndwcVM5SGcrN2FxQ01lVmx1dXNtMTdhWEY5dlNuTlkzQ3FsaUlM?=
 =?utf-8?B?UUxWNXpyQllITE1NUnVHWC9xd0Frb2lxT0pBL0YvNHd5dTRCcktoSDFpeGVI?=
 =?utf-8?B?VzdNTEV3Sk9iL0dYaGY0M0FPNm1vSUpob2d3KzB5bEtiR0U5ckQrTlRKb3hs?=
 =?utf-8?B?bDFNZUtlQlVtL05PbFFDR2lVa01yUzU5SDhxYk0yWGdDRzdjUXNJYUwvTmJU?=
 =?utf-8?B?Y2F0Z21qdjRHOExZVzRpRG9jMmMwWk9SSk5VT2JWdnZueko4RXZTOTY2elpJ?=
 =?utf-8?B?TlhxVFhBMUZ5OHF1NnZPNVBVNkVLM1RKZ1hDczZnL2JZYno1NC85cUpSSllm?=
 =?utf-8?B?dkZFMURjRlc2MU9QY0U0TUZVamRSenVPWktFRGoxMmpaRDk1V0V5MGo4cnZL?=
 =?utf-8?B?K0F4blFWS1J2d0dFTElPMXNXRTBvT0hNcnF2d0JHNjBMY0hzbTdFbW9HMWd6?=
 =?utf-8?B?WnNRNXZSTDZhbnltdUViaUd0SGxCYVdJc085VkdEaVJ0cFp5akg4SWxxTmNX?=
 =?utf-8?B?cXlyTW9Xc3lOOHFVWTNLd1RMQ0NnKzdndDAvK1lIRm1MRStKL3BTa09BTWdz?=
 =?utf-8?B?Znh1S05ZTGJGd1o3SXlOOG5mM2RkbVFya3lGdXhIblFBUzNFbGdlT3FsZExj?=
 =?utf-8?B?R3o3YTBBczY4RUVDeDhuMW9JeitJOG1lT25lS0hjeVY5QzZGTG0vOVRvenpS?=
 =?utf-8?B?Z2dtRVg3aEFsNDN2Q25pTms1MGFkSTBjL0JmQmJ2Vng4T1N4OVNpRXVMRnVV?=
 =?utf-8?B?Nk51WTBtSXJDQWlBS1B0aWoyb3RIZDl1K1EyNTZ3N1VOZUwrNmZEWUkwZjlp?=
 =?utf-8?B?NjJLa1lkb1NSbmJmUnEyV2JzSlRaNTdmejVxY2lXTElIa0ZTNXRxUGUwUTVS?=
 =?utf-8?B?czZ1Y1hrTjZZVm05dHFsNDZPR0N1VnoxMHcyNzZhbVJWZ0pma1Z0U3E3S0dR?=
 =?utf-8?B?a2V3anRuMHV6dEJKUVQ1VzdMM0t1NG1wTTFrcGxUS3lMajNDTkRrU1k0WGM5?=
 =?utf-8?B?dXl2TnlEeEozUStCVlNoV0hjUTBYNTI3aFJoQ0o4bnFueTdTWVN5VmNCdHYy?=
 =?utf-8?B?dUpwRER6SHRxNEdrbU9PQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E6C45A02E6E1A4A8B2406B1B2B7E3AB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b6c739-f68f-4312-c38f-08d98ce540b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 18:30:50.9824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jo9EcIoh4524d+8RdYZ5R3UZ/rwlJSdEPvfp8BgDD6KXXP03Y4Wycmi5aUy2xxYb8+aHXtfCVoxKp0EWzzBISbGyz6bUG7aTlOs3K9nTmMGimIzYS9NcVkQGCO2Bx3Vs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
X-Proofpoint-ORIG-GUID: vwEIfDpioqbctXO1YZruuHaHiQ4BrxCM
X-Proofpoint-GUID: vwEIfDpioqbctXO1YZruuHaHiQ4BrxCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_06,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110106

DQoNCk9uIDExLjEwLjIxIDIwOjE1LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPiBIaSBSb2dl
ciwNCj4NCj4+IE9uIDExIE9jdCAyMDIxLCBhdCAxNzo0MywgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0
IDA0OjIwOjE0UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+DQo+
Pj4gT24gMTEuMTAuMjEgMTk6MTIsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhpIFJv
Z2VyLA0KPj4+Pg0KPj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDExOjUxLCBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4gT24gV2VkLCBP
Y3QgMDYsIDIwMjEgYXQgMDY6NDA6MzRQTSArMDEwMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+
Pj4gVGhlIGV4aXN0aW5nIFZQQ0kgc3VwcG9ydCBhdmFpbGFibGUgZm9yIFg4NiBpcyBhZGFwdGVk
IGZvciBBcm0uDQo+Pj4+Pj4gV2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVkIHRvIFhFTiB2aWEgdGhl
IGh5cGVyIGNhbGwNCj4+Pj4+PiDigJxQSFlTREVWT1BfcGNpX2RldmljZV9hZGTigJ0sIFZQQ0kg
aGFuZGxlciBmb3IgdGhlIGNvbmZpZyBzcGFjZQ0KPj4+Pj4+IGFjY2VzcyBpcyBhZGRlZCB0byB0
aGUgWGVuIHRvIGVtdWxhdGUgdGhlIFBDSSBkZXZpY2VzIGNvbmZpZyBzcGFjZS4NCj4+Pj4+Pg0K
Pj4+Pj4+IEEgTU1JTyB0cmFwIGhhbmRsZXIgZm9yIHRoZSBQQ0kgRUNBTSBzcGFjZSBpcyByZWdp
c3RlcmVkIGluIFhFTg0KPj4+Pj4+IHNvIHRoYXQgd2hlbiBndWVzdCBpcyB0cnlpbmcgdG8gYWNj
ZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlLFhFTg0KPj4+Pj4+IHdpbGwgdHJhcCB0aGUgYWNjZXNz
IGFuZCBlbXVsYXRlIHJlYWQvd3JpdGUgdXNpbmcgdGhlIFZQQ0kgYW5kDQo+Pj4+Pj4gbm90IHRo
ZSByZWFsIFBDSSBoYXJkd2FyZS4NCj4+Pj4+Pg0KPj4+Pj4+IEZvciBEb20wbGVzcyBzeXN0ZW1z
IHNjYW5fcGNpX2RldmljZXMoKSB3b3VsZCBiZSB1c2VkIHRvIGRpc2NvdmVyIHRoZQ0KPj4+Pj4+
IFBDSSBkZXZpY2UgaW4gWEVOIGFuZCBWUENJIGhhbmRsZXIgd2lsbCBiZSBhZGRlZCBkdXJpbmcg
WEVOIGJvb3RzLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJh
aHVsLnNpbmdoQGFybS5jb20+DQo+Pj4+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBDaGFuZ2UgaW4g
djU6DQo+Pj4+Pj4gLSBBZGQgcGNpX2NsZWFudXBfbXNpKHBkZXYpIGluIGNsZWFudXAgcGFydC4N
Cj4+Pj4+PiAtIEFkZGVkIFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQo+Pj4+Pj4gQ2hhbmdlIGluIHY0Og0KPj4+Pj4+IC0gTW92ZSBhZGRp
dGlvbiBvZiBYRU5fRE9NQ1RMX0NERl92cGNpIGZsYWcgdG8gc2VwYXJhdGUgcGF0Y2gNCj4+Pj4+
PiBDaGFuZ2UgaW4gdjM6DQo+Pj4+Pj4gLSBVc2UgaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQo
KSBpbiBwbGFjZSBvZiBwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCB2YXJpYWJsZQ0KPj4+Pj4+IC0g
UmVqZWN0IFhFTl9ET01DVExfQ0RGX3ZwY2kgZm9yIHg4NiBpbiBhcmNoX3Nhbml0aXNlX2RvbWFp
bl9jb25maWcoKQ0KPj4+Pj4+IC0gUmVtb3ZlIElTX0VOQUJMRUQoQ09ORklHX0hBU19WUENJKSBm
cm9tIGhhc192cGNpKCkNCj4+Pj4+PiBDaGFuZ2UgaW4gdjI6DQo+Pj4+Pj4gLSBBZGQgbmV3IFhF
Tl9ET01DVExfQ0RGX3ZwY2kgZmxhZw0KPj4+Pj4+IC0gbW9kaWZ5IGhhc192cGNpKCkgdG8gaW5j
bHVkZSBYRU5fRE9NQ1RMX0NERl92cGNpDQo+Pj4+Pj4gLSBlbmFibGUgdnBjaSBzdXBwb3J0IHdo
ZW4gcGNpLXBhc3N0aG91Z2ggb3B0aW9uIGlzIGVuYWJsZWQuDQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4g
LS0tDQo+Pj4+Pj4geGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPj4+Pj4+
IHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAgICAgIHwgICA0ICsrDQo+Pj4+Pj4geGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jICAgfCAgIDMgKw0KPj4+Pj4+IHhlbi9hcmNoL2FybS92cGNpLmMg
ICAgICAgICAgIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+
PiB4ZW4vYXJjaC9hcm0vdnBjaS5oICAgICAgICAgICB8ICAzNiArKysrKysrKysrKysNCj4+Pj4+
PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8ICAxOCArKysrKysNCj4+Pj4+PiB4ZW4v
aW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAgNyArKy0NCj4+Pj4+PiB4ZW4vaW5jbHVkZS9h
c20teDg2L3BjaS5oICAgICB8ICAgMiAtDQo+Pj4+Pj4geGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
YXJtLmggfCAgIDcgKysrDQo+Pj4+Pj4geGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAg
IDIgKw0KPj4+Pj4+IDEwIGZpbGVzIGNoYW5nZWQsIDE3OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdnBjaS5jDQo+
Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS92cGNpLmgNCj4+Pj4+Pg0KPj4+
Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vTWFr
ZWZpbGUNCj4+Pj4+PiBpbmRleCA0NGQ3Y2M4MWZhLi5mYjljOTc2ZWEyIDEwMDY0NA0KPj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9N
YWtlZmlsZQ0KPj4+Pj4+IEBAIC03LDYgKzcsNyBAQCBpZm5lcSAoJChDT05GSUdfTk9fUExBVCks
eSkNCj4+Pj4+PiBvYmoteSArPSBwbGF0Zm9ybXMvDQo+Pj4+Pj4gZW5kaWYNCj4+Pj4+PiBvYmot
JChDT05GSUdfVEVFKSArPSB0ZWUvDQo+Pj4+Pj4gK29iai0kKENPTkZJR19IQVNfVlBDSSkgKz0g
dnBjaS5vDQo+Pj4+Pj4NCj4+Pj4+PiBvYmotJChDT05GSUdfSEFTX0FMVEVSTkFUSVZFKSArPSBh
bHRlcm5hdGl2ZS5vDQo+Pj4+Pj4gb2JqLXkgKz0gYm9vdGZkdC5pbml0Lm8NCj4+Pj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+
Pj4+Pj4gaW5kZXggMzYxMzhjMWIyZS4uZmJiNTJmNzhmMSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMN
Cj4+Pj4+PiBAQCAtMzksNiArMzksNyBAQA0KPj4+Pj4+ICNpbmNsdWRlIDxhc20vdmdpYy5oPg0K
Pj4+Pj4+ICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+DQo+Pj4+Pj4NCj4+Pj4+PiArI2luY2x1ZGUg
InZwY2kuaCINCj4+Pj4+PiAjaW5jbHVkZSAidnVhcnQuaCINCj4+Pj4+Pg0KPj4+Pj4+IERFRklO
RV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIGN1cnJfdmNwdSk7DQo+Pj4+Pj4gQEAgLTc2Nyw2ICs3
NjgsOSBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+Pj4g
ICAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiAocmMgPSBkb21haW5fdnVhcnRfaW5p
dChkKSkgKQ0KPj4+Pj4+ICAgICAgICAgIGdvdG8gZmFpbDsNCj4+Pj4+Pg0KPj4+Pj4+ICsgICAg
aWYgKCAocmMgPSBkb21haW5fdnBjaV9pbml0KGQpKSAhPSAwICkNCj4+Pj4+PiArICAgICAgICBn
b3RvIGZhaWw7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4NCj4+Pj4+
PiBmYWlsOg0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+PiBpbmRleCBjNWFmYmUyZTA1Li5m
NGM4OWJkZThjIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Yw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+Pj4+IEBAIC0z
MDUzLDYgKzMwNTMsOSBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tMCh2b2lkKQ0KPj4+Pj4+ICAg
ICAgaWYgKCBpb21tdV9lbmFibGVkICkNCj4+Pj4+PiAgICAgICAgICBkb20wX2NmZy5mbGFncyB8
PSBYRU5fRE9NQ1RMX0NERl9pb21tdTsNCj4+Pj4+Pg0KPj4+Pj4+ICsgICAgaWYgKCBpc19wY2lf
cGFzc3Rocm91Z2hfZW5hYmxlZCgpICkNCj4+Pj4+PiArICAgICAgICBkb20wX2NmZy5mbGFncyB8
PSBYRU5fRE9NQ1RMX0NERl92cGNpOw0KPj4+Pj4gSSB0aGluayBJJ20gY29uZnVzZWQgd2l0aCB0
aGlzLiBZb3Ugc2VlbSB0byBlbmFibGUgdlBDSSBmb3IgZG9tMCwgYnV0DQo+Pj4+PiB0aGVuIGRv
bWFpbl92cGNpX2luaXQgd2lsbCBzZXR1cCB0cmFwcyBmb3IgdGhlIGd1ZXN0IHZpcnR1YWwgRUNB
TQ0KPj4+Pj4gbGF5b3V0LCBub3QgdGhlIG5hdGl2ZSBvbmUgdGhhdCBkb20wIHdpbGwgYmUgdXNp
bmcuDQo+Pj4+IEkgdGhpbmsgYWZ0ZXIgdGhlIGxhc3QgZGlzY3Vzc2lvbnMsIGl0IHdhcyBkZWNp
ZGVkIHRvIGFsc28gaW5zdGFsbGVkIHRoZSB2cGNpDQo+Pj4+IGhhbmRsZXIgZm9yIGRvbTAuIEkg
d2lsbCBoYXZlIHRvIGxvb2sgaW50byB0aGlzIGFuZCBjb21lIGJhY2sgdG8geW91Lg0KPj4+PiBA
T2xla3NhbmRyOiBDb3VsZCB5b3UgY29tbWVudCBvbiB0aGlzLg0KPj4+IFllcywgd2UgZG8gdHJh
cCBEb20wIGFzIHdlbGwuIFRoZSBEb20wIHRyYXBzIGFyZSBub3QgaW4gdGhpcyBzZXJpZXMsIGJ1
dA0KPj4+IGFyZSBpbiBtaW5lIGFzIGl0IG5lZWRzIG1vcmUgcHJlcGFyYXRvcnkgd29yayBmb3Ig
dGhhdC4gUGxlYXNlIHNlZSBbMV0NCj4+IFRoZW4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgc2V0
IFhFTl9ET01DVExfQ0RGX3ZwY2kgZm9yIGRvbTAgaGVyZSwgaXQNCj4+IHNob3VsZCBpbnN0ZWFk
IGJlIGRvbmUgaW4gdGhlIHBhdGNoIHdoZXJlIGRvbTAgc3VwcG9ydCBpcyBpbnRyb2R1Y2VkLg0K
PiBPayBJIHdpbGwgY2hlY2sgdG8gcmVtb3ZlIHRoaXMgYW5kIGluY2x1ZGUgdGhlIGNoYW5nZSBp
biB2Ni4NCkp1c3QgdG8gbWFrZSBpdCBjbGVhcjogZG8gd2Ugd2FudCB0byByZW1vdmUgdGhpcyBw
aWVjZSBmcm9tIHRoaXMgcGF0Y2gNCmFuZCBpbnN0ZWFkIGhhdmUgYSBkZWRpY2F0ZWQgcGF0Y2gg
b24gdG9wIG9mIG15IHNlcmllcywgc28gaXQgaXMgZW5hYmxlZA0KcmlnaHQgYWZ0ZXIgd2UgaGF2
ZSB0aGUgY29kZSB0aGF0IHNldHMgdXAgdGhlIHRyYXAgaGFuZGxlcnMgZm9yIERvbTA/DQpJZiBz
bywgdGhlbiBkbyB3ZSB3YW50IHRoYXQgcGF0Y2ggdG8gYmUgY2hhaW5lZCBpbiBteSBzZXJpZXMg
b3Igc2VudCBhcw0KYSBmb2xsb3cgdXAgcmlnaHQgYWZ0ZXIgaXQgc2VwYXJhdGVseT8NCg0KVGhh
bmtzLA0KT2xla3NhbmRyDQo+DQo+IENoZWVycw0KPiBCZXJ0cmFuZA0KPg0KPj4gVGhhbmtzLCBS
b2dlci4NCg==

