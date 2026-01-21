Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ+uAIYecWmodQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5475B731
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210164.1521977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBa-0008C0-N6; Wed, 21 Jan 2026 18:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210164.1521977; Wed, 21 Jan 2026 18:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBa-00086a-Jd; Wed, 21 Jan 2026 18:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1210164;
 Wed, 21 Jan 2026 18:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4jW=72=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vidBZ-00083G-Ka
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 18:44:09 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b2c8f64-f6f9-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 19:44:08 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAVPR03MB8945.eurprd03.prod.outlook.com (2603:10a6:102:322::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:43:56 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:43:54 +0000
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
X-Inumbo-ID: 2b2c8f64-f6f9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XP6YubQ4FqRjxZJkDzUVdL9122ldrKbHl52xcVo33VsQuGQDnDBpcdqzs4343zUej1o63BGCnRBQe2TqvXGWlj8cZBA9JzFGRulNtlj0HAjO3oTdZ5+J2kB3SzRhlU1mAw6DLteG5u4QZ7GEMnQFAYg83HVS60/JUZFdEI90dGlYqCxYHz2rCKzMIp/vxk8WswNKWhQIqre/bT9A8Q/KEY4eey7O4yJk3LduHwgyJMCD4aGq1jTZ04mDgq+KqJvGRENDZCPqlRBLmhnJlAj6wDoJZRfhwpeQGDAYoFGgsIaAAH7asz+uXvM47xmF6zXSG++bGvIneQ2DLLmK7n3otw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nk1CN+j4B/Mq/rCvZP0747CGWDJEwdX0Pe1Pu44Qbs=;
 b=OpIwUcOpc5CUgcjQEtItC+HQdhoKMVDDvUQxnE2ocBsADYn3DCxuJpYbvoi73IimQcxjHiEVd58Ns54eo84cVSitchK1yNUVB7EHC6rKovWnW3GYLjhcsMaqnTbtoeh3xOce4XF3XNDV0emO+HtxNgzH1oeRb/jO241niGoBGleUEj6cPd3LcwVBOAqAGKK1Ohic5qa5+GLtufwOTQuQQ72oayIcmQ0lZAGk66nOWnveGHdEVi2ThKXkG1zvZ/Fa1swwNFUBlD5/00TGK/9eyCf6OD96cuTy4IqWn32DIPwK9/qKKSpXJbbSOp9jPAlIVEsrofG63NbQWtfk04qqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nk1CN+j4B/Mq/rCvZP0747CGWDJEwdX0Pe1Pu44Qbs=;
 b=uemVPyneA0ye0XhCsRn/KNp6Yeq5/rntat7Msjiv6tEvcLVj2IIE19u+c1MLbUS/OUNrXYByz4UBvfujvcJXCaHsRIz+tBejSgvCxGzx90CgdFaUeQqT0Ob+56+nLHDTsCVNCnwU4O36k/sFy+IhUBLkzAihB3CjvMZSuZ7awHZoNqaJwCYqH1+n5XZE0wg4D+/vMdWymKzZfAe6tjY1PhUGo20SjzjSF0HgjGrFvKVNYy4+sN9/iL8Banc9CAwDil+tInNO8ctAu4xoDTSE4/ZoCMoLy1nvFsHdKAwi/ohS8vO+S/367u+RhgOg1rzuPf4v6uKVNDTRqrNH/lOEQA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v8 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Index: AQHciwXkoCbVDuwd90KU3/bSFw0oPg==
Date: Wed, 21 Jan 2026 18:43:54 +0000
Message-ID:
 <8b964d9b6a50053d8a2e485a672b0fd3bc2e0c7c.1769020872.git.oleksii_moisieiev@epam.com>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769020872.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAVPR03MB8945:EE_
x-ms-office365-filtering-correlation-id: 2f37e1db-2e67-4122-d414-08de591d077a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c7cQ5AKRjUAWwniKXPiW4OcfEARbbNmeGrjoPPsGTlK6az7hpd0Ru03oRp?=
 =?iso-8859-1?Q?jovYpNJj2vipQuVOkvjW/Gnqhn7pjkMEw1SD/spWdoPM7fvuRf7vNQ9HdJ?=
 =?iso-8859-1?Q?BsObRd4hh9sikZBLvDEdcoycV0aM4kK/Ww6ojKki7Pf2O9MOXsP3xuOa5s?=
 =?iso-8859-1?Q?SgOBwCDrH9gWe4vxYub3TtNro3vgLn8GHQSIbDnkp+kRy+nYUqVIZL2o0i?=
 =?iso-8859-1?Q?deseXg1DmmH7dhKEfZnNGwV1rUHIeGyRu+Y5nW1ZUjlmb+GSOj8l8J7WbE?=
 =?iso-8859-1?Q?Dhr6uE/0G9FjsqdNFwVOGsugLmsaPvE+TEOs2dnFboH1rqY6maf1aGgxA0?=
 =?iso-8859-1?Q?gLyDkuftga4EgWnShgV84/sSPv5zJqV1JEUl1iKycG952sYzwjDkoHMkMO?=
 =?iso-8859-1?Q?eDhcgV7pcTs1NoFYb/kAD5Nq2g9/wlGFwxMJJj7ak85xlKgu+Z5oCIRcAU?=
 =?iso-8859-1?Q?s7l4SSa6R+OYGEUVT9bYtcRXRy/BMkcPyGyP7WJEttaITZmCVKGlmmrr19?=
 =?iso-8859-1?Q?OD1GtYNcdMUHv3FWIlT6UHX4ahsEjGnES30J+kWKKxkaU7dGM3DAkW705b?=
 =?iso-8859-1?Q?+7Zpzjyyp1f7O7Lme9tnL6YKkTRfVGkzOjsOIcbjrUR+n7tJmHTL4UQu6K?=
 =?iso-8859-1?Q?LJCOQNS1whWqoARfUKV62MNqd/8oH2ldCnFCJpcm/7B9Wr3pG5KMeneuyX?=
 =?iso-8859-1?Q?L93LzT1c6pDXe3cJmqilIMfd/eGX2qREaI2cn9IHqqll1hOXWcGCKV8jUY?=
 =?iso-8859-1?Q?hAznfyLYg/vnbvNnlpb1ux0osLz/RVZzoPWWkwl2TRsQIO3BjfPEqHvkTn?=
 =?iso-8859-1?Q?/SZjWQ9Aaqwd1ybrOAK0AlY+bqLp6ATqD/Vihr4QAw/6xT75eOSwqYfIGj?=
 =?iso-8859-1?Q?gnbmoZjdzvNwGiMMmh3s+LLWcbDCcqcGjJZ8RlKTdDJUD3FAZY91AUJQCY?=
 =?iso-8859-1?Q?yQfWCkTYR/9jZOdLdUgz32OYzinmJ2DxwkF/lctgn/hZwykT6ikiEkG8Wy?=
 =?iso-8859-1?Q?u8FUr8cpB8WzClO4uUAkMstLpatOWiE0ktmqawN/6gq3OwpAYjiZNFy7a0?=
 =?iso-8859-1?Q?+LPMCo10s5CzBsz5xQA11ICU2RquMq1cY3Y4fL8QSfQfrhr3Q1emDZf6v9?=
 =?iso-8859-1?Q?b1Pyc+wdZuJUQa8SS0r/Ia9N7H6gKFghBXizF1evQr5y+xdJB71f4JLOGV?=
 =?iso-8859-1?Q?bwc4iVSgTjywSdNx6HizLUAynwe2OZH4tuJIuFK0AtJHE+7qStLTFOfGpg?=
 =?iso-8859-1?Q?VEfeOwQtgJ4hGrovntnUEQhi6ofKgL2J+m55NJQFA6p4D2f3Xu73G5gLev?=
 =?iso-8859-1?Q?Oyc1ntEsOw6LEOsVDkr/bb91u4h9t1HP4DDOac6gM+YdKlyncr+hLXgJZx?=
 =?iso-8859-1?Q?ftobtC7m7euLuIGeJGVT09UXaQe7xTFHc6K6zh2AMj1maLEX9SXLCrhdMT?=
 =?iso-8859-1?Q?sAZFs/x+th8Avkf0EnAZJsfZdTME2W2W0nq+3vsCFBTgTJpU8NAEMEDOzz?=
 =?iso-8859-1?Q?qL57YyPchz2ro4aFhV382Zr8PSSTZ+Ozc9Y/1gkH43VZjozhcto6FZpiCK?=
 =?iso-8859-1?Q?5ATYYT1x089jK+u9NadOB8B4gjQwWO6Lag3lSQKoEHTP95uyA6KIe+9i92?=
 =?iso-8859-1?Q?oEzrTyIkSWHLQI/2r8mNVTmWltqoDsrre86rA0GPWCEzyzPT1uUDcUc2jm?=
 =?iso-8859-1?Q?1PwxWpC2pghBD5sg+jA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jvSNFgD2SIJBrpfxzFJWqwMgyw1UijiwNi3Ccwn+kOsnjf6MjndT8kbU1e?=
 =?iso-8859-1?Q?H72gPJZRADd+AtBQ0urDm/WpFtgDRcxx7fIrkryNTfLr4elfkfpBY0cyyB?=
 =?iso-8859-1?Q?KOH0//wjHnZ4N+bmvQIIkv0BlsIGytMystcNj7Pq0tlstmbbR0lomPiebR?=
 =?iso-8859-1?Q?PWqaFX1H5EMMGiYe3k9H0hRDqkEGhNEXD9e4QGd/TQCQ1fwbXxja87hAkh?=
 =?iso-8859-1?Q?ttX0zJtwnqahwRigBeRON8Hor2albtILmnOlUWs171PXdF5IkvUqwHWe65?=
 =?iso-8859-1?Q?XHEG6ttdXD0w2q3INdr2eqFzkkPvt82MQZyLLyWkiDDX/TaLGidMY8y5QW?=
 =?iso-8859-1?Q?2R3VYmuF4d90eqG74u+8yuajmnkKOJCMF9ioHGvL9VhXgJJt0zAQFfUOB3?=
 =?iso-8859-1?Q?w6d+ipQ8qzFSRq+fuBIRTUQWH6J20bU7uQyi0+mHTxhiW2eH8HB1vDJK1U?=
 =?iso-8859-1?Q?S9B0Z+AVJcr/qCtsGF9byQUby2+47dKpLx8g4GdxIajzMxdB6z2vV5p/tQ?=
 =?iso-8859-1?Q?zsnqXzH3zHHjJH3rjwNz7qAw62/11hIe3Qp3J0AbUNXwoMgmX2H5xpX2TG?=
 =?iso-8859-1?Q?N0THfplGruMLO5hwTl8DTV2OTIakEnxY32wk47uYFWCJxkqxuvbYgxqljM?=
 =?iso-8859-1?Q?YgS3mUEe5I7n8sggebNvkiXkPHrUvCQ36vxsAIYfgoC+2NbFtEONa7C9jf?=
 =?iso-8859-1?Q?bDTP5RjnXH13/Jaut2NrcZpJZKVyIS0eNbjAMynwj1fyqalZ7NadgceL0M?=
 =?iso-8859-1?Q?x/Ko4LRs1Dq43fxpoODmYU04yAIDHiI1ev+7lskc/X/oBBKoskyDfgSlu3?=
 =?iso-8859-1?Q?cYsenIEs4pCssWHCYaDdWgdKwtutIiq/qq1UrgVYQjy7CrNUNQFAOD2EDc?=
 =?iso-8859-1?Q?1uYDQD0kLh0TG9Dr0lnILCP98aXAcwZkzUM9ru065ZFyGt6Gcea8XwmSEq?=
 =?iso-8859-1?Q?JR2PWHvOTTsDyHWEvLiWNPTI879GygITFEvqIrml8iEEqJZpiqz4GF8Jkw?=
 =?iso-8859-1?Q?+5OEtDn8pHNSSAxlknL6lwiGkajKRE29XeGg0H2pX34tOmK3ZQtX8DUS5t?=
 =?iso-8859-1?Q?jw4HohM9yywfR8j28kEqhAeY+/XmQDWjHYDlZP8Oiu3NVeYe8Bhp8nP+df?=
 =?iso-8859-1?Q?kWRFuekyZpryecdDHGgulnPDoOwVIHxOIwJcK4VuW2QLSHvierr2nd8nOG?=
 =?iso-8859-1?Q?Kf0P1SMOKZ37A8nsynFaplT11g3Me7g5QhcFD2euBpgoQyhNVd9nLlIwWw?=
 =?iso-8859-1?Q?qGvYaRdkm4+R2GhS8E/LrTAscMBdUe/WqwxTzfNmNlKu0M69Y7XDWxyN+N?=
 =?iso-8859-1?Q?WPDBCP+2EASRdgTcEq6huwDjD1ilgYvW2Ru7MeExzuy8opqTxcuXb+oquo?=
 =?iso-8859-1?Q?3klIZWjfkiwSxOPkbfUNjD6rnKn5iqRArPUBwf7uKc3DvaSQEn3l0ZCGa8?=
 =?iso-8859-1?Q?pPdehUUlS3kg/omfEqB9kvOMyYtnpaW4x+HfGUfe8NGlr+aKiv3jZm5SVz?=
 =?iso-8859-1?Q?17O6GGKA0bVKdOf7Q4rtCy//2ZpO9HJRlUq8QEBA4/dQPJqk29aFj3MRO+?=
 =?iso-8859-1?Q?tXpBmpU9Qsoxufjsnv+vw/pNCpscvo7SAAHvQUSUZLZdl3xrOyNliXrQ1C?=
 =?iso-8859-1?Q?5sgi8BAJx8+x4s4MIJ1MAc/vlV81khLIDHZCsvt/Ao8wFYMbFlrvO1+cSZ?=
 =?iso-8859-1?Q?wQqZ8nzbgq4P9suKkks63T7FzRnThSUUq8wC2EJG5yVuwaPQmrj5iwmGiG?=
 =?iso-8859-1?Q?JCcGpn8YF7EImh/ROlmEiepQB+oqyZLTyfDXCQYURhoKcglYTjEMZRFCJQ?=
 =?iso-8859-1?Q?l3E1MD8m9QjLpHmAaWaaOEgtoD1WU5I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f37e1db-2e67-4122-d414-08de591d077a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 18:43:54.7007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKxNBv+04QIbHYHkFpG3lrHLdOD4wGOpPOshn/3Dd1lq9KFDry1QchT/HONLjr7Frls1jIy7emgMw4QO0SgUwTQaTQ92D/CudHFfUQfzRPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8945
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8F5475B731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index 441b3ab65d..478444fb09 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.34.1

