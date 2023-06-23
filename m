Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1273B383
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 11:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554348.865490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCd4K-0008IR-Qb; Fri, 23 Jun 2023 09:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554348.865490; Fri, 23 Jun 2023 09:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCd4K-0008F9-M3; Fri, 23 Jun 2023 09:27:04 +0000
Received: by outflank-mailman (input) for mailman id 554348;
 Fri, 23 Jun 2023 09:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olOL=CL=epam.com=prvs=05383ded02=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qCd4I-0008F3-AX
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 09:27:02 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19b3d79f-11a8-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 11:26:59 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35N66rCX017137; Fri, 23 Jun 2023 09:26:48 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rc2w2g5ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 09:26:47 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6456.eurprd03.prod.outlook.com (2603:10a6:10:19c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 09:26:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335%4]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 09:26:43 +0000
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
X-Inumbo-ID: 19b3d79f-11a8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSR/igZ55P4fvlUSiXDFT7XmGbNKcd+l3l2fbptXHyGFQiapqjq0Sw/qKNWybOaJTRuDntHGdfjcje0ROYiQKYga+CjZo/tvFpno4UHVddOY+JjjZSFfaYz32QF/k9nqgMBXRsYJ7PwR41Fp4ZTAizbVJMK7Yl6w0m4o5z7Ta3ZE5hW5RrANHHfLxFCEegrEAzh8pzEugf/kT+VDRZI3a14ehNVrKm/XqPPUT4AdvIPjG7gVA02QQAVtxJkO7fFVjyKYFircgtu07Rl/ZArB+VQ05R6/Bcjc7HzwRMpRK1krHPK+FaWtXzn9F6TSy1vgbl9ldt4FX6FHDt7m6SOyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4rxjov7YnCTp+5a7NPsUIh9h+F8OO9Y6dsQ2vKEPn8=;
 b=bLbXVcKKtffXvhel320490dvznJPyo3EGfkBpTeOuNsCbAFnErItVaENLlkuZlihzD2gFEoOIS1DRxRTnEZA+fWp1/fig3sZTYE1TCsJ1rUNu/Hh/WIFP7+VjzD26M17PideEOGIG25ijA8v6G6xJjfqr0pIQBZtkEgMfl0KatNrN0RA/d2WIzlnM5UaORFvD+he0bwmSLYUMn1T5SIgFWLOeDK3F+s69p0izfSN1mzPunS/UYZnMhwXH8Plq236yXHeHkZo1Wd7+HeA2kGolsRPm9jzQBzqRnv3abAWqP2NtmfTzRrXymhx6rJWfSUSRXClFK+3A9u0fYd5eJOEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4rxjov7YnCTp+5a7NPsUIh9h+F8OO9Y6dsQ2vKEPn8=;
 b=bmSLPva+PeTDP+nIimDso+Tj6DtvxASSjPXGUk/HupB0znAQFy/cd7jjYkkUWy4yg5tOTksavWQBhV+Kfjrkg50BQeQuVqDGwOPyIoZK8L/5Oh1W+sYKmc70QhH2R8WpgmAq7ZsD17q4s8BfULCQ1QMM5XNUBAeuTkqdL80G5X+WJQPYeQUsRuytUlTBoIh34Iw6JhnU4Ed1dg15kRbZB+3rNrOzQ7X8tIeg6hfpIX9aiZ1/RaCUMV7jvTYMca9e34rGd4kP7rvofAxsYesvRcHaZn27homrw701++aXAe79K3XNxMayuYCJKhCFjGr0vJTUv+xXiIE4fe1RqHdp8w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHZneJZdDE+HOoSO0y6VB9l0x1hDq+No9OAgAgqUACAALl2AIAAzUWAgADPAYCAAAYfgA==
Date: Fri, 23 Jun 2023 09:26:43 +0000
Message-ID: <874jmyo7g8.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local>
In-Reply-To: <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6456:EE_
x-ms-office365-filtering-correlation-id: 69186bfa-3f49-4a02-4072-08db73cbf53b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IMLZNLHhvXWIbQPGJ3b/A0G+z9E21IZ5PVWW5b7cZ3bzbw2FMYj7m5lSbXILSPsRC8VmS1C2Jhbt2SFd2GXKhboXDxmgD4XQZjROCtXuCt8ym5Og4XG3jcRn+YwP6kMTJUDdIIeodiqEZmkRDd15w+jdp6u/+bRbiqPh2Pkoj3Psb7lvOUqgzLpuAUyACh+BnWj0vnY+adAgZlznhGfwb3k4KACS1KeHdVL0I1O3qHdeYHiUM2xyehsNvjYDuO8xTtbou/AEVAIIcoAipBDffuVUlsyOZAV4x4KqmpvH4WdcQ1nAXhPe+1PMgEM5T5r9rF5mI+W5SSC+Pqk6yknYHAmCN+csrOs0/egQlGb1rgDrTf0oR5R9x0FlbmLrNS7fmOpk170Wa9SpRq6rNln9jR64zj7J6/aITj5STn1hahuKBzT92oUhodIzBx5uSnvgDVZskFlgK/8hJsoUbIrpnY/CK5SgTpNki7pEsJlILQHnD+0BUjfbhyyTMtw1gatN06HbLVDw0DfPLUvIPYTbvCnYmwXdL1qSJK8GyEKGILAyYOcMBe60d2gIQQYU44NZw656FNFYizXpBqjlzlHRBT0eiF5WIwmiJsvi+09HLRw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(2906002)(5660300002)(66899021)(122000001)(38070700005)(38100700002)(86362001)(36756003)(54906003)(478600001)(71200400001)(966005)(6486002)(316002)(41300700001)(8676002)(8936002)(66476007)(4326008)(6916009)(66556008)(64756008)(91956017)(66446008)(66946007)(76116006)(6512007)(26005)(55236004)(6506007)(83380400001)(2616005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dEd4ZzZ5cWJCcU9mcjlLMEI3VFJrL0NVNFRYRitpSHA3VjB2TTNMRXhkeTJD?=
 =?utf-8?B?U284ZG5aMkcwdEdkc01DblpNL1QvT0ZycXFnRWNMRWhsN0R3cXVyRGFaYVlW?=
 =?utf-8?B?T1RzUnl1Zmt5R2ZDRTNXZGtZRWlKSWdKMUlmQjdDMW1aTUE2TGtvc0dyWDNR?=
 =?utf-8?B?aFBuT0tzdFRMTlFTemFGUUpjb0I1NkNFN3p4NjF4dG01UElSTDg4V1k2cjBT?=
 =?utf-8?B?Z0ZkL09OdWxoWDdzc1FGY2hSeW92SjYwRmtJZ0wrVzM1QlB2MmNtc04vSVlo?=
 =?utf-8?B?bVlhSkk1QmVQMGxCUzhaMktFVkMxV25GSTFSL3pZL1hDR0lCeU0zcklxNTdE?=
 =?utf-8?B?RzBZYWVxRUdZVVZsL1krcmdqUE1uRndVWVV1Y3FYQVhxSXZqVC9sTFAxczFZ?=
 =?utf-8?B?KzdjdGNUbzdGWStsUkErRjJCNzZNaGIyZFJzNGs5SldWd3ViUmt6Z2N0V2lm?=
 =?utf-8?B?SFR3Tk5aWjBLOGE4UTNvZGM3UzRoWXAvRkQyY2xNbmVFRTIwaEh3eUE2ZDg1?=
 =?utf-8?B?eXk1K3FqVVp5R3hHY2tXakVDRi9vNnlIRWNKcDV1aVBpWlM1b2VxeWF4WTZv?=
 =?utf-8?B?R3plTURJMUlxdGVVNldYSlF0MFRrcVRDSWdQZ0ZyRXVIdnIrUjMwQWxWdk9R?=
 =?utf-8?B?aFN3M0hUNEl6QUFyczNldWxxVGdoUkhiUG1Bd1F2ZldJY25GblQzSklnekEv?=
 =?utf-8?B?YkQ1RzA3Tmkwc2szZEFwdktzRTQ0T1lyMEh4d041THFGUlVRb0dXT2FoT1pP?=
 =?utf-8?B?NDFQNEtkSy9Gd1RseFJYNnN5TzJkK21keE1ING1hUm96YSswa09HQXlzOTcw?=
 =?utf-8?B?MytVS2Y4dlZhM0hsVEZPcWNUSFllK3AzaG9vM2VsQXJTRDJ1RXFydU1JbVBD?=
 =?utf-8?B?NHRabFl4M09GSWQxRHR2UHU4cGVQUFlpZnFIYzhDMjJjZGZMS1lNNVc2YlNt?=
 =?utf-8?B?eThodnB4U3dSSE1wOTRvbC9Yamg0MFhqdjRaUUZ6dFhFcVRHeEc3WkgxQU1m?=
 =?utf-8?B?YzFMYnFyMnBRWUxVZXVHZ1RETW1VZEo3eUZwVE9nL2RpQ0dSQkFHZlhxdkht?=
 =?utf-8?B?d1lienRpUXN5WWdqQmRLbDdUSWdFRHNhL0pybkNRRlNEdjMvYWVrMjFVRmVM?=
 =?utf-8?B?S0MwQ2RSSTFtLzJEZTdVTFZNMjhhTDg0RjFnaWNiMmVISWxmQ3lmbDNudnRr?=
 =?utf-8?B?dG81aDVjNGdQNndNQ3RpRnlSZXN3bE1UVVVISkcxRk9lVzB0Y2htWGR3ZzVL?=
 =?utf-8?B?MXRLbTFZR05OZjVsRTJvaVdkR2dpbi9uL1N3S0NRN2srdkdDalcxNE9JaklJ?=
 =?utf-8?B?RndtOWpGSDR3YWxMWk95RjdBSUZNdE94dmN1VzBnWDJ2TElOU1ZmM202QUdP?=
 =?utf-8?B?OTFrYUFOeVBnSFdoVDlyQURzSlNCQ0RkU3dESlg1aGE4RnRFQ2N3eFp5TC9l?=
 =?utf-8?B?ZDdtZnFMc2dqRkNsR0RObEJ1VTBEemJxQWcvd3E2K2NyQ3RPOGlIa05DS0RW?=
 =?utf-8?B?RHZVN3ZLSWJGNVpPSVdEUUF1Tm5UZkFlOEpvK2treUJ0cjRDeVp4emtuWHhs?=
 =?utf-8?B?UG5PeFp2U2hvdG9VRW0xRUtuY216cXdSR1hPUHJBK2M1bzlWNjk1VkptbnRI?=
 =?utf-8?B?bWFXM0dtbTByeVlUQkYrVmpEeWRZUFJaMzFUVW00MVJlRGxtWW8rUXpveU1z?=
 =?utf-8?B?MUp6N3p6WDNYVjZXU0ZtVWNHMW0xNnJEUVBmQmJEWUZXd3lGek84K09pZm01?=
 =?utf-8?B?Wk1qWVhLVnV3TWJzTmRpd1YwUEpKNGEvYjdBdmhKdFBuMEQ4OTYxZk5LU2E1?=
 =?utf-8?B?TmZEVXZLVnVvMmVhaElSUTNOcVJaeTF5bjFhZHZmWVVGWjlGN2JDSDBOZDFK?=
 =?utf-8?B?eFl0blNwOTlrOHVZblpnZWt0UThQU1g4V1hKalhVRVA2YjdOajNkY25sSUVI?=
 =?utf-8?B?TTdoQll2bVQ1ZHFNVzIrTWtXMW10WURFZzJtTklpRVdiVzRkblkxQmZTU1JL?=
 =?utf-8?B?YWNLdDdRQUx6eDZYSWhtR3BlUHlTL0g4L2VGbjBXeUhCeGx1bUVCNk1uK0tK?=
 =?utf-8?B?R3Q1czNrbjNkelgwbUx0YnExMlJmZWlZMlRZR3BqK0l4eHdZRkZ5VDlGWGV3?=
 =?utf-8?B?YlYxTGdmR2dva0ZTK2IzMFFzaWdNcjJQbzluYys2d2ROaU9mbkdqY3N0OUtl?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9623136027F627428029D55784D36CF0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69186bfa-3f49-4a02-4072-08db73cbf53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 09:26:43.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D63JWUBF1KmNMUix6etmb1dVjVT/yOTY0IZCH+Rnl0dfrIrG9DKU7ZgwAaVHn+HO3fuk5J0cYrtZl2r/MB4/RhGomx7c+YchxpgITMnOh9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6456
X-Proofpoint-ORIG-GUID: bou2E6R8bp23s4FnAuULaYqda-36o9he
X-Proofpoint-GUID: bou2E6R8bp23s4FnAuULaYqda-36o9he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_04,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=933
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306230084

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCAwOToxNzozNlBNICswMDAwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IA0KPj4gSGkgUm9nZXIsDQo+PiANCj4+IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0ZXM6DQo+PiANCj4+ID4gT24gV2Vk
LCBKdW4gMjEsIDIwMjMgYXQgMTA6MDc6MjBQTSArMDAwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+PiA+PiANCj4+ID4+IEhpIFJvZ2VyLA0KPj4gPj4gDQo+PiA+PiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JpdGVzOg0KPj4gPj4gDQo+PiA+PiA+IE9uIFR1
ZSwgSnVuIDEzLCAyMDIzIGF0IDEwOjMyOjI2QU0gKzAwMDAsIFZvbG9keW15ciBCYWJjaHVrIHdy
b3RlOg0KPj4gPj4gPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gPj4gPj4gDQo+PiA+PiA+PiBJbnRyb2R1Y2UgYSBw
ZXItZG9tYWluIHJlYWQvd3JpdGUgbG9jayB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2Vu
dCwNCj4+ID4+ID4+IHNvIHdlIGFyZSBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0byB0aGUg
Y29udGVudHMgb2YgdGhlIHZwY2kgc3RydWN0DQo+PiA+PiA+PiBpZiBub3QuIFRoaXMgbG9jayBj
YW4gYmUgdXNlZCAoYW5kIGluIGEgZmV3IGNhc2VzIGlzIHVzZWQgcmlnaHQgYXdheSkNCj4+ID4+
ID4+IHNvIHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0
aGUgbG9jayBpbiB3cml0ZQ0KPj4gPj4gPj4gbW9kZS4gUHJldmlvdXNseSBzdWNoIHJlbW92YWwg
Y291bGQgcmFjZSB3aXRoIHZwY2lfcmVhZCBmb3IgZXhhbXBsZS4NCj4+ID4+ID4+IA0KPj4gPj4g
Pj4gMS4gUGVyLWRvbWFpbidzIHZwY2lfcndsb2NrIGlzIHVzZWQgdG8gcHJvdGVjdCBwZGV2LT52
cGNpIHN0cnVjdHVyZQ0KPj4gPj4gPj4gZnJvbSBiZWluZyByZW1vdmVkLg0KPj4gPj4gPj4gDQo+
PiA+PiA+PiAyLiBXcml0aW5nIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGFuZCBST00gQkFSIHJlZ2lz
dGVyIG1heSB0cmlnZ2VyDQo+PiA+PiA+PiBtb2RpZnlfYmFycyB0byBydW4sIHdoaWNoIGluIHR1
cm4gbWF5IGFjY2VzcyBtdWx0aXBsZSBwZGV2cyB3aGlsZQ0KPj4gPj4gPj4gY2hlY2tpbmcgZm9y
IHRoZSBleGlzdGluZyBCQVIncyBvdmVybGFwLiBUaGUgb3ZlcmxhcHBpbmcgY2hlY2ssIGlmIGRv
bmUNCj4+ID4+ID4+IHVuZGVyIHRoZSByZWFkIGxvY2ssIHJlcXVpcmVzIHZwY2ktPmxvY2sgdG8g
YmUgYWNxdWlyZWQgb24gYm90aCBkZXZpY2VzDQo+PiA+PiA+PiBiZWluZyBjb21wYXJlZCwgd2hp
Y2ggbWF5IHByb2R1Y2UgYSBkZWFkbG9jay4gSXQgaXMgbm90IHBvc3NpYmxlIHRvDQo+PiA+PiA+
PiB1cGdyYWRlIHJlYWQgbG9jayB0byB3cml0ZSBsb2NrIGluIHN1Y2ggYSBjYXNlLiBTbywgaW4g
b3JkZXIgdG8gcHJldmVudA0KPj4gPj4gPj4gdGhlIGRlYWRsb2NrLCBjaGVjayB3aGljaCByZWdp
c3RlcnMgYXJlIGdvaW5nIHRvIGJlIHdyaXR0ZW4gYW5kIGFjcXVpcmUNCj4+ID4+ID4+IHRoZSBs
b2NrIGluIHRoZSBhcHByb3ByaWF0ZSBtb2RlIGZyb20gdGhlIGJlZ2lubmluZy4NCj4+ID4+ID4+
IA0KPj4gPj4gPj4gQWxsIG90aGVyIGNvZGUsIHdoaWNoIGRvZXNuJ3QgbGVhZCB0byBwZGV2LT52
cGNpIGRlc3RydWN0aW9uIGFuZCBkb2VzIG5vdA0KPj4gPj4gPj4gYWNjZXNzIG11bHRpcGxlIHBk
ZXZzIGF0IHRoZSBzYW1lIHRpbWUsIGNhbiBzdGlsbCB1c2UgYSBjb21iaW5hdGlvbiBvZiB0aGUN
Cj4+ID4+ID4+IHJlYWQgbG9jayBhbmQgcGRldi0+dnBjaS0+bG9jay4NCj4+ID4+ID4+IA0KPj4g
Pj4gPj4gMy4gT3B0aW1pemUgaWYgUk9NIEJBUiB3cml0ZSBsb2NrIHJlcXVpcmVkIGRldGVjdGlv
biBieSBjYWNoaW5nIG9mZnNldA0KPj4gPj4gPj4gb2YgdGhlIFJPTSBCQVIgcmVnaXN0ZXIgaW4g
dnBjaS0+aGVhZGVyLT5yb21fcmVnIHdoaWNoIGRlcGVuZHMgb24NCj4+ID4+ID4+IGhlYWRlcidz
IHR5cGUuDQo+PiA+PiA+PiANCj4+ID4+ID4+IDQuIFJlZHVjZSBsb2NrZWQgcmVnaW9uIGluIHZw
Y2lfcmVtb3ZlX2RldmljZSBhcyBpdCBpcyBub3cgcG9zc2libGUNCj4+ID4+ID4+IHRvIHNldCBw
ZGV2LT52cGNpIHRvIE5VTEwgZWFybHkgcmlnaHQgYWZ0ZXIgdGhlIHdyaXRlIGxvY2sgaXMgYWNx
dWlyZWQuDQo+PiA+PiA+PiANCj4+ID4+ID4+IDUuIFJlZHVjZSBsb2NrZWQgcmVnaW9uIGluIHZw
Y2lfYWRkX2hhbmRsZXJzIGFzIGl0IGlzIHBvc3NpYmxlIHRvDQo+PiA+PiA+PiBpbml0aWFsaXpl
IG1hbnkgbW9yZSBmaWVsZHMgb2YgdGhlIHN0cnVjdCB2cGNpIGJlZm9yZSBhc3NpZ25pbmcgaXQg
dG8NCj4+ID4+ID4+IHBkZXYtPnZwY2kuDQo+PiA+PiA+PiANCj4+ID4+ID4+IDYuIHZwY2lfe2Fk
ZHxyZW1vdmV9X3JlZ2lzdGVyIGFyZSByZXF1aXJlZCB0byBiZSBjYWxsZWQgd2l0aCB0aGUgd3Jp
dGUgbG9jaw0KPj4gPj4gPj4gaGVsZCwgYnV0IGl0IGlzIG5vdCBmZWFzaWJsZSB0byBhZGQgYW4g
YXNzZXJ0IHRoZXJlIGFzIGl0IHJlcXVpcmVzDQo+PiA+PiA+PiBzdHJ1Y3QgZG9tYWluIHRvIGJl
IHBhc3NlZCBmb3IgdGhhdC4gU28sIGFkZCBhIGNvbW1lbnQgYWJvdXQgdGhpcyByZXF1aXJlbWVu
dA0KPj4gPj4gPj4gdG8gdGhlc2UgYW5kIG90aGVyIGZ1bmN0aW9ucyB3aXRoIHRoZSBlcXVpdmFs
ZW50IGNvbnN0cmFpbnRzLg0KPj4gPj4gPj4gDQo+PiA+PiA+PiA3LiBEcm9wIGNvbnN0IHF1YWxp
ZmllciB3aGVyZSB0aGUgbmV3IHJ3bG9jayBpcyB1c2VkIGFuZCB0aGlzIGlzIGFwcHJvcHJpYXRl
Lg0KPj4gPj4gPj4gDQo+PiA+PiA+PiA4LiBEbyBub3QgY2FsbCBwcm9jZXNzX3BlbmRpbmdfc29m
dGlycXMgd2l0aCBhbnkgbG9ja3MgaGVsZC4gRm9yIHRoYXQgdW5sb2NrDQo+PiA+PiA+PiBwcmlv
ciB0aGUgY2FsbCBhbmQgcmUtYWNxdWlyZSB0aGUgbG9ja3MgYWZ0ZXIuIEFmdGVyIHJlLWFjcXVp
cmluZyB0aGUNCj4+ID4+ID4+IGxvY2sgdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayBpZiBwZGV2
LT52cGNpIGV4aXN0czoNCj4+ID4+ID4+ICAtIGluIGFwcGx5X21hcCBiZWNhdXNlIG9mIHRoZSBj
b250ZXh0IGl0IGlzIGNhbGxlZCAobm8gcmFjZSBjb25kaXRpb24NCj4+ID4+ID4+ICAgIHBvc3Np
YmxlKQ0KPj4gPj4gPj4gIC0gZm9yIE1TSS9NU0ktWCBkZWJ1ZyBjb2RlIGJlY2F1c2UgaXQgaXMg
Y2FsbGVkIGF0IHRoZSBlbmQgb2YNCj4+ID4+ID4+ICAgIHBkZXYtPnZwY2kgYWNjZXNzIGFuZCBu
byBmdXJ0aGVyIGFjY2VzcyB0byBwZGV2LT52cGNpIGlzIG1hZGUNCj4+ID4+ID4+IA0KPj4gPj4g
Pj4gOS4gQ2hlY2sgZm9yICFwZGV2LT52cGNpIGluIHZwY2lfe3JlYWR8d3JpdGV9IGFmdGVyIGFj
cXVpcmluZyB0aGUgbG9jaw0KPj4gPj4gPj4gYW5kIGlmIHNvLCBhbGxvdyByZWFkaW5nIG9yIHdy
aXRpbmcgdGhlIGhhcmR3YXJlIHJlZ2lzdGVyIGRpcmVjdGx5LiBUaGlzIGlzDQo+PiA+PiA+PiBh
Y2NlcHRhYmxlIGFzIHdlIG9ubHkgZGVhbCB3aXRoIERvbTAgYXMgb2Ygbm93LiBPbmNlIERvbVUg
c3VwcG9ydCBpcw0KPj4gPj4gPj4gYWRkZWQgdGhlIHdyaXRlIHdpbGwgbmVlZCB0byBiZSBpZ25v
cmVkIGFuZCByZWFkIHJldHVybiBhbGwgMCdzIGZvciB0aGUNCj4+ID4+ID4+IGd1ZXN0cywgd2hp
bGUgRG9tMCBjYW4gc3RpbGwgYWNjZXNzIHRoZSByZWdpc3RlcnMgZGlyZWN0bHkuDQo+PiA+PiA+
PiANCj4+ID4+ID4+IDEwLiBJbnRyb2R1Y2UgcGNpZGV2c190cnlsb2NrLCBzbyB0aGVyZSBpcyBh
IHBvc3NpYmlsaXR5IHRvIHRyeSBsb2NraW5nDQo+PiA+PiA+PiB0aGUgcGNpZGV2J3MgbG9jay4N
Cj4+ID4+ID4+IA0KPj4gPj4gPj4gMTEuIFVzZSBwY2lkZXYncyBsb2NrIGFyb3VuZCBmb3JfZWFj
aF9wZGV2IGFuZCBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluDQo+PiA+PiA+PiB3aGlsZSBhY2Nlc3Np
bmcgcGRldnMgaW4gdnBjaSBjb2RlLg0KPj4gPj4gPj4gDQo+PiA+PiA+PiAxMi4gVGhpcyBpcyBi
YXNlZCBvbiB0aGUgZGlzY3Vzc2lvbiBhdCBbMV0uDQo+PiA+PiA+PiANCj4+ID4+ID4+IFsxXSBo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjIwMjA0MDYzNDU5LjY4MDk2MS00LWFuZHIyMDAwQGdtYWlsLmNvbS9fXzshIUdGXzI5ZGJjUUlV
QlBBIXpQeTMxQ1dGV2x5QzB4aEVIaVNqNnJPUGU3UkRTakxyYW5JOUtacWhHNHNzbUNoSk1XdnNQ
TEpQUUdUY1Zzbm5vd1pwUDgtTGFLSmtJV0l6Yjh1ZTBEb1loZyQgW2xvcmVbLl1rZXJuZWxbLl1v
cmddDQo+PiA+PiA+PiANCj4+ID4+ID4+IFN1Z2dlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiA+PiA+PiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+ID4+ID4N
Cj4+ID4+ID4gVGhhbmtzLg0KPj4gPj4gPg0KPj4gPj4gPiBJIGhhdmVuJ3QgbG9va2VkIGluIGZ1
bGwgZGV0YWlsLCBidXQgSSdtIGFmcmFpZCB0aGVyZSdzIGFuIEFCQkENCj4+ID4+ID4gZGVhZGxv
Y2sgd2l0aCB0aGUgcGVyLWRvbWFpbiB2cGNpIGxvY2sgYW5kIHRoZSBwY2lkZXZzIGxvY2sgaW4N
Cj4+ID4+ID4gbW9kaWZ5X2JhcnMoKSB2cyAgdnBjaV9hZGRfaGFuZGxlcnMoKSBhbmQgdnBjaV9y
ZW1vdmVfZGV2aWNlKCkuDQo+PiA+PiA+DQo+PiA+PiA+IEkndmUgbWFkZSBzb21lIGNvbW1lbnRz
IGJlbG93Lg0KPj4gPj4gDQo+PiA+PiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgYmVsaWV2
ZSB0aGF0IGl0IGlzIGEgZ29vZCBpZGVhIHRvIGhhdmUgYQ0KPj4gPj4gcGVyLWRvbWFpbiBwZGV2
X2xpc3QgbG9jay4gU2VlIG15IGFuc3dlcnMgYmVsb3cuDQo+PiA+DQo+PiA+IEkgdGhpbmsgaXQn
cyBpbXBvcnRhbnQgdGhhdCB0aGUgbG9jayB0aGF0IHByb3RlY3RzIGRvbWFpbi0+cGRldl9saXN0
DQo+PiA+IG11c3QgYmUgdGhlIHNhbWUgdGhhdCBhbHNvIHByb3RlY3RzIHBkZXYtPnZwY2ksIG9y
IGVsc2UgeW91IG1pZ2h0IHJ1bg0KPj4gPiBpbnRvIHNpbWlsYXIgQUJCQSBkZWFkbG9jayBzaXR1
YXRpb25zLg0KPj4gPg0KPj4gPiBUaGUgcHJvYmxlbSB0aGVuIGNvdWxkIGJlIHRoYXQgaW4gdnBj
aV97cmVhZCx3cml0ZX0geW91IHdpbGwgdGFrZSB0aGUNCj4+ID4gcGVyLWRvbWFpbiBwZGV2IGxv
Y2sgaW4gcmVhZCBtb2RlIGluIG9yZGVyIHRvIGdldCB0aGUgcGRldiwgYW5kIGZvcg0KPj4gPiB3
cml0ZXMgdG8gdGhlIGNvbW1hbmQgcmVnaXN0ZXIgb3IgdGhlIFJPTSBCQVIgeW91IHdvdWxkIGhh
dmUgdG8NCj4+ID4gdXBncmFkZSBzdWNoIGxvY2sgdG8gYSB3cml0ZSBsb2NrIHdpdGhvdXQgZHJv
cHBpbmcgaXQsIGFuZCB3ZSBkb24ndA0KPj4gPiBoYXZlIHN1Y2ggZnVuY3Rpb25hbGl0eSBmb3Ig
cncgbG9ja3MgQVRNLg0KPj4gPg0KPj4gPiBNYXliZSBqdXN0IHJlLXN0YXJ0aW5nIHRoZSBmdW5j
dGlvbiBrbm93aW5nIHRoYXQgdGhlIGxvY2sgbXVzdCBiZQ0KPj4gPiB0YWtlbiBpbiB3cml0ZSBt
b2RlIHdvdWxkIGJlIGEgZ29vZCBzb2x1dGlvbjogd3JpdGVzIHRvIHRoZSBjb21tYW5kDQo+PiA+
IHJlZ2lzdGVyIHdpbGwgYWxyZWFkeSBiZSBzbG93IHNpbmNlIHRoZXkgYXJlIGxpa2VseSB0byBp
bnZvbHZlDQo+PiA+IG1vZGlmaWNhdGlvbnMgdG8gdGhlIHAybS4NCj4+IA0KPj4gTG9va3MgbGlr
ZSBtb2RpZnlfYmFycygpIGlzIHRoZSBvbmx5IGNhdXNlIGZvciB0aGlzIGV4dGVuZGVkIGxvY2su
IEkNCj4+IGtub3cgdGhhdCB0aGlzIHdhcyBkaXNjdXNzZWQgZWFybGllciwgYnV0IGNhbiB3ZSBy
ZXdvcmsgbW9kaWZ5X2JhcnMgdG8NCj4+IG5vdCBpdGVyYXRlIG92ZXIgYWxsIHRoZSBwZGV2cz8g
V2UgY2FuIHN0b3JlIGNvcHkgb2YgYWxsIGVuYWJsZWQgQkFScyBpbg0KPj4gYSBkb21haW4gc3Ry
dWN0dXJlLCBwcm90ZWN0ZWQgYnkgZG9tYWluLT52cGNpX2xvY2suIFNvbWV0aGluZyBha2luIHRv
DQo+PiANCj4+IHN0cnVjdCB2cGNpX2JhciB7DQo+PiAgICAgICAgIGxpc3RfaGVhZCBsaXN0Ow0K
Pj4gICAgICAgICBzdHJ1Y3QgdnBjaSAqdnBjaTsNCj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBz
dGFydDsNCj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQ7DQo+PiAgICAgICAgIGJvb2wgaXNf
cm9tOw0KPj4gfTsNCj4NCj4gVGhpcyBJTU8gbWFrZXMgdGhlIGxvZ2ljIG1vcmUgY29tcGxpY2F0
ZWQsIGFzIGVhY2ggdGltZSBhIEJBUiBpcw0KPiB1cGRhdGVkIHdlIHdvdWxkIGhhdmUgdG8gY2hh
bmdlIHRoZSBjYWNoZWQgYWRkcmVzcyBhbmQgc2l6ZSBpbiB0d28NCj4gZGlmZmVyZW50IHBsYWNl
cy4gIEl0J3MgYWxzbyBkdXBsaWNhdGVkIGRhdGEgdGhhdCB0YWtlcyB1cCBtZW1vcnksIGFuZA0K
PiB0aGVyZSBhcmUgc3lzdGVtIHdpdGggYSBub24tdHJpdmlhbCBhbW91bnQgb2YgUENJIGRldmlj
ZXMgYW5kIHRodXMNCj4gQkFScyB0byB0cmFjay4NCj4NCj4gSSB0aGluayBpdCdzIGVhc2llciB0
byBqdXN0IG1ha2UgdGhlIG5ld2x5IGludHJvZHVjZWQgcGVyLWRvbWFpbg0KPiByd2xvY2sgYWxz
byBwcm90ZWN0IHRoZSBkb21haW4ncyBwZGV2X2xpc3QgKHVubGVzcyBJJ20gbWlzc2luZw0KPiBz
b21ldGhpbmcpLiAgQUZBSUNUIGl0IHdvdWxkIGFsc28gc2ltcGxpZnkgbG9ja2luZywgYXMgc3Vj
aCByd2xvY2sNCj4gcHJvdGVjdGluZyB0aGUgZG9tYWluLT5wZGV2X2xpc3Qgd2lsbCBhdm9pZCB5
b3UgZnJvbSBoYXZpbmcgdG8gdGFrZQ0KPiB0aGUgcGNpZGV2cyBsb2NrIGluIHZwY2lfe3JlYWQs
d3JpdGV9IGluIG9yZGVyIHRvIGZpbmQgdGhlIGRldmljZSB0aGUNCj4gYWNjZXNzIGJlbG9uZ3Mg
dG8uDQoNCkluIG15IG9waW5pb24sIHRoaXMgd2lsbCBtYWtlIHRoZSB3aG9sZSBsb2NraW5nIGxv
Z2ljIGNvbXBsZXgsIGJlY2F1c2UNCndlIHdpbGwgaGF2ZSBvbmUgcndsb2NrIHRoYXQgcHJvdGVj
dHM6DQoNCjEuIHBkZXYtPnZwY2kNCjIuIGRvbWFpbi0+cGRldl9saXN0DQoNClRoaXMgaXMgYSB0
d28gc2VtaS1yZWxhdGVkIHRoaW5ncy4gSSBmZWVsIHRoYXQgdGhpcyB3aWxsIGJlIGhhcmQgdG8N
CnVuZGVyc3RhbmQgZm9yIGFueW9uZSB3aG8gaXMgbm90IGRlZXBseSBpbnRpbWF0ZSB3aXRoIHRo
ZSBQQ0kNCmNvZGUuIEFueXdheXMsIEkgd2FudCB0aGlzIHBhdGNoIHNlcmllcyB0byBnZXQgZ29p
bmcsIHNvIEkgYmVsaWV2ZSB5b3VyDQpqdWRnbWVudCBoZXJlLiBIb3cgc2hvdWxkIEkgbmFtZSB0
aGlzIGxvY2s/IFRha2luZyBpbnRvIGFjY291bnQsIHRoYXQNCnNjb3BlIGlzIHdpbGwgYmUgbW9y
ZSBicm9hZCwgImRvbWFpbi0+dnBjaV9yd2xvY2siIGRvZXMgbm90IHNlZW1zIGFzIGENCmdvb2Qg
bmFtZS4NCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

