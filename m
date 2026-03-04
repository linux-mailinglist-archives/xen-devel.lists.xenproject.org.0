Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCz3K/Twp2mGmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 09:44:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B11FCCC6
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 09:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245159.1544516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxhpF-0001NV-9m; Wed, 04 Mar 2026 08:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245159.1544516; Wed, 04 Mar 2026 08:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxhpF-0001Kn-79; Wed, 04 Mar 2026 08:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1245159;
 Wed, 04 Mar 2026 08:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DbP=BE=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vxhpD-0001Kd-J9
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 08:43:23 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 332792e7-17a6-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 09:43:21 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI1PR03MB9967.eurprd03.prod.outlook.com
 (2603:10a6:800:1cf::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:43:18 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:43:17 +0000
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
X-Inumbo-ID: 332792e7-17a6-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/sBq7GzQNju3brhaa+lc9en+jSOLkC3ROVAOVBBbBDBweNRTrkcs9qshkNgtrlig1+blA/KnB8sHwtH3cGXnqMQkGazdCG9pvIiquDhgYJ4ApzDuH4ZOBqOjvdoeQ5M/ZMh++4ofJ3Rlx77rb1l262pdpbksKMXefpWvNq1lXeU6xLl014iAPhU8cV6ZBFb+YN5+Iq+x/jU07VS12tmYy/vdIozvRmD1o7Uai/RKXSLSg2FqNMCTd73pnJpodTghqXauWEPQHirosJDCtIwUuBaqys35iruZZFW19cYpr9iFYY86oocQNesgIfGoE19fb356OFY01zc88BivVwXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPPd+9bG9DMhsZYzJXoIamo/bE/AclPIQLCu1r+C2PY=;
 b=P0znn4PWnOvSbvqt3me/5QKQzbWVdtny9Ig/8Kacbcz7RpCnGcC/DwEAPG6k+e1uVSL+go//8jou6Mzy1pT6R2udAJC8jzFlSM6ObqFc/MR7tfPAJSVZDtbVB14DgLWgFudlqcLETqr+9YWA/uxvu5RCd6OFqXoWLYJoddlCAp42jXz65MmMBZjZpYoWv2l3XdBg1srg8fmewYIefA0Oa8r7m9h9O1RRBAmyjxzWZnJES1bnZOye/0BUF4aqIHFUBRR59FXf/59+0hS+kyTFTy6urco3bkrGXHPabxwrnas+Pi5L/90dL3X49G/drU3XUWcSHUbSmMHsfIBINRiwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPPd+9bG9DMhsZYzJXoIamo/bE/AclPIQLCu1r+C2PY=;
 b=neDmCZb45Exb3XAnED4O/FfWP4lAtANNz7ANctyUqsFyOdo2zt0xtlq/FUhTC4SrwPd5Vzu5GwNlOUWRhA2YXtxNzggHEn1coYSyWOEh8YREM0gNWS+4XiVaYMxQ+kjhOw00isfwB72Ex+zs2lgnapucSKJVyGi0U+jhJmadRFmflYPyqaZLoGx86Z82ihkuxQhhgrazSTslx4OL5AqTt1/9YcoqbAPNHOYq3svSqSKNlFDG2o7qmw10lG4iH4TWxkSw5f/q9RxRoEsEyW5sum5451dMh+1FQdhdwj0NmS8dfJ0ReJMuimQE+LaL8NrMILTMoBFgklsbttOPk852mA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHb/W/XkRTIlDBdSUyf2rny+l8q37RHbCEAgVf+4gA=
Date: Wed, 4 Mar 2026 08:43:17 +0000
Message-ID: <8da9f137-a897-4438-9524-85836e0170a1@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
 <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
 <aIdgJPTf17M0g-8m@macbook.local>
In-Reply-To: <aIdgJPTf17M0g-8m@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI1PR03MB9967:EE_
x-ms-office365-filtering-correlation-id: 2d6907d5-8bf4-405d-e2f2-08de79ca14ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 mwaq49TErWt5FJbiPJMezo3kmOtOMI+A5U7vXfOVVtVRWEfspu+n1+nUiLJmlqYybjlCpmouPFZkUiKFeIyJSdQ7qAuzGoBaNmDoSui7AQfMxkmFIDBhK/SZXAfnYpaIf4/s76/37kA97TXNTvsoFzZ7z4X+QuLZ202HkKB7mxZIQF7yAKIRYsb6+az2ZW7mqOGCqvFB9Vu4nEKxhcQMc6HZNKrNnaG5z43ClHFHgU4pY+/UdSwXqiH7MCDVewCuq8Cls5YfoIMEAxR9IVkU7DsX4kfATSMn8OKvDd+4pigwktkr76eFI2dNYGOlkyjHLAlrwoV0g0XkkJ044owzZ4Evo20S2jrgVTKAQhWMCC2OPiBLWIv+oLsL2gTpgu1bv513blXIk0YLDhAhg0GXnOSme7fyms4BAs3oVn8qi1hZ1vbaFaNqAEsm0zQ1HKmUfc6BFuse38XQKTDj8Hkr2eAXqas9TOQsW5NCOaA8tqbvltymt9PaMtuS+Z9PKLEBhCEDGDaejbxxY4+XdejRJ1n+ERzMo9o1qGGWE1GPGBuYUF2BbkrS1qU6nCeDNw1OxhcEXRmPiF8X3d0nMDdMx1E7mReGi+SxHjGSmNBSeu7Hmg1v84SpsiE0B+O0J8GniL9VaLlGz8gJflJuoDSplpJjfSJn6FcYQtUVtJNzqdL96dsLRMRR7/asatVnWFwIvThhZFMitN34nLMbbD+cih5R67MgJL60gK0kMII1VT0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXVZYUp5R29id2U5QVhaakhZdDRCQXdtQWhzbGJ5N0R3NnRzQ1cweTN0ZjJr?=
 =?utf-8?B?TERTQjVrZXhOQU5JNXl1SUE4MlBDbTlOUkp4eDdlKys4ak9IYzNPOVI0MHAr?=
 =?utf-8?B?QzJnWng3M3BoRzRqWHVQWnJZOG5oWTQwMmpSaVJROENrT0RFc3RBSlZLY0NG?=
 =?utf-8?B?cnY2cnk2aXZXTnRtZjVROTJOYjIwdlcwSDVEVzFCMDRFaC9RcXMwTThiVU9U?=
 =?utf-8?B?ZHhoQ3B3OHJZT3psUHZKdWdKdDJhU2dTWFdLQmxyVlpscUpPa0o4ay9PNDkw?=
 =?utf-8?B?MXdsNG1taFowelhuYkFwSFkyczJQek11SldJQTJQRElVbExSdnNsY3Vma01u?=
 =?utf-8?B?MldCNUVvVmR2VXpZYWs0bTBQL3h4czg1QVgwcG5ldlV2NWFkSTF0cEtRaUQ4?=
 =?utf-8?B?bktMZUVGcXZYNytxY2hacDJ3YkVOZ1hpc0dBWG10a2VLaEk1NXhBYnVWWFlH?=
 =?utf-8?B?WjMrYTJGc2NYY0xYc2dEK2RJbktxUXVMSFJqZkxidzhHMVF6aTJGanpaMnBi?=
 =?utf-8?B?OG4ycW9RTkpraVVCOEIrTGNVN2R0cFlUdWx1L1hVQ1czZmdmN3B1RzZybWFG?=
 =?utf-8?B?dGpPajdOTGR2Tk9zdUVsSnlKY296akY1eTliVVVKK25zSUk3c3FxZk9tOUg5?=
 =?utf-8?B?SjR6V0dQVExZZ1h0amR6ZUFxRGNXREVJMDNMZm5pTnVMWEdFNHUvMlBCL0Rx?=
 =?utf-8?B?a1U1dXpZT3h4ZStzdGFKQm54NmcrSjhUZWE3R2FMb1AxWDJYVFZvOUI4anVG?=
 =?utf-8?B?ZjJCTXZ2amUrZFpaWnhuYnB5cWNyRlo3aTZBTlYyU1FuMjFTdXhZcjF3NjBm?=
 =?utf-8?B?NVpqVlhEUlFIR1I5RDBsSVFHVEwzSzhSYitmZDQ1LzQrdHdRRGY0U1B5SldT?=
 =?utf-8?B?T0tzOHFhZTk0SzdNa1gwbnpnNUdEMG04eVlsTGRBeDVqT01aSUdIbXJNVUV2?=
 =?utf-8?B?UllMN3hFcXdJRnBINFlzTlR3SkFCMXBXL0Y1bHRhZjY5SkhHWXZJc2FJRXlY?=
 =?utf-8?B?SDY3NXFoUzVUQUpyVnR6UTNhTmFSZVZxVVhQNXh2eDBrMmlMRnZVclVGbXYw?=
 =?utf-8?B?SmliMVhrMFE0eCtlMzd0cHlIY3hyK1YvZ0czOFpXaEtVckppOXRDSk5ybTh1?=
 =?utf-8?B?eENLeWx6MUdoMy9VNXRVVVhKMXcrMXU2cWo3RHIzY2xnMnNLeWNQVi83d0Fy?=
 =?utf-8?B?S21LMFhoVEN3L0ZmQ1ZPWWp3bVYrZ3Jxak8ydGJ0N1k3amRsY1hGQUorV1oy?=
 =?utf-8?B?SG5ZcW5tdExocnkzMG1mMTFNQ2Q5WlRkOXB0MjVEKzJiUnMyRzlwVm1ZRlBs?=
 =?utf-8?B?SE5ySll5SUZjRnpqdnYzYndHQ1Zici9oMFRWQzFNUTYrdDNKYVRQZzhUYnBV?=
 =?utf-8?B?aWp0WGp5YXI5VFVzWGlERkJ0NXFXUkMrRXNYTzRYcWY2UlNxc1gvdXBtUm9i?=
 =?utf-8?B?K25BcWhieEszZ1VYbE5XR3E5TU52S0dhUnJPMDNnT0p6Q3NpWEphSVVBYXBz?=
 =?utf-8?B?NzdZTTBHMEc0eUE0Nk9PeHlDY1hVR3BWVlNjb1g4MnFSdi9CSkFjRC9Zencw?=
 =?utf-8?B?Q1lpMFB3Nmc5d0I3VTYzRWJycUsvK3pyY1hTSTkxZmp6ZjZMSlpIUnNUN2to?=
 =?utf-8?B?b1hXS3I0RFhvV3RFc2JxZUc1SmYzWFZOM0JFMGNnRHNnbUl1dmNENDNXSDJJ?=
 =?utf-8?B?T2k1Vk12YzcyZXpta01DU0hvKzFGeEFiTm5Wc3pmN2d2dThMWXluWWlWMXZm?=
 =?utf-8?B?ck1tT2psSzhOUXVjOUJiWWJrVEVHVmlDZFZUOXVjWHVBN25nc2RNT05GT0Nk?=
 =?utf-8?B?U25GUk44VUtaVGNHcWdKQVUxNVlEODVUNFFibmh6S3VJallNL2dOR1ZrTTdk?=
 =?utf-8?B?SGg4djhyc1l5cWw5bGhVWGZVcm9xUWloS2FiR0MzTFo0WmFvYXFhQVdzYml1?=
 =?utf-8?B?VDYrTnJvYmFkR3BITXBVR25DTGYrUEorb0FpNlVxa2Fqcmdoa3NpN0lzSTA5?=
 =?utf-8?B?SzZ5eVZScmRqTDN6WC9NMGxvZS9hcFdROU16b0h6MmUyZm0zMEIvRU9JMS9Z?=
 =?utf-8?B?THgyV0FYRVg4cmV3QkhqSkVVVldXbFFINFl5dVc3Vzl3a1FXZFBTZzltMW9m?=
 =?utf-8?B?VCtsK1BXaUFsN1Fnc2pUWnZxRXJPWWJQazQzaGM4bExGeE92YWN3QUNZd1Nu?=
 =?utf-8?B?UG9CWnZoeHEybS91c2R2dHo2NDQ2VUx1ODJaczRnbUQwTTl2ZG1pNC95TS9i?=
 =?utf-8?B?MFM1WkVzTGZVRCtUMWlPb2VuMWZnT0VTeUJ3TzRrWXFRNm0xSGZNYU1SQ20w?=
 =?utf-8?B?SjRUM0NMdHpHc1p6eXhzditMV2o5NnRnUERzSXkxUXNKeVRBV2VGWGZ2WURO?=
 =?utf-8?Q?lvxHlnigs4osGxrU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77FC0C094C3BFA40853C69866B7A0A38@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6907d5-8bf4-405d-e2f2-08de79ca14ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 08:43:17.4438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kakk8C64pydenQ3Ofn9HJNjo6FXg9WKWMSxZZc/LTcVQuJHk8g7/xco8FIFQAJ2VZMW4F87SRgw6PQatg5axzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9967
X-Rspamd-Queue-Id: EB1B11FCCC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,amd.com,gmail.com,xenproject.org,citrix.com,vates.tech,suse.com,xen.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,support.md:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

T24gNy8yOC8yNSAxNDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gRnJpLCBKdWwg
MjUsIDIwMjUgYXQgMDI6MjQ6MzNQTSArMDAwMCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBG
cm9tOiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPj4N
Cj4+IFRoaXMgY29kZSBpcyBleHBlY3RlZCB0byBvbmx5IGJlIHVzZWQgYnkgcHJpdmlsZWdlZCBk
b21haW5zLA0KPj4gdW5wcml2aWxlZ2VkIGRvbWFpbnMgc2hvdWxkIG5vdCBnZXQgYWNjZXNzIHRv
IHRoZSBTUi1JT1YgY2FwYWJpbGl0eS4NCj4+DQo+PiBJbXBsZW1lbnQgUlcgaGFuZGxlcnMgZm9y
IFBDSV9TUklPVl9DVFJMIHJlZ2lzdGVyIHRvIGR5bmFtaWNhbGx5DQo+PiBtYXAvdW5tYXAgVkYg
QkFSUy4gUmVjYWxjdWxhdGUgQkFSIHNpemVzIGJlZm9yZSBtYXBwaW5nIFZGcyB0byBhY2NvdW50
DQo+PiBmb3IgcG9zc2libGUgY2hhbmdlcyBpbiB0aGUgc3lzdGVtIHBhZ2Ugc2l6ZSByZWdpc3Rl
ci4NCj4+DQo+PiBSZWxpZXMgb24gZG9tMCB0byBlbmFibGUgU1ItSU9WIGFuZCBQSFlTREVWT1Ag
dG8gaW5mb3JtIFhlbiBhYm91dA0KPj4gYWRkaXRpb24vcmVtb3ZhbCBvZiBWRnMuDQo+IA0KPiBX
aHkgSSdtIG5vdCBvcHBvc2VkIHRvIGFsbG93aW5nIHJlZ2lzdHJhdGlvbiBvZiBkZXZpY2VzIHVz
aW5nDQo+IFBIWVNERVZPUCwgY2FuJ3QgWGVuIGRldGVjdCB0aGUgYWRkaXRpb24gb2YgdGhlIFZG
cyBhbmQgYWRkIHRoZW0NCj4gaXRzZWxmPw0KPiANCj4gV2hlbiBJIHdvcmtlZCBvbiB0aGlzIGxv
bmcgdGltZSBhZ28sIHRoZSB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgdGhhdCBJDQo+IHBvc3RlZCBo
YWQgcmVnaXN0cmF0aW9uIG9mIHRoZSBWRnMgZG9uZSBieSBYZW4gYWxzbzoNCj4gDQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE4MDcxNzA5NDgzMC41NDgwNi0xMi1yb2dl
ci5wYXVAY2l0cml4LmNvbS8NCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxk
ZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE15
a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gICBDSEFO
R0VMT0cubWQgICAgICAgICAgICAgIHwgICAzICstDQo+PiAgIFNVUFBPUlQubWQgICAgICAgICAg
ICAgICAgfCAgIDIgLQ0KPj4gICB4ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlIHwgICAyICstDQo+
PiAgIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCAgIDMgKw0KPj4gICB4ZW4vZHJpdmVycy92
cGNpL3NyaW92LmMgIHwgMjM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+PiAgIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgfCAgIDEgKw0KPj4gICB4ZW4vaW5jbHVk
ZS94ZW4vdnBjaS5oICAgIHwgICA3ICstDQo+PiAgIDcgZmlsZXMgY2hhbmdlZCwgMjQ3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vZHJp
dmVycy92cGNpL3NyaW92LmMNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hB
TkdFTE9HLm1kDQo+PiBpbmRleCA1ZjMxY2EwOGZlLi43YjBlOGJlYjc2IDEwMDY0NA0KPj4gLS0t
IGEvQ0hBTkdFTE9HLm1kDQo+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+IEBAIC0yMyw4ICsyMyw3
IEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2Vl
cGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLw0KPj4gICAgLSBPbiB4ODY6DQo+PiAgICAgIC0gT3B0
aW9uIHRvIGF0dGVtcHQgdG8gZml4dXAgcDJtIHBhZ2UtZmF1bHRzIG9uIFBWSCBkb20wLg0KPj4g
ICAgICAtIFJlc2l6YWJsZSBCQVJzIGlzIHN1cHBvcnRlZCBmb3IgUFZIIGRvbTAuDQo+PiAtICAg
LSBTdXBwb3J0IFBDSSBwYXNzdGhyb3VnaCBmb3IgSFZNIGRvbVVzIHdoZW4gZG9tMCBpcyBQVkgg
KG5vdGUgU1ItSU9WDQo+PiAtICAgICBjYXBhYmlsaXR5IHVzYWdlIGlzIG5vdCB5ZXQgc3VwcG9y
dGVkIG9uIFBWSCBkb20wKS4NCj4+ICsgICAtIFN1cHBvcnQgUENJIHBhc3N0aHJvdWdoIGZvciBI
Vk0gZG9tVXMgd2hlbiBkb20wIGlzIFBWSC4NCj4gDQo+IERvbid0IHlvdSBuZWVkIHRvIG1vdmUg
dGhpcyBvdXQgb2YgdGhlIHg4NiBzcGVjaWZpYyBzZWN0aW9uPw0KPiANCj4gQWNjb3JkaW5nIHRv
IHRoZSBjb3ZlciBsZXR0ZXIgeW91IGFyZSB0ZXN0aW5nIG9uIGFuIEFSTSBib2FyZCwgc28gdGhp
cw0KPiBwcm9iYWJseSBuZWVkcyB0byBiZSBwdXQgaW4gYSBub24tYXJjaCBwYXJ0IG9mIENIQU5H
RUxPRz8NCj4gDQo+PiAgICAgIC0gU21va2UgdGVzdHMgZm9yIHRoZSBGcmVlQlNEIFhlbiBidWls
ZHMgaW4gQ2lycnVzIENJLg0KPj4gICANCj4+ICAgIC0gT24gQXJtOg0KPj4gZGlmZiAtLWdpdCBh
L1NVUFBPUlQubWQgYi9TVVBQT1JULm1kDQo+PiBpbmRleCA2YTgyYTkyMTg5Li44MzBiNTk4NzE0
IDEwMDY0NA0KPj4gLS0tIGEvU1VQUE9SVC5tZA0KPj4gKysrIGIvU1VQUE9SVC5tZA0KPj4gQEAg
LTE3MCw4ICsxNzAsNiBAQCB1bmV4cGVjdGVkIGJlaGF2aW9yIG9yIGlzc3VlcyBvbiBzb21lIGhh
cmR3YXJlLg0KPj4gICANCj4+ICAgQXQgbGVhc3QgdGhlIGZvbGxvd2luZyBmZWF0dXJlcyBhcmUg
bWlzc2luZyBvbiBhIFBWSCBkb20wOg0KPj4gICANCj4+IC0gICogUENJIFNSLUlPVi4NCj4+IC0N
Cj4+ICAgICAqIE5hdGl2ZSBOTUkgZm9yd2FyZGluZyAobm1pPWRvbTAgY29tbWFuZCBsaW5lIG9w
dGlvbikuDQo+PiAgIA0KPj4gICAgICogTUNFIGhhbmRsaW5nLg0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUgYi94ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlDQo+PiBp
bmRleCBhN2M4YTMwYTg5Li5mZTFlNTdiNjRkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMv
dnBjaS9NYWtlZmlsZQ0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9NYWtlZmlsZQ0KPj4gQEAg
LTEsMiArMSwyIEBADQo+PiAtb2JqLXkgKz0gdnBjaS5vIGhlYWRlci5vIHJlYmFyLm8NCj4+ICtv
YmoteSArPSB2cGNpLm8gaGVhZGVyLm8gcmViYXIubyBzcmlvdi5vDQo+PiAgIG9iai0kKENPTkZJ
R19IQVNfUENJX01TSSkgKz0gbXNpLm8gbXNpeC5vDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IGY5
NDdmNjUyY2QuLjBhODQwYzZkY2MgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtODM5LDYg
KzgzOSw5IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9oZWFkZXIoc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQo+PiAgIA0KPj4gICAgICAgQVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgmcGRldi0+
ZG9tYWluLT5wY2lfbG9jaykpOw0KPj4gICANCj4+ICsgICAgaWYgKCBwZGV2LT5pbmZvLmlzX3Zp
cnRmbiApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICAgICAgIHN3aXRjaCAoIHBj
aV9jb25mX3JlYWQ4KHBkZXYtPnNiZGYsIFBDSV9IRUFERVJfVFlQRSkgJiAweDdmICkNCj4+ICAg
ICAgIHsNCj4+ICAgICAgIGNhc2UgUENJX0hFQURFUl9UWVBFX05PUk1BTDoNCj4+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy92cGNpL3NyaW92LmMgYi94ZW4vZHJpdmVycy92cGNpL3NyaW92LmMN
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi42NDA0MzBlM2U5
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3NyaW92LmMNCj4+
IEBAIC0wLDAgKzEsMjM1IEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seSAqLw0KPj4gKy8qDQo+PiArICogSGFuZGxlcnMgZm9yIGFjY2Vzc2VzIHRvIHRoZSBT
Ui1JT1YgY2FwYWJpbGl0eSBzdHJ1Y3R1cmUuDQo+PiArICoNCj4+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMTggQ2l0cml4IFN5c3RlbXMgUiZEDQo+IA0KPiBJZiB0aGVyZSdzIGEgQ2l0cml4IGNvcHly
aWdodCBoZWFkZXIgaGVyZSwgc2hvdWxkbid0IHRoZXJlIGJlIGENCj4gbWF0Y2hpbmcgU2lnbmVk
LW9mZi1ieSBmcm9tIHNvbWVvbmUgYXQgQ2l0cml4IChJIHRoaW5rIHRoYXQncyBsaWtlbHkNCj4g
bWUpPw0KPiANCj4gT3RoZXJ3aXNlIGlmIHRoZXJlJ3Mgbm8gY29udGVudCBhdXRob3JlZCBieSBh
IENpdHJpeCBlbXBsb3llZSB0aGUNCj4gY29weXJpZ2h0IG5vdGljZSBtdXN0IGJlIHJlbW92ZWQu
ICBXZSBuZWVkIHRvIGJlIGNhcmVmdWwgd2l0aA0KPiBjb3B5cmlnaHQgYW5kIGF0dHJpYnV0aW9u
Lg0KPiANCj4gQW5kIGluIGFueSBjYXNlIHRoZSBkYXRlIHNob3VsZCBiZSB1cGRhdGVkLg0KPiAN
Cg0KQ2FuIEkgYWRkIHlvdXIgU09CIG9yIGlzIGl0IGJldHRlciB0byByZW1vdmUgdGhlIGNvcHly
aWdodD8gTG9va2luZyBhdCANCnRoZSBwYXRjaGVzIHlvdSBwcm92aWRlZCwgSSB0aGluayB0aGlz
IG9uZXMgd2VyZSBkZWZpbml0ZWx5IGJhc2VkIG9uIA0KdGhlbSwgYnV0IHRoZXJlIGFyZSBhbHNv
IGEgbG90IG9mIGNoYW5nZXMgc2luY2UgdGhlbi4NCg0KLS0gDQpNeWt5dGE=

