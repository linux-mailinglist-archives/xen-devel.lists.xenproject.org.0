Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHOIGqEJB2oLrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC154EDDF
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309894.1580945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr8D-00068L-Ah; Fri, 15 May 2026 11:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309894.1580945; Fri, 15 May 2026 11:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr8D-00062H-68; Fri, 15 May 2026 11:55:05 +0000
Received: by outflank-mailman (input) for mailman id 1309894;
 Fri, 15 May 2026 11:55:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr8A-0005iU-Sc
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:55:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr8A-00Abfr-7u
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:55:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070992-5cb7-0a2a0a5109dd-0a2a4506b864-10
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:55:02 +0200
Received: from [52.101.66.84]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070995-7371-0a2a45060019-34654254c125-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:55:02 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB10041.eurprd03.prod.outlook.com
 (2603:10a6:102:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:55:00 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:55:00 +0000
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
 b=Xvd5ox8lCacXHvewJSoAkqfJvd6/dfeGcZTsYeEhVszfS/xITvLsQdY/PbeKg1S+81la/W96Q+KVUcL7WiDStiiO4w566917/EhifZ596D5+FA3GQhj35SRCabofgl9XMag0Lt+tI0H3BxBjjGXR137JS8aMOyK9vLQqKX5Cb1SIhsk5Z0ZqXQe1riUix2RGSdxqU72n1FmIaJ500HQFnYNeNqkDcGRyDjB+uVY7AGqKuaKkxqKa4x/7qU2uXo2mtIVOq+sQrs/VfJcXOzRRuDi1VVnbpzI/4FHdPL+37YfvKAJDkYpLVmXA4OerL2SwXa/D6TW+fvVkx5IGfvzqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGvS3Z0LQ8kTmqlPZB0z2Geh8xllBaRZzc/PcFgMUJc=;
 b=Bhyil7I3BUXxvve3EkzPzWxfXrtSBX9ztHIpx+loUoGro8lIT2e0w6TA/tbzJumQMRWwNALPksJkXzOBdherIrrDyuOgCLZT232ihMLPVxDDKuIEaNLm/Z/hv6WlV5Wta9BmvxOL0LfzYfG/cEb+pUfmvNUYG3n9DOcwHI7DbhFT74bYhEITZ4wXwsAiS3HxjzhxqGlcV3rrOBSUisLsiPrRdDEAcQ4waogW9rpM+rqb6L5M0Gyq9TCNuqoYv8urYjd8oXQO8PSWAc48PsoBYIYaE9J/QJp7If0pMFY6WNZjwilk8TPDcVWlhXitHiQ9cRN3tdtR06Kv82NbdKMqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGvS3Z0LQ8kTmqlPZB0z2Geh8xllBaRZzc/PcFgMUJc=;
 b=lo6fnlPY5/8817h88VZIgEVD6TaiOgCrV+UPog2Zz2KEUsKmuMli9RUkTdyKVTcGSRRUfsPnEK3/P8x4YmtVF/pxdQ6oxYwHZ/GqnVSEpegBiU6eTd+iJYxkMXy0TOfEyJZZq9wp9nIRCC8/+5tsBIsNA1biv1kkpop8jA1TnTXEj69YaMx1N2T1Hs9XcE9aj4AXxw2de+iyEURBRp1U0r8D6JH8/4BaaHCwqVdjOep/sUXbZGuFYOOVM2vzEzjP9nB9VZmnp1pjzTG+vTACnytftkWP0eEChFxy80il8TUyB05Lpqi6Jr4l7nltgG69ViXKvTW7dInpIfEEB674yg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v8 6/6] docs: Document CPU hotplug
Thread-Index: AQHc5GGoBdOGHWvGVUGtOnMe3K2aGw==
Date: Fri, 15 May 2026 11:55:00 +0000
Message-ID:
 <e6e99b166f17a463f0e0fe46c2a0dfa37af3bf06.1778845596.git.mykyta_poturai@epam.com>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1778845596.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB10041:EE_
x-ms-office365-filtering-correlation-id: 879b4254-ce83-4198-b073-08deb278cad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|11063799003|22082099003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 4+OiTyNXc2VaawV7LA0U9P8tToYSvZ6JyXo28gMA58KlW+QHmJkvaL2Gs9uVT8/YHjmuinskbLxIcED6yKz047vSQYlWl7Ut95xvMFvUG+m6PiZ7Vi6QtQVJV+Y0XU7+056tr/9tWqm4Jfj/FDJBxNAMeEqXMYS4Q6c8b+iaO0WbCJgp/O8QsafB484q9nM8p05wtROkd5TJY/EnKIpvpjztvBoxuVUKqxmvjUlBbmiETSele34vRteGYirCDIk9kb+3G32HSmsKDReL2nAiHANa+Nw7fo7v3NO5GRikI8VW2DYsZTLxAbk1uIxGTlS49mfQVjInxDjF/2+mCaU+iwkLkdR2E+5mrYfdEJzc7n+G/S1IhUHOQ34LKrlyX/GxUF6+y8kH33royP1OsFy+67l+EhqI0JLmdZqTNh7uC4HDTEQrLNJ0/vcjBJWkSooN3SHyykLLmzGuVv7buPOWgw+q/uJWGvAZ+Ek60HvlytTxmt8gB0hbaE9vqtDHIN2i+bR5lubQa9s/5Jd6tKUJDOt2hh17TNmT15D7LwPQidaYJzT1c8IQCOEPAw5n/GD1XlalDCLazZ/9yGP0GNl6KdU9uQCdQRrufH5UwRRkATFH8J0Wl6kAhU/U0/7DY9bGO7CUDgCWI5zXLXOFcODEm6Lo2GkoeGN8J0exwhZxa1fNk/LJsxtHign89YcteMzqY+dJ3H8r65FujAp07eXkYeMNuYTP0kvF7HlOXNGbSbztyCnCiSY/JiOzuYIwXwCc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(22082099003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/E76yz3O02+JEVmc4dz7WOdng03Rd+6Mkt63L0nSES7R5psYbX2TVX/HU7?=
 =?iso-8859-1?Q?wZLcbmk6vXI1igiGl9iN803ErJKilQlS+fcHzvzRw4MZXS8fnpKk3P4JSP?=
 =?iso-8859-1?Q?NxoeXalGpuiMzBdc224SI0wTj6On7PO10j6ahCoJ/9pVKch7HVhsvEAMH+?=
 =?iso-8859-1?Q?usywcBDjrYyJy+80SyeuzP2k+wBvIPtLRw+QJB89MZVaQIgTnY7ExUrMec?=
 =?iso-8859-1?Q?mou9Vkbjw0mZo4dAue0xFqOvfT7wF7V84WKu+8ybl0zlslZtO6LXEBdGUx?=
 =?iso-8859-1?Q?qIjn7kB+JJJHINC/iMeYr4IZacGjHHF+Lc4mKuBec9cqprsqXIgKwkmG07?=
 =?iso-8859-1?Q?JfAjPExuosafGWqKgLdj040nA8a3Y7N6hkRWIDGUK0MyD5MmkUrSESSQo7?=
 =?iso-8859-1?Q?jMOLpKjU4+Bbv5V2gcY420xsrNEM/fropg/OEvCFGKahvYrVLYfCBAiVRc?=
 =?iso-8859-1?Q?sHp1Iv8ZLLWTBudIKxQ1XpMRjERhpeEyX1rYudWJrUCnYwUT2hNLNzKmFP?=
 =?iso-8859-1?Q?+K2zGb4U3ZysFOEeBvj1YyaS8rNsQVD756HNRk6FXE/yRRuLF0i+CR6Hl+?=
 =?iso-8859-1?Q?n1MxMjc1RjnAG82RCQLRlZfa5/rTkCc4+hHA60ps1Pbq6fAvtJ1y37+sAd?=
 =?iso-8859-1?Q?HEgPS/NHlkxhTFlO4bTCammvWs7u2tmdnq8MsODjp1uift3EpaeG/aZlsp?=
 =?iso-8859-1?Q?e+rumSIdIGzQE+zETEgsipWm9/pIaGV1BHymLubX6gU3rHNGKTjHxX4KZE?=
 =?iso-8859-1?Q?b9bc4mpt9C++pxDy9/GdtFwiWSAdEJvBT2EalraMTInmDX4s62lqXT3RWs?=
 =?iso-8859-1?Q?K5UlBVeO1cacC4XBVcR/HgLDjGXUeqre/cPekpgduFyGK2PBhjMfe73qRW?=
 =?iso-8859-1?Q?V/Cx2yviCs1w87s2e9Tv4k3Ln/MNmuJ3LAZwwwNDol9rtuSbiZG+B2ztpk?=
 =?iso-8859-1?Q?snyAnGgvS22vsheUzQSJ56yi7q1rbo8V+8IiUW0KnZ9xUd8WkV3Ow6yLiv?=
 =?iso-8859-1?Q?ynlZa/Pf0Dl51YmQxbzwI9UxwbsG+SsZBfW30j8OjDeDBR0/1J1hQDOlju?=
 =?iso-8859-1?Q?3dfc7dGSwpLsNuSqmqoLYINDh4lNnackM4lK+Mm0n4lVo43rukd3nzaYcR?=
 =?iso-8859-1?Q?nfgOhM+xXKZ9EbqQYF4BO/n2vcaup8OEr2oAR/0IL0wFFBrKEB7NbkpB+5?=
 =?iso-8859-1?Q?IHRqKXHx/sy01BriQfRC2ryagPy/yZCB7MVgafQfF/+ygPe/pv2Q74myAl?=
 =?iso-8859-1?Q?TSRasmWFg0Opt6OyWz38WWahXrQqe9qqATXmZa3qRvQDUSFAiDMMtIBOEd?=
 =?iso-8859-1?Q?PbKIF0S8gVhINCPRVXc6w1Tsleydkl2huPdJmK/F9uJQOrcHUUT/1zoL3d?=
 =?iso-8859-1?Q?mz0oh/KXn3XQ78U5h/VAdZeDK6fq8xvm9ra94dbB0jNHgRUu+spEBuU3Ot?=
 =?iso-8859-1?Q?2OrDB9cLbclz7aw1CeNMqQ8A0/f0kl9UH29eGHEIz9jTPBhPL5OCp9AA94?=
 =?iso-8859-1?Q?XC5gboeGpTo6nbBqJF51OpNIIgETfxQpcU9Hy22OF2/nhW+unAuNeHKA8w?=
 =?iso-8859-1?Q?68U59lk3yfwN/6BqyrYojNq30cR7BAadmywvKseJ52SPDLDSTMoWF9R7w2?=
 =?iso-8859-1?Q?rPHSzwcTb/5oqvcLbVmCJp0tqKjkKJE6kjv+YakxHu+EQ0N2q8th2eekng?=
 =?iso-8859-1?Q?XovAMO5Wl8qr+DL3lE/alT4+7IPGslDdJVTrtN6KEU2PkOf4G6qd90gi7X?=
 =?iso-8859-1?Q?wXKdplEjGOJp2VzTC0/DVyibCzn6VH8rLIevZChV2i5beZmGh3GlKy1eUd?=
 =?iso-8859-1?Q?UqgLvJjWWu+8+kRExG/jfMGIpqxVfHY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879b4254-ce83-4198-b073-08deb278cad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:55:00.1201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I24eQVDuQILocZ5jvkxOiD8pQHl/xdbrOURYhqJY/woe5SNjXBjyVDrbjNn0RI3IFJqxJUVG8OM6K0ApyVwASQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10041
X-purgate-ID: tlsNG-16d1c6/1778846102-8E98AD75-2C7EFC66/0/0
X-purgate-type: clean
X-purgate-size: 4040
X-Rspamd-Queue-Id: D4FC154EDDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v7->v8:
* remove support status update
* update config option name

v6->v7:
* add testing and limitations

v5->v6:
* no changes

v4->v5:
* s/supported/implemented/
* update SUPPORT.md

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 docs/misc/cpu-hotplug.txt | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..d2ed1d6b8b
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,97 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is implemented on x86 and Ar=
m64
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for the boot =
core.
+Sysctl calls are routed to the boot core before doing any actual up/down
+operations on other cores.
+
+If there are Xen-bound interrupts pinned to the pCPU being offlined, they =
will
+be automatically migrated to other online pCPUs. Interrupts used by guest
+domains are handled by the scheduler when it reschedules the vCPUs to a ne=
w,
+online, pCPU. When a pCPU is being onlined, some Xen-bound interrupts will=
 get
+redistributed to the newly onlined pCPU to prevent imbalance.
+
+If pCPU being offlined has some vCPUs pinned to it, they will be automatic=
ally
+unpinned and migrated to other online pCPUs.
+
+Limitations
+-----------
+
+On Arm64 cpu hotplug is currently not compatible with ITS, due to an issue=
s with
+the redistributor assignment.
+
+On Arm64 there can be problems with FFA if secure FW support notification =
ABI.
+
+Configuration
+-------------
+
+The presence of the feature is controlled by CONFIG_CPU_ONLINE_OFFLINE opt=
ion.
+It is enabled by default on x86 architecture. On Arm64, the option is disa=
bled
+by default and marked as EXPERT. xen-hptool userspace tool is built
+unconditionally.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
+
+Disabling a core with pinned vCPUs:
+
+$ xl vcpu-pin 0 3 3 3
+$ xl vcpu-pin 0 2 3 3
+$ xl vcpu-pin 0 1 3 3
+$ xl vcpu-pin 0 0 3 3
+$ xen-hptool cpu-offline 3
+Prepare to offline CPU 3
+(XEN) Breaking affinity for d0v0
+(XEN) Breaking affinity for d0v1
+(XEN) Breaking affinity for d0v2
+(XEN) Breaking affinity for d0v3
+(XEN) Removing cpu 3 from runqueue 0
+CPU 3 offlined successfully
+
+Testing
+-------
+
+The CPU hotplug feature has been tested on both x86 and Arm64 QEMU setups =
and on
+R-Car Gen5 (Arm64) hardware.
+
+The tests included:
+- Offlining and onlining cores with no pinned vCPUs
+- Offlining cores with pinned vCPUs
+- Offlining cores with Xen-bound interrupts
+- Offlining all cores except the boot core
+- Offlining the boot core (expected to fail)
+- Enabling and disabling SMT threads (x86 only)
+- Ofllining cores to which guests with passthrough devices are pinned
--=20
2.51.2

