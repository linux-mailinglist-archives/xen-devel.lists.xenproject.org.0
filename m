Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ9CCKv4s2nUeQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:44:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C14282687
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253573.1549759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10wN-0006Tj-NO; Fri, 13 Mar 2026 11:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253573.1549759; Fri, 13 Mar 2026 11:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10wN-0006Rr-Jr; Fri, 13 Mar 2026 11:44:27 +0000
Received: by outflank-mailman (input) for mailman id 1253573;
 Fri, 13 Mar 2026 11:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q06f=BN=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w10wL-0005zu-OI
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 11:44:25 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb5d0844-1ed1-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 12:44:24 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU5PR03MB10219.eurprd03.prod.outlook.com (2603:10a6:10:51b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:44:18 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:44:18 +0000
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
X-Inumbo-ID: fb5d0844-1ed1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAxu/PAhwEzb+JP05VQXQ4Fia53vo+yOhdNsbUZqGcfmUXzFoRcODGKgiNczNQFv9Y7AeL2ubyjwiw8u2+QQqjmIUhW4PsBUFcXuEff3oJDnE6Eq+QAm3MECEB5cpafGMDYDFN08BcRkUK9ZcerS0wKTU5kocEuFFFp39Q+cfYeOkvPyRKYG5SJ9m+yth2fhA4YC5kMXzSC5jDzpzPTQ4x7Hw4ad/EwPI59xWvUKWLD60zfdwacXs7OpNSRptaxY6WdkbpIoJRPUY4Vw3RRr2sspc98qvse0mg9vCtI18uDpnM98Cr/QSRF4ZkIk8kgdW9DW8cXOMdM+xjyPVKz4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vshbixKweyTpuWP1WiS0HOtqU2yyfMLBFnxs6AU9Xi0=;
 b=k+RuaBpKs7Zks5F0VCQgM0zibZ6wUZh5tWhLMk5tC9YYfyP2c4Lqm0eh6/WtE2Hinlg8dcE7QuqfuAFLU56FvHTbwDKaMUa8u/wW/GCHZ2cUp91yjSTGEWE0P6p1Q0myMUOVE+mJFGKsC+XlhEcSBM13wOv97xh3qZXQnfxpS+sgzCQOKQUcLNviuAV/c1kV9KYh54FKYUtBo8hbj3/tZairyRVUoOBKfoA4JTSpnHAd4VLggui4q8PvtpXd+L5jOnpEWJqbAGDbTrFqW527kvN3JyT2GJt4EBPbuJ8V2ohdhpylbmQ1A3+jmVXKWHz0GzpkqPGaHW2H32hIBKcc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vshbixKweyTpuWP1WiS0HOtqU2yyfMLBFnxs6AU9Xi0=;
 b=Yxfa5nOuOOlZvadBuRfgHxSU3fR+m17m1QGeUL7LoQno9/d4XErFYolL4rkie0ceZ05ij52048TZGqsBtSJl8nDa9PBsNT3JhtB2kIp42IwOVyxEe+5QattTJE+p/Y7YH/kY+mgDcDvVscXW/ekSfnORDLBwUdmqh6j9opnHaf92Nv5FHbZ7+hM2YEHssaeKTS7O5cOyT2YdRx82mRKe2IvdYsF7ByTreEY1XWDEHOC9va6oqUyflUHFjn6rYuPIrLAVgVD7ovVSiL+Rhwt/PCRAX13yo3USNPFTqMnHq0AuHY0j7PENB7bYls7M6G8M19k3Z5BF87jzHyy+EaY0Yw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH 2/2] livepatch: address violations of MISRA C Rule 20.7
Thread-Topic: [PATCH 2/2] livepatch: address violations of MISRA C Rule 20.7
Thread-Index: AQHcst66E5OKF88ZqUOMQkXYvVhPMw==
Date: Fri, 13 Mar 2026 11:44:18 +0000
Message-ID:
 <a495a577f68e23dcbbc92cc4d0ace8b9fb46e711.1773399567.git.dmytro_prokopchuk1@epam.com>
References: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU5PR03MB10219:EE_
x-ms-office365-filtering-correlation-id: e3ff2352-74d5-48b6-b83d-08de80f5dc8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 m0YyqNAanap/PorJinnPSn9KuQlIRIphFEt6Ib6cYVDkZoHFsY3lyl+zpUoT5pY9e+TddfzIwzH6vPL0gqeumEyq9skmuxqlXSYBr1yprILG8x6JMvGlQgWBR3hzZBKtPud4CKxBkGQVhw6YSxT0yor6toTOhTPy6TeGfHAn85NdiB7vD/qDOxYDaTDoGl1z9hrkOj/3Hkcgt+OgbbWkGrF+qZud6TNAPKrf31ZodcRha/Gt3F0aDNV+jpcWxnhAfzhQwM51/Xw4QsjalEWGdgIv+bsn83oeJ+iEvC9tbny6+VKYVLPcmiMYcCbysEl21f4kdCZsUdGtIEZ43Ww34qOS06q7PB6saPQAUOqrVp11uq+DerjVEWb32G2AXEH9zvyr0eN20lfxOWF7fSmUXgMdo4zBPag5/ObYLkfSOAWSYT4jl0xPwV2um0G1EHPEppzDeypZaNAslBdPxqYnaS/el6PTW26jqDYt2kjHQ5u/4SteY7LOB5K0SUTIZLBAuJPx79a3fT9lh6uWxMlEGUHu0mgxsd2fWvsSB/Zlp86sSjcNjj98FuVG3qi1ixXxAG2TyY3hbNX32qyivdyUbaeAHCBRH3I1SyPgP05KzL8Sb50Vqa3d5o+CuN6hyWbpccpcLZbcyySZ9C0kNvzPIhVz/oYC+Y1QikPiAEmnV7POFthuVRTgVu9lkPhOvuI3cIFfM5vRifJ6QymtX7eZ6kV5G9o3AieYHyLp8uOaBL+vPNWEoQTw8E019RX7By+m3XXxGcUwymxxpP6psrejyPsJ65DOgLVb/2sDv5LZ7x4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pem9iAB0cjOQ0vWJgznuoB/Ef/ibHqyJRKKl90gmad4FLYTCMnqMAdr2XN?=
 =?iso-8859-1?Q?lwS8EbWqZPtT3oCD1fCCkaAedfGDBmUQiUHCaROjXvtWX5u6CFPUW/hNg6?=
 =?iso-8859-1?Q?9ZgM6wWFwRceAq8j5bdH77WBG1BzfW3EVJsBOJt+xtAzH6TmEFWeRbor1z?=
 =?iso-8859-1?Q?oMeFt57vAEX27tSk5TeQ8SeQZMJ1J4wuuC6qB9hVt2O9U9264AlbQBplXo?=
 =?iso-8859-1?Q?jbvJY4CdsSd7gfiDP/CB82gd2RRBH3cLnW30eJr0Zi9/3xk4lnwvxf8h3C?=
 =?iso-8859-1?Q?6ehMOZdgLM9FoVmdJ/MFaGlMeSnABaptfWZcQBDSTrAWxFMTRKwuDclbUm?=
 =?iso-8859-1?Q?2Dh7k3A+GKONviFMpLA3L92JTOMr2I16XV1lDAgVXH0/LAqRJqh2fS3wTP?=
 =?iso-8859-1?Q?RNB15X4eyDOYFJkPjCsQyQvoinb+2C7z8qAMa8Q8t6Z5IH+kzCwQnt6zFc?=
 =?iso-8859-1?Q?6zkZOTK9xg7tbD6fh8h2NkZypMEWxEuk0XzT1hnD92FqjkFiSeMuNcslJy?=
 =?iso-8859-1?Q?MO5tnFShQ+t7T3FT6Mju4YqNf8BVIw+eDZDgdi9B3MKTMU7ViouLUiTPb6?=
 =?iso-8859-1?Q?OlAZS6ptXTg2E7lZSxk7o8ed/Kkt97O9E21SLQErLN2wwTO518C/6Ju3a9?=
 =?iso-8859-1?Q?ehvgVOMZt1kEpu4cfHcRhYkzp/NfBsbw1TJ1vZkOOGnrHnveG35xuBSHSE?=
 =?iso-8859-1?Q?/0s9J5Vh8GXALk1hbmDDMzysp8I+AZzHJFWL1DMo9hrf9O4S6aIEOQdoLI?=
 =?iso-8859-1?Q?me2uf3Vqbje81ATuSQ/vfnGad+r+5f6oIm0Y8rfENOB6qb8N/w5Vg7TUxR?=
 =?iso-8859-1?Q?BX/eF4cG8MnTZygqoJ4XQIBI5QbR33k6m/7letmsX6R4+TexleiMZlfX9u?=
 =?iso-8859-1?Q?X6RAHgGe3iD6dfcBG3+rdvrAnwotAEdH+5tDlFfYZxXMiJe7mnt02hQW+a?=
 =?iso-8859-1?Q?UCB0SlMiYiBOhLURJvJ7kkSC6VotISooqR1novPouMaOqjYRZIA/c60fAa?=
 =?iso-8859-1?Q?e3fsNJv/USOOvK4aJzrXahF7b5hzcCYpWDIoLO5+0GO1VVAGN5cr+XKUOg?=
 =?iso-8859-1?Q?rC8bqFE5287KrFg6cit0sG0XEqqlcel8PP3RpCUn5+pmfx0wzd+Yg9yaPl?=
 =?iso-8859-1?Q?S5rCp1eHA966ciLAw4KoE6roz8009xd+T5EBXeA3w1a+h+1P0215LuiLso?=
 =?iso-8859-1?Q?tKEP26OKjaaXnOQC3Mc1oBjWLL1aG3DGE8UMiNNP+ciJ3b4B8a3R8jhwTz?=
 =?iso-8859-1?Q?c7RNAGKBQm6irb8E4TIxQ4y2jTsnNPOc2VIhtlupxLsyPTL1L5GgRZmaD8?=
 =?iso-8859-1?Q?oQrSJjKm4CrsEVzWN4LtjjOc0/ghjJraTbefLxWMO1BoK7yNVcdk5CyLO7?=
 =?iso-8859-1?Q?jjaql++JF4moALhb3R+kaEXaEBpWpUbHdlVIE+x+iFoM8FtvzpV4h4j4Va?=
 =?iso-8859-1?Q?+8oVN326piw9BnjZjfUT7pH84eick8bSk2WZwJUbuKp83CkRB1ndOYQX93?=
 =?iso-8859-1?Q?B/d+qWmaKGTIXSJUX+ZR4jv3btXlYRN0Lts4dXc+KXi+WjBWuSlOGpyfoX?=
 =?iso-8859-1?Q?uAzHZW4kCqSpqMOPbV/tMgRFO8euhzR2qweDM9qXHOhNhD5hPAWUKgXNMo?=
 =?iso-8859-1?Q?he6B647cPUsCOss3CaTsZzGNeRI7JDX92ApxzKW8Hwx4DJDa5fz5iHN5CR?=
 =?iso-8859-1?Q?ZozPn89zdJG2ubi7b4sRsXfqu+SzTPBLHqYQpQaFOSby3gHGkxWuWn/XSv?=
 =?iso-8859-1?Q?vAt5ZbvII2MA7nkexgDJDhb45OHV3Ax0gwBhBDXXx65jbO05ETmGVVi7kN?=
 =?iso-8859-1?Q?yGxrr474JZg1OQwftHyK+Iv1dibZK7E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ff2352-74d5-48b6-b83d-08de80f5dc8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 11:44:18.8159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+xOVGB1UVuycixMFBG5ulky8pxeWavKNASiBSLjJOrkPoftUvuVf8XB7s4SP2lFyUWmxkXN6HVakLclRm5OcjVGeuInSiKRajdVcaPB/Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10219
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A1C14282687
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses".

In macros LIVEPATCH_ASSIGN_SINGLE_HOOK() and LIVEPATCH_ASSIGN_MULTI_HOOK()
add parentheses around the macro's parameter 'hook' to prevent against
unintended expansions.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/livepatch.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7446533c8c..a9986c2aa8 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -660,13 +660,13 @@ static inline int livepatch_check_expectations(const =
struct payload *payload)
  * Perform section pointer and size validation: single hook sections must =
contain a
  * single pointer only.
  */
-#define LIVEPATCH_ASSIGN_SINGLE_HOOK(elf, hook, section_name) do {        =
                \
-    const struct livepatch_elf_sec *__sec =3D livepatch_elf_sec_by_name(el=
f, section_name); \
-    if ( !__sec )                                                         =
                \
-        break;                                                            =
                \
-    if ( !section_ok(elf, __sec, sizeof(*hook)) || __sec->sec->sh_size !=
=3D sizeof(*hook) ) \
-        return -EINVAL;                                                   =
                \
-    hook =3D __sec->addr;                                                 =
                  \
+#define LIVEPATCH_ASSIGN_SINGLE_HOOK(elf, hook, section_name) do {        =
                    \
+    const struct livepatch_elf_sec *__sec =3D livepatch_elf_sec_by_name(el=
f, section_name);     \
+    if ( !__sec )                                                         =
                    \
+        break;                                                            =
                    \
+    if ( !section_ok(elf, __sec, sizeof(*(hook))) || __sec->sec->sh_size !=
=3D sizeof(*(hook)) ) \
+        return -EINVAL;                                                   =
                    \
+    hook =3D __sec->addr;                                                 =
                      \
 } while (0)
=20
 /*
@@ -678,10 +678,10 @@ static inline int livepatch_check_expectations(const =
struct payload *payload)
     const struct livepatch_elf_sec *__sec =3D livepatch_elf_sec_by_name(el=
f, section_name); \
     if ( !__sec )                                                         =
                \
         break;                                                            =
                \
-    if ( !section_ok(elf, __sec, sizeof(*hook)) )                         =
                \
+    if ( !section_ok(elf, __sec, sizeof(*(hook))) )                       =
                \
         return -EINVAL;                                                   =
                \
     hook =3D __sec->addr;                                                 =
                  \
-    nhooks =3D __sec->sec->sh_size / sizeof(*hook);                       =
                  \
+    nhooks =3D __sec->sec->sh_size / sizeof(*(hook));                     =
                  \
 } while (0)
=20
 static int prepare_payload(struct payload *payload,
--=20
2.43.0

