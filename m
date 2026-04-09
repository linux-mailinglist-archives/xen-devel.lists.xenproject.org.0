Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMhpAs+u12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8A3CB90D
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277412.1562612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmB-0000B3-GN; Thu, 09 Apr 2026 13:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277412.1562612; Thu, 09 Apr 2026 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmB-00007n-CS; Thu, 09 Apr 2026 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1277412;
 Thu, 09 Apr 2026 13:50:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wApm9-00007H-4D
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:50:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApm8-005hHg-GO
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:50:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7ae9a-bab6-0a2a0a5309dd-0a2a4508a406-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:28 +0200
Received: from [52.101.65.135]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7aea3-fab6-0a2a45080019-34654187b92d-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:28 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM0PR03MB6132.eurprd03.prod.outlook.com (2603:10a6:20b:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 13:50:26 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 13:50:25 +0000
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
 b=clixax+jzXYK0s3DnxNYxlgNBMewUnIhN4A1TlCXgH9/9znWRI2kGU//Nnu8j08SrxRwn7pufiXUq7pyH04OJe/UmFsAQJ2uT2Ntk/KCRFoq8L8RoJAdKtRgShbJE8iq/buLsFIuGyCci33udaPJURP+IoJlL7OOvVLih+3fZlKeLxmAagnSwqUsYTA4YiOgXwKk8NxXZ5iMm6k0EBowUjE3BSoSFp8wh1JhEwraXFWnzeA7TQyIzg5c0IxDW9hoCOgLlwePdKza38LDKAZFto5W00vNi7fEl8vNuoAsmHXUyh0Dl//Z9dLhoNmpbHsa4jKEVbyjnZA9wZdl7qPGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWk0b/gbdHiEsL9b29E7NaM7gms/+2H6hdGEui5llV0=;
 b=ybZSH84jRfcKqBvwct1euR/yKPP2FxzgdPlNuHKiSnY+V2ayu6kbrKQtZ3CKcq+j1grjFD9KJCx8+6pnGe/QCtpnhRhvJsn9BJKbcUzgLLwyzXPbD5/mIDLS6sc1BmuuziJDqaj0wfns75VqNduv09+AVUGb06uCMuRKw/aQL0DwgBYK2I+1mwl4FVLJIpkTmYhNv2oynWJIKdAv+jnSF5TNXrCJNhpJQ0E22vxZ99xRuG0mSTu+BLijtIutqpg499z4fEnO2p+7UqeZhoX4dLLLGjN1UYA3tuwOFOVFppeABwSXIz3kTivWVGdiJl9noR5Ch1z5sIt1VFNiN997Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWk0b/gbdHiEsL9b29E7NaM7gms/+2H6hdGEui5llV0=;
 b=lRcJfXb+IU4VFySrAOgzXeGYDKRE8eoXAaszk61dGLo38CUBJ939CYOITc8D47/fRJ8C5b8sPHzyWUa+gilBh8Z//LPTBViQOMGYS61gzyAOEnA7bJ4n5AuTOQhdNiRIdXAI3Z5OSne0XioqhnVt4cVS+3G+Xdsfsd9BJYsDFzb3rJUoYrXdrpLBSK1A7/m8n2NUBP/4mVI+gUbbcgAfdK+4W66Rkypx1QA1g/w+mwD8MQ1FtPnExWcWvOXtTOkrcxIwSyx9KitrLSqqPZn8AqTGiDse2IEPCvVmWYuofOckKNBUnOHYdgGfYGstp5aQN7VsU+bTuPBgn4i4uM118Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2 0/4] xen/drivers/char: fix IRQ registration failure
 propagation
Thread-Topic: [PATCH v2 0/4] xen/drivers/char: fix IRQ registration failure
 propagation
Thread-Index: AQHcyCfR2w68ukca0EGyU3O5OTVPxA==
Date: Thu, 9 Apr 2026 13:50:25 +0000
Message-ID: <cover.1775742562.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM0PR03MB6132:EE_
x-ms-office365-filtering-correlation-id: 1320194d-9c28-4a15-f0a0-08de963ef3ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 c5BrM7ES3vwDIIh6wryN+yuj/EDJCZOGfY1VBfniPGzLq5ASdGwddiJjfbDF9/RGxhsj4bQn1osQYnzrBBbUfmSFhKbGgXv2Ak9+bzKaePL7zpzyqkX7edihkoCHHvXhRwsWV4zqFriYZngA+2Fl2nsoqrqvn8RxMc3+4CUlt+H2ahNIJ/UgcHB5pyeHzjldGORDRYwZl4z7idXnJHNjjeEAR71u41s6iNG4qV82RGzfjRKf3HVGG91QsdByCb4cMybQCFLZM5COUY0wXP5ps38MxHzpFkHXPhMu86GhmjxBAe/dMfPRqXjQkxXa44QvgTx+3kDmYQpN2H/xGGnH5rOcXgX2LsmAEMOMddNfEuHMiAg+Ljrr8NoUwqHeYssPfl8p4Bav2wFBuZMcDZYf2mrOI6+srtiA9hBcEQrzzyTIuloZmCrcDHmqzxBqKS+ogYjxneSu9RYBgtcHvgqBdokUSKSXzRYbVFX2unPEDYPIKsDvscTx3Bdut47OHBWLKleiuwvX4nXzsLOuI06NO1CGR2UcHGzHd3DiUGmcWYJ+CjhYe57NffolIrTiKYrYE+wdMcO+FVKEVoTxUvUneNV/ea8ncaSh8e9xks2y7SnfUsnWTqw+JVo0XtRhKbf9EdHMiKkGMhBonL2J0GNKTBDKUT4IRV/fNQwV692RiUr01UPaaeA/M72kvT91Q8/R1d8IHiPZ3tS1EQV3lM3USgEzGUCYGP8R5e70/hUqh1PAUVzPvUFs4jwOsKICCogwd0oLfoqXU9vf5wWs5pEgiz98IorFVfxGd9looImkov4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kZDfthteOVx+yJhZlEIY7lELys2e7QoQRdOtLtch3TJ1R0h2349Oc0G2rn?=
 =?iso-8859-1?Q?eV4QuwP8TpTMstGF6Io3ip+I1pqPBp0m+2Erj8XqrZcaL5aEdQjII60hBN?=
 =?iso-8859-1?Q?uaSl0YAOhjD5ejwzw1H/Ogme9YrpGtnqkz0KolhfflaW7XLMDlyd4VRDFn?=
 =?iso-8859-1?Q?kxfirhmCZzhrzyb41mt34EYS43a2Rj97qbxk5sFwo/f0VDTZdsAt3W236x?=
 =?iso-8859-1?Q?S2ARv4eJ76flD0ZokpfNX4Cmkz72IwegcAh4qkGK8XbJ77scnw192GMcnY?=
 =?iso-8859-1?Q?uq+gGzRoIM/q4o0T+ndrpFPqR3y1pVLhbmGc0j/xyDdV/dWoczokzurX4M?=
 =?iso-8859-1?Q?HCSgcNP8f4IvOsfgiSfUoyuHuFbSmj4b1qJJ8TECtrgkdRTmWEr+ut6xIg?=
 =?iso-8859-1?Q?9zWajAqRZGsECApZTWYYG/tWhhjYYxr+AnmgDZ0lg2ea1buxsftNDK+5jr?=
 =?iso-8859-1?Q?7PjwFLAKbEpboSCOgC0Z4sUGOnRdum2hm0NyzNl7Ve7ajq66fCs1Tra0ML?=
 =?iso-8859-1?Q?6JeJe4fb92FIUtOqbNV7UWWA23xD2FqhuObbpqMoIUv/U0HFN1xN4vsDId?=
 =?iso-8859-1?Q?9uDj+E/4kdQejOUxrFQjfg/w+h5fVNc6iUPEWa7G84yTnXbjlECdI05KWr?=
 =?iso-8859-1?Q?yDrQsTBFpv9vwWvDYKzrqQqmh5wx9PqdJwaVNHt4R/m3DunbOdKns+tzlH?=
 =?iso-8859-1?Q?xXZtHEGwk0Z38FIZunq2ZaDcNO0mwTvt1kPl6QoSLpjNIPA/bU1iknv/ES?=
 =?iso-8859-1?Q?Z4sR4EiS7iIb90EJFzF2LQ7hCQ3p/Jv/nKEh9H/2ioEUX8f2/O0ifLTkA4?=
 =?iso-8859-1?Q?M+SWFg6q8zCRBpnHSpiARx8BXd7RRdv0lmbZbD1NjSR/TNc2tSEOqDoWuT?=
 =?iso-8859-1?Q?OVo1BQa6qxq8M6OEEvRa7EVFToBljCLL6i5HMPKQwFQCc8IikEfjB6F2Ir?=
 =?iso-8859-1?Q?pt1i/RCK8EKHnMGtWgMt9Urmbq1o/jQ/XnrjivUq7CbdnP1Ybx2BT0NSw5?=
 =?iso-8859-1?Q?Wl4rUT/fXJE9n4fknAS4fG57aghmJ2GbrXi8vCiQdMA0GMeHT7rjMkUn7b?=
 =?iso-8859-1?Q?54vRmiGdppYQNTYTSasqIX6t4OSj7xHFswymIdKeGXwI72haCAK97gjlL9?=
 =?iso-8859-1?Q?Gtf9N+0Bjm7sygAyNqhxyxlOTrl9RGFOwI16Autg46WhvIFQ7XC73t091X?=
 =?iso-8859-1?Q?erIWR0cMH4H7lZgwkK1tOXOw2ghk3jmuGqc87qAT2onexP90StofuWNWbu?=
 =?iso-8859-1?Q?ZMseqtPGEHbmbx8oFUPJgh1P+cqV3AjjmWp43ir1ozPE0VHvVAk8F9FVtz?=
 =?iso-8859-1?Q?/RV51jpGvQt3T18GyZavLVLF02unfC0Z8kQCX3Olu4fKre+np5lF6aCLP6?=
 =?iso-8859-1?Q?pzDUwQZOdzyLS5NbMZTxM6ZN7v50xer8uQPvqygeHWgaFiWVJhL4h+v4qg?=
 =?iso-8859-1?Q?NM/ZYlpMaz31aqRcuplDgbE2J5uTMdHj8lgtEQnSJPhV9Ip7OQgn1DosWV?=
 =?iso-8859-1?Q?C4x9YCyFPVC736ceXGBPxzyjDPUx1U72ALOlI1vOdhvR67gZgypvaGfRmH?=
 =?iso-8859-1?Q?07K2r9JuhcWjWk+z9TyjZKaTQIG/e0AQ/1nEOZT1f93g2Qa8A2Vm++lTQ7?=
 =?iso-8859-1?Q?HGH4RrtvH9nt6w5ae5CklihqKmFPJ4pqK/EwctnYooNA4ZtDVd5rLrNFy4?=
 =?iso-8859-1?Q?rkxRYQjXuPrYTy8Wv3u0z//6XVUoUQJUaWSOi320qMaEX/btF6WdyWxPhs?=
 =?iso-8859-1?Q?TP+3ZB1gNamYxnJ0yi7pB98iB53pUN2j23dh5qF3pqezPuMVZBod0gVtwh?=
 =?iso-8859-1?Q?diW0x/eJPM/uY8TExsS++D+4KdovXSI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1320194d-9c28-4a15-f0a0-08de963ef3ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:50:25.7291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxnsbkeTOQx/EYtQps4Dm+hVYoYGH9YegnkyaAZG9R2YRyq6xOadhUwDNchrzA5Nlq00z1VgLo1Xyvz4xwxHDn5IZ9NJLXeJSS7ihYV3ge4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6132
X-purgate-ID: tlsNG-c1860d/1775742628-7674E497-1D6CA441/0/0
X-purgate-type: clean
X-purgate-size: 1796
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 24B8A3CB90D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a common bug pattern found in several Xen UART drivers:
when setup_irq() fails during post-IRQ initialization, drivers log the
error but continue executing and unconditionally unmask hardware
interrupt lines with no handler registered. On platforms where the GIC
receives these asserted lines, the result is either repeated
spurious-interrupt warnings or an unhandled interrupt fault.

Patch 1, originally submitted as a standalone fix in v1, addresses
the issue in the SCIF driver and moves the hardware error-flag clearing
sequence to before the setup_irq() call so that stale error bits are
cleared unconditionally. Patches 2-4 apply the same early-return fix to
the pl011, cadence-uart, and exynos4210-uart drivers.

The pl011 and cadence-uart drivers additionally had a positive-condition
IRQ guard (if uart->irq > 0) that could fall through to the interrupt
unmask even when no valid IRQ was provided. Both are restructured to
use the early-return idiom.

Changes in v2:
- Extend fix to pl011, cadence-uart and exynos4210
- fix typo in patch 1 description

Oleksii Moisieiev (4):
  xen/drivers/char: fix SCIF IRQ registration failure propagation
  xen/drivers/char/pl011: fix IRQ registration failure propagation
  xen/drivers/char/cadence-uart: fix IRQ registration failure
    propagation
  xen/drivers/char: fix exynos4210 IRQ registration failure propagation

 xen/drivers/char/cadence-uart.c    | 17 +++++++++++------
 xen/drivers/char/exynos4210-uart.c |  4 ++++
 xen/drivers/char/pl011.c           | 17 +++++++++++------
 xen/drivers/char/scif-uart.c       | 16 ++++++++++++----
 4 files changed, 38 insertions(+), 16 deletions(-)

--=20
2.43.0

base-commit: 2ca756d39f59f834160263fd142ef91c6ca3dd90
branch: amoi_dfmea_scif=

