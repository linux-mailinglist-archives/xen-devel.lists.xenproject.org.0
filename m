Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIutGgYP62kGIAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 08:34:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C209245A46B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 08:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293166.1571049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGA7I-0000CX-3n; Fri, 24 Apr 2026 06:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293166.1571049; Fri, 24 Apr 2026 06:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGA7I-0000Aa-0d; Fri, 24 Apr 2026 06:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1293166;
 Fri, 24 Apr 2026 06:34:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wGA7G-0000AT-J5
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 06:34:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGA7F-009RdE-Qb
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 08:34:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69eb0ee1-e002-0a2a0a5209dd-0a2a4503a61a-22
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 08:34:17 +0200
Received: from [52.101.66.137]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69eb0ee9-672d-0a2a45030019-3465428966b3-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 08:34:17 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by FRWPR03MB11125.eurprd03.prod.outlook.com
 (2603:10a6:d10:1a4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 06:34:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:34:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa07ll9TbS7ycXJUpGoyjXpliSwE7Q+lx3TLNtn2tqcv0e9woYZVNJu8DIv0lEzQFSLuT15Ytgf48rtFOTMh6YOY6p+Rym5bODOWxKLbWOvK8S4g97/PY2wfBAUPzJwmJ4LPijwTodQui8HnU/jh/2A0vkqtkZqh99U1jrGHYaogOQ54K0g4pIF0/LnfKFoRrXMDXpyYfFUOgcGFC1N/cshghnspDR477rVpl+n8kT9UMZp9mxSrlFJ9feBEfb/emQxhW+6TWvvlxkBzilsN0mevJR1BmyUA+PBxndth8EgI2RI3oU8o4sd9ezNDT9pfHP0Wwmc62QoR4nSqdfNM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dufs4c+GYFiXOiY1rG+JCyLPqXHtv2LGRSLu4XNZ5Y=;
 b=lYvzFkdlv2BZftdvxXd08IYTprcsDJKqTEe4Ee2gqetOj1gF4/XvJifFy5Wk6dpKnXDqvu95UA6jmfwOSVZ3JmEnY886kdPVPSRHe77QYiEWp2Lgt/X0ua8Ii/8urrPjLMNRR19ihkxjhpCDWLcukeaMrHbfxNH+OLjTDsuroowlbNdMkDd4Yndfdv59QCU0pwbWLWVyeXVqt74cvFfx1CUEQsHEpF2wDahBCQfB6kQgLAaLcm/Z4wXrM8E52kAhPtKCw/DeVm+y8fbIyXg82p1ATx+kzYdbFVY1gi5ROrFn83D3WYTiy6Ez8DIqOp8f+12Slj6coToHzWfx/enLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dufs4c+GYFiXOiY1rG+JCyLPqXHtv2LGRSLu4XNZ5Y=;
 b=A+KPXky++/MrNEN3zokhwejfwAocrEcYzeEB40CPc8zt/VG2qQq3v6GbIL9maH7UFirc/2GDQw1hgzNx9J3sGvm0TxwuDp3PbZ6BRgsWEjCCjiUvbSC1VI2tchZBNhhVqIG/Xe8MuUmIElCnVwosh/uIGzP1ZiZA5Ncad34PsnUgztZygpEHxR09vKLP73co2mYRkaz3hGdCQyeYXebKDdQtyxMdcrB/sbZUiwTasvXM4E+t+1ss1MZSrV4KP3jkvxS6jGINl4Shg3ODvO0pODp/4HwPbtPVvd1TBDBuhgmhAGAG8PxqJCiWY3NWMwHqaEaU2+nIjWdl0twGBbr4Ow==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 6/7] vpci: add SR-IOV support for DomUs
Thread-Topic: [PATCH v3 6/7] vpci: add SR-IOV support for DomUs
Thread-Index: AQHcyClgJVtVkM11YECyJKBoUo8yu7XprXKAgAQq9wA=
Date: Fri, 24 Apr 2026 06:34:15 +0000
Message-ID: <285c7a48-f8e0-423d-9630-f4844e74fd0f@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <1aaf1a087ca0003d943d43c55500b3ab84195cf5.1775742115.git.mykyta_poturai@epam.com>
 <c8e664fd-59f8-482d-ad48-99ff59842682@suse.com>
In-Reply-To: <c8e664fd-59f8-482d-ad48-99ff59842682@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|FRWPR03MB11125:EE_
x-ms-office365-filtering-correlation-id: 8541aa67-f031-46e4-1984-08dea1cb8160
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 DmMUxYUxDoDzVW77vm7tx2PoPY/1gSqveZeLsjZVpdxxy6owy3k9LWlI/vvrwUIoNePwqgKgwdtdUiR9qEoH53CFo5GIcOSBT5hDWHqpDGQ4oY3cbETpvCu4K3cCpCZFspCLibs+1HXCrq43gTp//IIxRmCwP4B7jjsMq4OAGj510Cugk8gPKrDasBfHiroBKGshtMMxvFEnpcLMK2rt1jNFB1zheG6bVRuxj0E5WoB3PIpQ0e7kO68z02NsVMxBPwJImYHWl8duhqKj8Sagq2UWgzfWkpJmk/VlLwl8o73dDZejFlZbiB7ynkZKa5/jHz/Id/Rb7SNd5vW8GT6Lmk4pX2T4AoMvHzUN8VJ2flptkIEIbkBGRDYzfOJ5orqkTKSCZjwjBgkLJ0LwJ47gU8eHf72Aa+935+Ik+yGIZlUz8s2sEV6i25pkkw5q0otW2ZIb2xr+EIV3ty2NhrddH9STOCCIkkhpZaPKvXLs3q06weTTPY+cdR35H/RAT1vk80JpioGWN7jreh3SU6943mRJsiBqvZcXDOZnxH8TesQoLDFMTyFaGeBUArt0DGjgmY3Gt6gZYCUfBnNL70oHcth6xMvvuATFpvEJIMzGsMsSYyHlqs93A2sPobf+ANYk4fEChl5zCLALBfKk7cIowWV1zQsdNFOtnMAv55ZpSfQ3k5ddUsBOC+GgZMsjmSBA8JzMsB07+sKDpD7DV6bqsPHYARp5bhOnpq9OKg3avjlsd478//fMVC+pKaDLKhE5CBsxOpw7pcmltZIoU33ZgQGtamDbJKFHx3ar+cShV5M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NURpUm9nTHFYQ3JqWEpMalBibkFYVEhkUjVQQ213dCtkd0xzSVZscVVLVk8w?=
 =?utf-8?B?WitwL3RwMTFCVVVjbVZKTm1kV1lXY1lCYXVpVUVRSWZpeFB6ei90OUtaeWZ3?=
 =?utf-8?B?ZnJUaHN3dHFUT0haOWFqdGk4bHRJSkI5eFMzR1MzUGIwaGZTNnE1cGRPLzY5?=
 =?utf-8?B?Mk94N21xenFocjBabWsvMnVlSGRobFRZRC9HN3pVTFpKT2pBKzNGT2dVeVpN?=
 =?utf-8?B?aldQbHd5ZkMwMnhITGV5Rm9UV0JnZ1JBeENQbDNSbno5R3A0NFJ0QXlDZllj?=
 =?utf-8?B?VThaTjVveWF5bUptcUpCU1FLS1ZEZy9FMG41czRweXdJNFdKMDY0UTc0MDN3?=
 =?utf-8?B?dEY0R05veFcrc2tUcmJKUFJ0TGxidnZScHdCVjR3U1V0UllPYjRYa0U5VjFj?=
 =?utf-8?B?YmtjNmFRTisvNjIyWUpONmRUZnZVMVNHbVdFcm4yTW9NUHJ5R1dhQStuRytZ?=
 =?utf-8?B?L25LRDMwbTNOKzF4TkUzSE5Ec2R1WFlwd0wvRDZkU1NncnA2OWIzVEtYekJR?=
 =?utf-8?B?NnpGOG1lVXc4YzZURU5ud0lHMS9CM1JuL1ZWWEttWnRiTFZpTVRGWmhhVnEx?=
 =?utf-8?B?REtsVENlSDVJdDUzcmUyazdXT1ZSVmRvenJERGpDalREY3BPZDNoMkRWTW12?=
 =?utf-8?B?TVdyS0hBZ2h3R3pxZTRPUlRsa3NYbUZHRHU3ZGFZZDlaSWRkaDkwYnRLQTA3?=
 =?utf-8?B?NjNJMVR6d2dFb0t5UTBQRy9DMWtCTENhNUZBMWdhbExhcTJvZ1QrTmRWTksw?=
 =?utf-8?B?elYzNi9lQy8rdTBVNlMzMGp0bWxpMFoxRzRtdkwzdG9lS1lpLzdQc2tkQ0pC?=
 =?utf-8?B?R0VuZTVYMXVwUkdCeFVMaDhIeXBtOWxlVnJKOFlxSnQ5MDdnTmJWTFp1NUNL?=
 =?utf-8?B?SmVZZXM3MGIxZGxtcGlkOUFybVcvV0NhYmE4bWM2SG9XUDBEbEZ0YmRpdFNj?=
 =?utf-8?B?d0Q1OVlOUFVLZTJ6RlQ5TnhvcEV0ZjJBK2oybndaL29ubXZlME1YaXNyblFa?=
 =?utf-8?B?OEpOQ0pJaEdVL2EweHp0dFN1TWthQi82ZmgzcUtHYy9sVjZEcnA5U1NBUDZj?=
 =?utf-8?B?bU1Hbms5TDZ1VVZrY3FtU2Y2QldlTXFIMnlmaFM0elBuL0JwL0pXK0l4Qmpt?=
 =?utf-8?B?YXV0YzhyTVRrbXp5eWlZT0lQRG1UbHJCSi8rSTk3SmY4WjVESmFWR2ZpWldP?=
 =?utf-8?B?OGZYUW8zY3huUzNpQWRLNEpTbVp6MWVJVnByYzhaZkNEZmR6VWt2TUhEVnE5?=
 =?utf-8?B?R01Wb05CT1FoMjZ5OTNybE1TelB6dHFlc2I5U05tM3lvMDhidTN0bGxmQnY3?=
 =?utf-8?B?blNjTG5GSlMxMlhWQy9ydTVjOVdneVVPTWR3c0g4TG15SlMrYzA4aVpNRjFY?=
 =?utf-8?B?MkNpVHQ0T3g3eHBkaWxkTG1lbUtRSGxIZmpBMUo5V2RlL1Y1MURkZzJ0RUtY?=
 =?utf-8?B?OEoxUW5VK21yYTlxTi9IR2gwN3JaQUgwQ1k3MmF6MkRBRE9zYmxURzFkY2p3?=
 =?utf-8?B?SjBSbThvTkJ3K2ZZd21YUyt0SjZ0SXJUMU5BTUtvNldMK3hnMGlRNCtNQ3VW?=
 =?utf-8?B?bnlMR2ROdmlsWFVXR1RxWGsrZlltYW0yY3NDTEpEYWh2MFJBNWJTZXFPVzdp?=
 =?utf-8?B?bzN1bWd6dTgvYkhaV0VnN1V2L0xaT203Sm5meFI5c1R4SUpLbnF5czMvdTdV?=
 =?utf-8?B?U0FGbEUyTVpOTXlRUGc4WjRLSlBrejBhTTlOUm1JZWptbGR0eU9SSHBnQm9q?=
 =?utf-8?B?RndnaEZtSlc4eWNwTTJGZ29QZTBxd1p2MVgzWlhBdWFPK3dMYkd1b3ZUdmZx?=
 =?utf-8?B?cjZFc1E4eEI2eXArN2p2RWxaS1hzOERmMlpFT080VXBIUEorVXBlcXZUbEZz?=
 =?utf-8?B?T05RaWR6b2lNZ2FoZ2Y2VUVET3JKOHdVV1ZYZktHL0hvanYveWpBNGlwcHln?=
 =?utf-8?B?Z0tXbGRYd0JRT1hMZjliZGxXa2QxaDY0UStVWDZXUmF6T1R3Z3VuWnl6WkJO?=
 =?utf-8?B?ZnhFekZiYjBjSU1IbGpVVDdPWEE4WHF2aFdIMlZaV3ptNERXM3VsbjVobmN2?=
 =?utf-8?B?bVZPMlEwUUt1b2hMdE9iSVZPOHJock4yUUlUTVVldmNqcUtBcW8vcjdYZGRN?=
 =?utf-8?B?cG5OQ3E5Y2V2WTZuRno0czlYTVd3LzNCWjVtQlRoRWFWMlBHV1pBdHRwU1pK?=
 =?utf-8?B?SmNZSENscnVWTGR4UFkzZVBuaUVpTzlOZitSY2JTcWJzZmx5L0Y5NWlucUhR?=
 =?utf-8?B?RW5qWTlmWnFLeHBKQndub3R0Z1MyMVF1YXNxamIyZXk1dS9oaGx1SkM2QVJG?=
 =?utf-8?B?TVRONDBJRVVWeFpzWTByR2JZSDhZMFgrNm5jRUlycFp5QTFodk5UWjJ2SVdE?=
 =?utf-8?Q?BpfhfJtwdUVtCiEo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <747FB941024C104A9866E6C1A05D8CB4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8541aa67-f031-46e4-1984-08dea1cb8160
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 06:34:15.3737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiah1r/vsxAQn7IWUNVeSaWUZoGZqCPd1txwSEMkL8fhCqJtQkg8TZOg5zjLwANlfCpVeyjgN9MoKBfpdS3a/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB11125
X-purgate-ID: tlsNG-33051d/1777012457-A3B6C938-07E73283/0/0
X-purgate-type: clean
X-purgate-size: 1418
X-Rspamd-Queue-Id: C209245A46B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gNC8yMS8yNiAxNzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA0LjIwMjYgMTY6
MDEsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gRnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxz
dGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+DQo+PiBFbXVsYXRlIGd1ZXN0IEJBUiByZWdp
c3RlciB2YWx1ZXMgYmFzZWQgb24gUEYgQkFSIHZhbHVlcyBmb3IgVkZzLg0KPj4gVGhpcyBhbGxv
d3MgY3JlYXRpbmcgYSBndWVzdCB2aWV3IG9mIHRoZSBub3JtYWwgQkFSIHJlZ2lzdGVycyBhbmQg
ZW11bGF0ZXMNCj4+IHRoZSBzaXplIGFuZCBwcm9wZXJ0aWVzIGFzIGl0IGlzIGRvbmUgZHVyaW5n
IFBDSSBkZXZpY2UgZW51bWVyYXRpb24gYnkNCj4+IHRoZSBndWVzdC4NCj4+DQo+PiBFeHBvc2Ug
VklEL0RJRCBhbmQgY2xhc3MvcmV2aXNpb24gdG8gdGhlIGd1ZXN0Lg0KPj4NCj4+IE5vdGUsIHRo
YXQgVkZzIFJPTSBCQVIgaXMgcmVhZC1vbmx5IGFuZCBpcyBhbGwgemVyb3MsIGJ1dCBWRiBtYXkg
cHJvdmlkZQ0KPj4gYWNjZXNzIHRvIHRoZSBQRnMgUk9NIHZpYSBlbXVsYXRpb24gYW5kIGlzIG5v
dCBpbXBsZW1lbnRlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQg
PHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogTXlreXRhIFBv
dHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0KPiANCj4gU28gdGhpcyBjaGFuZ2UgaXMg
bWVyZWx5IHRvIGF2b2lkIGhhdmluZyB5ZXQgYW5vdGhlciBnYXAgb24gdGhlIHJvYWQgdG8NCj4g
RG9tVSBzdXBwb3J0IGluIHZQQ0k/IEkuZS4gdGhlcmUncyBubyBjbGFpbSBvciBleHBlY3RhdGlv
biB0aGF0IFZGcw0KPiBjb3VsZCBub3cgYmUgdXNlZCBpbiBEb21VLXM/DQo+IA0KPiBKYW4NCg0K
WWVzLCBhbGwgb2YgbXkgRG9tVSB0ZXN0cyB3ZXJlIGRvbmUgd2l0aCBleHRyYSBwYXRjaGVzIGZv
ciBEb21VIFZQQ0kgDQpzdXBwb3J0IHRoYXQgYXJlIG5vdCB1cHN0cmVhbWVkIHlldC4NCg0KLS0g
DQpNeWt5dGE=

