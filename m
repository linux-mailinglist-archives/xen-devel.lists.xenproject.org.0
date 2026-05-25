Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE+lFBs7FGpDLAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD95CA460
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319206.1586930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3b-0004mz-0D; Mon, 25 May 2026 12:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319206.1586930; Mon, 25 May 2026 12:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3a-0004ji-SL; Mon, 25 May 2026 12:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1319206;
 Mon, 25 May 2026 12:05:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wRU3X-0004UC-A3
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:05:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRU3W-009ZMm-MN
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 14:05:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143aef-2eae-0a2a0a5409dd-0a2a4508d8a2-20
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:14 +0200
Received: from [52.101.66.92]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143afa-63b5-0a2a45080019-3465425cc28e-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:14 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM9PR03MB7026.eurprd03.prod.outlook.com (2603:10a6:20b:280::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 12:05:11 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 12:05:11 +0000
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
 b=Xrds4nm7JxNrnnPdGnys41jOQxYhVNN8L6uqjc4evF4ovE7FyJDyY0M6pQdC1iCz4ZDLT4o6O6zK9ku3sX07N4g2Dfl+4bW3r9YYMDsyrUXjb0OjliAw1zApb+TQ+RTCLIHuxy6JMhxKFsYFmVnPjLktY3JO7trndbsGNnyDKB6A8osaxVxZJ6gdSZ8feOlj3G0aIoFSfs1Q/rYrPHySvrsQ8xjlvep8ytVAzg3wNhmIiCuTJt37ojvGhH3jVIPZl9EiVKFK4p46dH2n30SP41i4v1gxYxlBqxna81CFSVC1pT7loNy+HW5VO4lcLlXpW0ZmM+D4QCw8Zx0hc4sQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHEcpWwv2FcGeXR0uHdB9/GQWUnOUZtgyNumyPniiaU=;
 b=QqP3k5Wjh6r/ImOzwIAUPtLqPDDQSAuf9kf6eqeGb+0EjmIf5KIyW/oNr9LLAzu+uA394zoXouOF9oKiw2fTGgF3hEtuAxPyeLc0dnx1gThKBU46Ez3UlneplGNLEUA1aaEx2niOv3zKSOE+v0ii7FMq81/MBUpq7xJZyVB6Ij5zLiItufMOWSRN/qfQmOOL5BAncikKoiQonOZN+fSPIXgkuB0MPViyYJKnAKJ/Km8lQ58hKxth/eKzFZu3xhIPQ0ZdI0sXTnDFJnrk3Ec7UlgbqI4wT3mZb2F/YvOjmsokwB8VG5hfA12L5dq2wjuq0Gq0iETy2htnOcGjbGvRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHEcpWwv2FcGeXR0uHdB9/GQWUnOUZtgyNumyPniiaU=;
 b=PJKIv5NhHljgspuGZ7+vKAuAvUGh2mX/kAN7abZeQLW3ORSs/CBcAf27tLSGjrWVrNSS/l/KeYF44fXmxN+fiDY5kZOe2iSNwx+FgN5fLime1Nelanjh/A58x6NVhIhrRXWshSpt9FXD/nT29OLjDmjTZb/fqktq95dtwQ8Z6BD6+5o9V2i74w6pMm4Gq3IK4NsKJlYPtNN61XhhSDzr+lgsDI+gUwt7f/Px0yXs3Qa132aAMf6oqMjWcUJc98IrHxmcOhDkBQZyKtIgoPYJF35R+SKXHdphNIPjYnf0tEAJe/FPhe4XDeVHJPpMAEZfnh3JGK3yyMgUE3PHDW/2xg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU fault
 handlers
Thread-Topic: [PATCH 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU fault
 handlers
Thread-Index: AQHc7D68DYz1t9d3DEat28YU/t35Lw==
Date: Mon, 25 May 2026 12:05:11 +0000
Message-ID:
 <9a9f7757613143c1b1e9806a134df7b3afb5ca54.1779709902.git.dmytro_prokopchuk1@epam.com>
References: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AM9PR03MB7026:EE_
x-ms-office365-filtering-correlation-id: f83490c2-b103-4cd3-a7e6-08deba55df4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|18002099003|11063799006|56012099003|6133799003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 X52CCRIoq2+9rnmy+epSwDjA9Wpz/oxIiMHNNAmI38XsFjG2wOF185ktnv1LO/EDIPUEOQN/kxuwxMYz1IWMGvKwj65ZEVstjL0d+tduFR7iLEk3hBnXc/hdUzIGSUoSsN2IM2xN2RlS615MOJiL6GErHXNzqZjRrpli0lB2Co8RvnnEnnaVqAvqHGUcihjkgTafL/3c9cXbWPluxEI3Vus8C9zh81RjU2sA/w0LPViM7ba+bMMhHS3Lf/EHex3wfrL6XRs2x3rfOMPyeRxQCxiL7z1Z7hf/pZoRvaBcP4JlaC7dMSSwLYA54O8mUmGgTZnX1hfv8mVdUX0yHkMFaEwxt4PazWDMPywWl6hH8iugcIYg7vw6ASVzPKkbdHmWVTj3TEkc7MRmWHjkBGua+8hlrOeLmUd9YWA++Ght7ZUZsULuP12zsLnP71hRFVBGx3vWcGTFE8yJwl+GfD106cBieBCNP2ab+xekAzuId8J/F3zV6qd/9tP4XfKe1Ly2PSwKuwhEr5Gw0zPaLmgOdHfEU9Ba6/GxzEESfvmwIDY54v9bMHZtY+Y+imIjN7meD93WweLJ7SJ65MNx1rIns52Lcb+ssx8dtmvad9NYKAeHyb6MWRY3GlGJt37KrJSjWi69exLIg1o029Mqmb+pjoYqYTK8WlW2qayFwcLDWUGO0fupijItJxZse8fXqVjl8ZwyNPR98AywqBepkbukXKrDzJZSDSkYk20lk6ssLTKmMQUhFzQQEPMd2lfB8etw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(18002099003)(11063799006)(56012099003)(6133799003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oqU7YxvYaJD6bB4sToKBYM9g3AtvAvEFeEvrrDz6X92u+QxgW0AeGgN2ch?=
 =?iso-8859-1?Q?h2tEY+Rk4Hf1bKfsMvliBxSDgBB9bAYeETbKHMeiRJHaRIAyJfJ80hLnjk?=
 =?iso-8859-1?Q?JnxkMx4257s++KpOqTSTTmLntTg016ftBSt7UpotyYvmq6TOswEaYlCPox?=
 =?iso-8859-1?Q?AfVYp42NalRlFXa4MXfp9P6OJXI80ClyUORH7SLniHb3lQrD3U26eI1zcS?=
 =?iso-8859-1?Q?p6t0TXxgH4srl3+VCe42uk60Q1skZHHKRnw1jIXhBOnB1uGvKtgDY7tFN6?=
 =?iso-8859-1?Q?NY3Q+c25eyfff5rJWGrC+LT2azW7GkGpIiYos0XWW4sdlTseoKS5+9S8Wg?=
 =?iso-8859-1?Q?kCrftM3PPWk8ljjj+pbsON99VLwjXEKFzI48DXcpUN8MMoh7hA+afkgwWo?=
 =?iso-8859-1?Q?i69EplpD/jb09OwgUQFVRlY6WSHcrP5KssOQibV1o4m+lsG0mnclef0TNs?=
 =?iso-8859-1?Q?+YDX9iot/6iKyF9upLlynpC3nRlZL4T9M1/Xd0i/vl5CxtWxbAWLq5VXPS?=
 =?iso-8859-1?Q?zmOpOUTz0utkeCgtOvvsceKMjtL2NUk6ouOcHxbfK+ZxP8GGd0l/28TS0V?=
 =?iso-8859-1?Q?zfRX96vuW7ovq1SqvNuEyzTfcgpScjc4jlUAKGGv3NXN3VWmrvFBaX8vks?=
 =?iso-8859-1?Q?ph5c1gINNrlyosiwAEnIxa5C0croBo/EYRvMSl/1Tv8113bWdQ0inHvHYx?=
 =?iso-8859-1?Q?ctP9RYIcXcogSW7ZfU4pbRUk1krngcTDKcyfJ6+bQlRdNXlAMp5JFyph4y?=
 =?iso-8859-1?Q?HHKn8W8QDkmlKZy89e5sdudHEWXCV9KurxgX5jsL3Ny7+mcM6/Khi4/bIE?=
 =?iso-8859-1?Q?0pksA67h03onaCLag33J8Fkg8Mw9Wklgshz728usJ2p8ZHlU70CPExOpsM?=
 =?iso-8859-1?Q?0+n/QBw2AC2cz8/tFfn9bE78L054kOaiQrqR1HtytKbNdEF1cumXhWHNsb?=
 =?iso-8859-1?Q?zn04Xt20pEY46xzvbd6mis6GPc38a/Iw4vA7Wql6NTrEChFH+8x4RtlAC1?=
 =?iso-8859-1?Q?PwzyeNI/JYzbbMobDvdqnVekxC8WGGxnEFHPQfUTgf9DC7eaXNKuIzproB?=
 =?iso-8859-1?Q?iq4ukRMnH4PPGK4DFE4XuN9j4h25FBMRJfnd5iI5LLEuq3Cac5glbkdw0U?=
 =?iso-8859-1?Q?+5lKLldUpS/YI3JBRi0FNix6SJ6jSYNdLRYYFTmoGuPPFphUY9cuSKYKXA?=
 =?iso-8859-1?Q?ekLgu2v9JB8YixRpkSVmXvkXWqaVvypVvlE7eTxW9yZBjydlAqc7ULRPIg?=
 =?iso-8859-1?Q?IognGHj1t9OMhRrNgYYK3AJ1qPtLGnHxmRwm16R3QmejDVUnvwyP7hA9Vd?=
 =?iso-8859-1?Q?DhS7URjyEoQaqYFOl3OfCdwPkdVRgaTB0cWygaSx1YAhs4aS+z9uNhSr4Q?=
 =?iso-8859-1?Q?N2QYlO5cCJX9AGRXGV5IWNsFGKzrn38R/hk4k7eiCM+WOnDSyOKO8VMDdP?=
 =?iso-8859-1?Q?kC2D8AFY2QRyZGWjDgPJcehiUhu8XlR8iGURAzb2R2raPrqfD8v2vX+5SR?=
 =?iso-8859-1?Q?ZrbRPdnLRvmT5Ee1vd1x6SON/UJLmeTcJRzGBsHy/YGTX00rYMVMBPhn5D?=
 =?iso-8859-1?Q?qbEFqqScuScfLrLXWjwepzV1hkPqwLF4r0mmrPTjr5PiX4OKhrPCZeuiel?=
 =?iso-8859-1?Q?D5HE2uS+medlGVgWtkrP0P5BXXBU9N0q+8Vly3UnzumST+2g7gTRPH/uY/?=
 =?iso-8859-1?Q?+ewYBKnWQBVFJFDiDzt/LfaQbm4ZwbGZiBnkewmkfUZABuqy3brfIpC54C?=
 =?iso-8859-1?Q?h/4VY5nXUNWnXOYhOov91lAm9FTJu+PZtoQ/KtpFLWg8nur6sbJHe11pKs?=
 =?iso-8859-1?Q?AQrrChGKMQ7lNNPoPX6qRI9/WOkQ8V4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83490c2-b103-4cd3-a7e6-08deba55df4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 12:05:11.4235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWfd3doEtHVI7ZRou4zgUXnH8j4/NbHql7aNtdPdmvw/wqoDK9k8/Pb2OtWtx0ECrYB/QX7dDDe8tCduExkrCICBkGnylGLHpfveFrK+Q3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7026
X-purgate-ID: tlsNG-c1860d/1779710714-BCF62DB1-56AE5B67/0/0
X-purgate-type: clean
X-purgate-size: 3670
X-Spamd-Result: default: False [0.81 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 06AD95CA460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate intentional identifier and
macro name clashes by specifying the macros that should be ignored.
This includes 'arm_smmu_global_fault' and 'arm_smmu_context_fault',
where the original ARM SMMU handler returns irqreturn_t, while the
same-named macro redirects later uses to a Xen wrapper with the
void interrupt-handler signature expected by Xen 'request_irq()'.

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 7 +++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7aa64796ba..419a23ce8e 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -144,6 +144,12 @@ ARM SMMU driver calls by reordering the handler and fl=
ags arguments."
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(request_irq)&&loc(file(^xen/d=
rivers/passthrough/arm/smmu\\.c$))"
 -doc_end
=20
+-doc_begin=3D"Clashes between ARM SMMU fault handler functions and macro n=
ames in 'xen/drivers/passthrough/arm/smmu.c' are deliberate.
+The original ARM SMMU handler returns irqreturn_t, while the macro redirec=
ts later uses to a Xen wrapper with the
+void interrupt-handler signature expected by Xen 'request_irq()'."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(arm_smmu_global_fault||arm_sm=
mu_context_fault)&&loc(file(^xen/drivers/passthrough/arm/smmu\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 01f141b73f..15c88b82f4 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
        reordering the handler and flags arguments.
      - ECLAIR has been configured to ignore this macro.
=20
+   * - R5.5
+     - Clashes between the ARM SMMU fault handler functions and macro name=
s are
+       intentional. The original ARM SMMU handler returns irqreturn_t, whi=
le
+       the macro redirects later uses to a Xen wrapper with the void
+       interrupt-handler signature expected by Xen 'request_irq()'.
+     - ECLAIR has been configured to ignore these macros.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 097c20432e..88d2c5fa7c 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -230,6 +230,10 @@ maintainers if you want to suggest a change.
        the macro is a local compatibility wrapper that adapts ARM SMMU dri=
ver
        call to Xen's request_irq() argument order.
=20
+       Clashes between ARM SMMU fault handler functions and macro names ar=
e
+       allowed because the macros redirect ARM SMMU driver uses to a Xen i=
nterrupt
+       wrapper with the handler signature expected by request_irq().
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

