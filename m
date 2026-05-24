Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O97AwRfE2r1/AYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 22:26:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E465C422E
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 22:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318863.1586794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRFNz-0003uE-VU; Sun, 24 May 2026 20:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318863.1586794; Sun, 24 May 2026 20:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRFNz-0003rN-QS; Sun, 24 May 2026 20:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1318863;
 Sun, 24 May 2026 20:25:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wRFNy-0003rH-Ia
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 20:25:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRFNx-00GPJN-V9
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 22:25:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a135dd5-e002-0a2a0a5209dd-0a2a4506913a-40
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 22:25:21 +0200
Received: from [52.101.83.85]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a135eb1-7371-0a2a45060019-346553559b65-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 22:25:21 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9139.eurprd03.prod.outlook.com (2603:10a6:102:326::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 20:25:17 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 20:25:17 +0000
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
 b=c7RHpd65NfnGHQgX/nPPADbQSBvE2S0CyNwFlOoPkL0WK0vPe+MZYV1ytwIX9b0uJNsJl4OV57TW61Wy2ug8Y4/JSjwZTTjwxnrtYDwg33tX5VLLOEdsDCVXC/KU7+TStH8m9kQR/0uIAQ2lbxVQVm0j9UFoQd7A7Lx0rbRcPfscC4vIHcmwre8Yw9gyG9Obwe1wzpS6oE85FtYlVZyIS3Nky4ffj7ag2BcUslBOrbSESKkJ/buZSGvarWDgWm0WmHN8t6TIO7IBs7X9rmaxicFzT7U9Tv08uhe/AE/SITPkSZ+KaO0MkLauRqwW5RKKT7smVM50F6bRW5PtEMrx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJSrfF7UcoH8NOB8+ckJAHDIq/zh+YzR3ayQy7s7zfc=;
 b=ejOcGiJAs5DAgJKDU9PIPUdhzFlycG/59ci5KMXrnEIdiRcEXDD7qekV8CInwmLNxtonNC3wRDiYrABDSWWzNg4w2VmBLMh15Svsy/B5Y+OT641dWaNCek8Wc7AokGyOet4UwY6Iw+7z4KkNqHvuC5f/Jxa+G0DiTcMQNoC4Z7ODs63ppwo+Lf4W9/s+Nveqi3A8oP61q8OHo9P9jvGQN4ilQKwyZ6KgRafanfPpa2A0/UQriRByzo4Ri7Hfw7Z7PZZzQGn4i8Y2EOaqLDqiZsuFGcFU/XjcZ4jMRGhI9BwwE6d/DlWEuvn++jmFUk3LsIzetFTs5ZMGvmzuFVvg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJSrfF7UcoH8NOB8+ckJAHDIq/zh+YzR3ayQy7s7zfc=;
 b=gGW5xDNIIaercRI6PFeQ54/m55t2FLeJcYCpBtWWp8JM9YkZjaivUymzdX1qwaUM8XwQpJ8NeAR5r44azC7A0jFOxD0gU+S9oJOTx16fT9CmYGnXfZCGwbgX8RIurl/xOVTQMl9/KlatfQ/krGWIuMDS5bnAcTSEjYibjGYGPWA8uaSMjePjjkZLQpgJ078n/WxdZv8xa75ybET+F2TgXiAUL8IRfZ7dZlxmpV8brAnf1QC6vc9CgZGudg1wO3pD7C8hirNtatPmboHkYS150mJGi4jM+DsfJF14ZrnyZ9m2s1coi+hcuus4QqAdnQ5rGl/T9VdsUOiwGJZCXZiZrg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
Thread-Topic: [PATCH v2] xen/decompress: resolve MISRA R5.5 identifier/macro
 name conflicts
Thread-Index: AQHc67tvI/8A7islCkmHlTX7cuCR9A==
Date: Sun, 24 May 2026 20:25:17 +0000
Message-ID:
 <025bc771fe1339dfae476037af86c6bfa1048382.1779654114.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9139:EE_
x-ms-office365-filtering-correlation-id: 0ae133a2-a225-48be-a415-08deb9d291e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700021|56012099003|18002099003|11063799006;
x-microsoft-antispam-message-info:
 3H4CDkBIVMicZJHBrkaav6op1fjPp67zbXdVZjNZo3lxIuT5JjPczW/S2FX69qtsg0ct8KYAGf418ubc7D3BWuS3nWC1qOlFQZAysv0C5PukumgF8m/cHaBICNH8aGGzuUbaaau8/Fbjq2qk6jopKTuAH9Royrs/3T/niYpnzQ8HZuQHPe12QHOVz0TjWjCI5Xy8Rl4hN2kN3CmqWmKensO2/P8tfNHQeSiWOrOyNFSyBf99/rQbpg9tztcRHCa9MgkNTLSdWjE3MijNweDJn0i9X9V5tf1977pMdHM4W5QXwNXDUOQVn1PLlStn+S2sdNfkVCXh+uB6MmgRRpROjEv8bruWlylUz/eY/QAdQe9QlvBkG92Aox4GxBPvwOczlU/4btTinRclaCB64VVy2kZN66Vj/vOvwkf9Pe4IHu1sSPf8zrr/R2/rtTdlvBqIKDMzJ6RgHUQRmlPinSUEpZCURKauaDu75YcFq6rJpIpIJUJ64NTRdOKXmdQAhabQz2PILVpCCF/J/303ahI0jpGmc9k8q49V+6PbAqqNlQH+HzM0cV60HgqkgpBoidhYIOqHfKo4u817Icn4P9nvp3rttJKLEnQkgaAaq6PishQ+v9sWwuPB+S2+2JySAEoIOl5afeR/B+sr0EYedGFvorcl3Y6csAUj7cLmDy4sVlGO9OaQJqpWHxnjz4BxQmqHfKHlon6J2HLmyLfgRH1KQg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700021)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?phoG3G09IqV7aGViZyqQY8SUbMm3TH+Y3bhfmkUlhGbeMElE5fkh4faxc+?=
 =?iso-8859-1?Q?XcH4MPhpNTV6lFRJJxapFIPXuolnSdUjmmUwDxTCHlChOv8/W9WwbohtUc?=
 =?iso-8859-1?Q?SKWbA32h7ga5ocAdWiSqPBnLu9urbZlriE9NTtPATohAIFcFqq6EdS2PBX?=
 =?iso-8859-1?Q?GgJfrBYquRQ20MIFEtXlKRzC1u1fBQ9Akl6qltcaJw5krG79itSrLlG2EP?=
 =?iso-8859-1?Q?wpaks4MZZPDG79Hv4WlLcqC7XylPT1T63YmnduvWq1kjG9bi65vXGsL1Jd?=
 =?iso-8859-1?Q?cINq1p8jz6LPNV3DIChCyxde5Qma4Y+3cV7jPY8p3csZztY4FdRYYb2lgu?=
 =?iso-8859-1?Q?ahGrhUoTRkUlFCl++OoPvY/n095wNYipYjbnzwxcso6sKr3s7SRxn3HSBg?=
 =?iso-8859-1?Q?shCGhbDVBtQPpZDUbGacPqcq6JCYkjXVBAP97eQLXAS1Am3P4YaAsgAHKt?=
 =?iso-8859-1?Q?Ay4GyVHUcVAEtMVFnLg/h7mnFZZ0N1gE0Xh+FBTMdca6YNrByaL7u2qVKy?=
 =?iso-8859-1?Q?A15PFlmnTy+wHPYPoygiBx5YmGEWafhWC4WDPg68I9V23Af/2E18qmktP5?=
 =?iso-8859-1?Q?HwxZ8Rvg8qktrxEc3qRXrmDTjbppC5DCHESqQ3jPDE5qAdy0F0lbkzbYsb?=
 =?iso-8859-1?Q?4HtA2uYgihhotnSk4BQ8goh51wtIRacJa80Ti3mexaiiegxkVTTNfRSMlZ?=
 =?iso-8859-1?Q?bkutJPQmzETmjPcBMHDp5R7D7oM6c5MCw3zNfjcO+VHzgDubrImhgugB4G?=
 =?iso-8859-1?Q?7Asij5ZSlgoHl0RIjZJe6iS4oqzDQCb2ptHHWwnSvWsyQYG+zphoC3YASs?=
 =?iso-8859-1?Q?5ZTYoUjCUUYlTft2AEXhsq1HK9TabB3EadMZK4Lv3enGwcJvzQYU3znQkW?=
 =?iso-8859-1?Q?/KEI5pu2ypQIk3+dLkX+QBFNaRxz+CFypxx3OPhzIcjbW5R/+jl5g7/oqS?=
 =?iso-8859-1?Q?H96y6GOeDjIjROipKdibElKeHORMtywCGlqhgUQJNVTDIGqVqMRfY9hXh4?=
 =?iso-8859-1?Q?4Wf+lsTqVq09TWaxUtkh5grp2rJ8D1559Xs0ENtiKGpWyOpkF9+1ccSCs0?=
 =?iso-8859-1?Q?B5pcQGQIivQgdw6QlU08w5nHoubhpJ6wAjcUfENFAwvtEFHwwZ7YMrTopq?=
 =?iso-8859-1?Q?IwzQOVPdYc/rMmY1zDR+sS1Iy3tbuKa6+2rpCDzJViZhcCPOYnVRcSfMES?=
 =?iso-8859-1?Q?62L95uycEnwf150TGCTbtoC97bQC5y6eIQH6bpmi+8RAuceHaKI+SPW2NL?=
 =?iso-8859-1?Q?kq0xdNUDd5/yqh0aiOiWUF8pRjUnrsBiH2lp6ayfJM+a7ydlkI4rrQz830?=
 =?iso-8859-1?Q?L1Kew8je7nIXWp3q1/JKfzjMDEcZjaZupgxp/FHEpgR02/7h/kBGTgAnFt?=
 =?iso-8859-1?Q?hsFufyiie8pthtmUHogPv/RCJPYP1tmV4mB6PU2A2H6H19tqEm2hc+HCUZ?=
 =?iso-8859-1?Q?8nTbZ/Q6hR/AzEkUtp9bSkbT1sWhMkwV5bH43Q/WtTMQKwK+rnOAq0pOug?=
 =?iso-8859-1?Q?PN0G++pQ9uZlmYTzbDkWYkqCWjdr8EP3ul2sV+P4p+C8hSs4Ppwk2llT3k?=
 =?iso-8859-1?Q?wRJSiOHMX98wx8gTNJ6EsMjrOR2lnN0GAAnDtrL/bqnXxedT0TCI8uqMEI?=
 =?iso-8859-1?Q?VrgHd+y7rzW1hdF9oGVl35Misu1X7xxxps40ISWoEV6mvqt2ukRjip2LcA?=
 =?iso-8859-1?Q?DiUNG98Tub/1UrcFNdcgiCJKTPQpEdShhUHdPWLyn4oroN7JAm2c2RHlgh?=
 =?iso-8859-1?Q?b7EjVp4954eHRUXoy5s4X9BahJYUlXM0YYnWhdFHTLza5pR8Bxi9RNGBCu?=
 =?iso-8859-1?Q?Wx1r07kaHd/rI7f7teg3E6o88RQ4vhI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae133a2-a225-48be-a415-08deb9d291e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2026 20:25:17.5034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q5xIqHbX+21HprsdDVRbyPOqdYrysRRYBrua/QggjyUtNDlfsjjCxCEdV0PwW2pjDNe9iAq81glqziesMEo2yH1FbiL8tUC7tfKJtGiM1Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9139
X-purgate-ID: tlsNG-16d1c6/1779654321-8C47CD75-EA14523E/0/0
X-purgate-type: clean
X-purgate-size: 1690
X-Spamd-Result: default: False [0.81 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 62E465C422E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert 'free' macro in 'decompress.h' from object-like to function-like
form.

The object-like macro '#define free xfree' performs unconditional text
replacement, causing conflicts with identifiers named 'free', such as
struct fields in 'page_info' unions defined in 'xen/arch/arm/include/asm/mm=
.h'.
Function-like macros only match when followed by parentheses, allowing
'free' to be used both as a macro and as a struct field without conflicts.

Applying function-like form to 'malloc', 'large_malloc' and 'large_free'
ensures consistent macro style.

Function-like macros also intentionally prevent uses where the underlying
function identifier is needed directly, such as taking a function pointer.
No such uses exist in the current Xen codebase.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- converted other macros for consistency
- updated commit message wording
Link to v1:
https://patchew.org/Xen/69ef81a2f85b35e6231ae389bf271cad2bbd7dfc.1779394622=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/common/decompress.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index 034c833665..487856e1bc 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -9,11 +9,11 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
=20
-#define malloc xmalloc_bytes
-#define free xfree
+#define malloc(a) xmalloc_bytes(a)
+#define free(a) xfree(a)
=20
-#define large_malloc xmalloc_bytes
-#define large_free xfree
+#define large_malloc(a) xmalloc_bytes(a)
+#define large_free(a) xfree(a)
=20
 #else
=20
--=20
2.43.0

