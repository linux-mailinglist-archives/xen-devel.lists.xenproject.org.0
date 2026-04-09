Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCK/Ms+u12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112A3CB923
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277415.1562629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmC-0000Tl-Bl; Thu, 09 Apr 2026 13:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277415.1562629; Thu, 09 Apr 2026 13:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmC-0000OZ-5v; Thu, 09 Apr 2026 13:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1277415;
 Thu, 09 Apr 2026 13:50:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wApmA-00007a-3f
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:50:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApm9-005hHg-C5
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:50:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7ae9a-bab6-0a2a0a5309dd-0a2a4508a406-30
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:29 +0200
Received: from [52.101.65.135]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7aea3-fab6-0a2a45080019-34654187b92d-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:29 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM0PR03MB6132.eurprd03.prod.outlook.com (2603:10a6:20b:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 13:50:27 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 13:50:27 +0000
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
 b=POqCbvsD7rN2iqWa1gkkj+Ssb5ui9sePq+w3pWZl+dPUU9fUOhRNbYaOOE9G+O8DxZ83JTb/hdXQ64UsLsLJrRYTdhdAatA99ylyhUMf6hHlRpXcHS+EhI2WA/eiDCMxnr+m2HYouAWS2VuI/CPh9qL+/SvL7QwvPtE/1y90cJ3baHcgqjYVTft8dKyYusodB0z1ohXZ2SimQl3Sq6COwUt3qT6/2nXPiEXlBc4+DrC3ktPU97/ifwXVmQLEO+jVwDTHWndo8TbaGmGEPzwgMYC93Lf2YIXRl+zZjytaRUJCnmVhG+oSfnJqitcRnZQ1OnhDM3ZZFiGELqte5ym00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwhynW7zmXJxd8AYQ96d1CxfvYTLwAQ0yYVPWGCG7bc=;
 b=btqjX/tAeHyLq2ihsE63HkZlTWrw46lh7u3dg61anVXZIxd3a408JOVAELDG3nKDVC7sBSJWoG38hVygea9yPbRWel5g+kghKHvP5PNbVvxCc2e53zQtyOhSXwkeQ0FB2rPJB9BRcjqpTLh+zkoh+MaFAdhh6w25l9S6HhQaa1lxbf0AytARln2S821jUkOHTyd6OdyCXGb8E1yEBhY/9vN4yNXQxrbQ5ElXUqS3cVe6MYhTCWh0Ut3T87Biw5vPpZPL2G+MDzI7QMfCUuPVmgyim5gGXVzw5hGvxXkqSDWK6ZNuJ4cAhWSB18rdhXHYLQ66++UAgHPRBh0GRs6j8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwhynW7zmXJxd8AYQ96d1CxfvYTLwAQ0yYVPWGCG7bc=;
 b=iXzjGYRAgC4/jdGGy3K8GZtDYrkbqOoATlI30ty119ip8xCk28RlhYWrPfxlcG/vqFxHMri7rO0g+XN/+G8+xWscb7AJ/p97dj3ugXBkMS/Csg5VMlodPEndu7Sm4Wjhmi3dc6wbKGNZ4I4HN1cb9YflZ7tW6Ck/Yk5devRwpQtfOCAnQy7eI7ZcQmja9gvvnY4xBivzSf+ggIhUwrlV1p7JR8o2aZslbxnU/Yn03PAUnCGEHM3XLMwYCPrp4fMIHcvup+lMg5Jmbb5t1tMMtpGSl3rBGPTr6Exs2Tyf0RF0VS+v7Mi0z0t3Wu8iOyRRTP/H+sUvi7+jENRwiKBcmA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2 3/4] xen/drivers/char/cadence-uart: fix IRQ registration
 failure propagation
Thread-Topic: [PATCH v2 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
Thread-Index: AQHcyCfShWUf7VBEr0ifQc+UCSxOog==
Date: Thu, 9 Apr 2026 13:50:26 +0000
Message-ID:
 <f8ad018f3cd8930f7efddb362b889f0afec2408a.1775742562.git.oleksii_moisieiev@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775742562.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM0PR03MB6132:EE_
x-ms-office365-filtering-correlation-id: f551e331-802a-4b8e-4425-08de963ef4a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 WjANiVgJUe2pIJsnNLs//I8+dSW3QElPBXJbAM0Rqc9DcMRLOMotP76XDvYKJ8IPtNcIYfwyAiV+MKNbkUiW0ODDAVAX6kKAnDmxoesQ/6JSS1sfKPpPjuyveuWw7khZY5j0JEBe1TZGlVFbaxIbAgqjbzh31iIktsFVGJZLhS37mtGouzHlW1G3uV1j62+fgnTkHD5xuv81sSyY8kVlbZKHWz7VLJmbLHUHD7exO1m5+T76oiHoUajEvsdanlBCsVuNAesHMyj19xZHY8OMVGFPpkQ+H1HU2fsBAI0I/f2VFyNTQ4u2dp8zrreKR01XAKgzUmeoT3fYIAWi1q8FLfyMEunG7/f1F0buOVZQCRUzl7r07EcOgCr3TJdbmCMRkgdAjOysnQ4kJXlOtAfWKaGr7gTBiDf8v8IjrW2sxBwXjmuzsOYa7bvfHGNBOk4NQ6fLxLsz2mUQ5Fa0rGyCODVPTup5/SzaA5kIfQwxjPViLsR8lIFCt35ly2USCG/eQ7nl/vQUPCqdA3YS7HCQ/oQZf27NXKa2h4YUYIdJHs+wzSn6omCKfe9pVrBIju9+J+4xFup8XHEYSXpTXk/bgOy9J1r+wGLobGGe5wP/lXvfAyP4Yc/QGnypuslJEfsfx52ZyQGvRpSEVXsgK9YFNsI6z8rDd7IXCxT315Px5Kexv2bDiTgbgGWnyg7prKmBDM78KFSUmhCnCxa1SM1kCTR0Sv5wxc5PcEU6DgbiPCWu67AtQMjgY/is8gi49gx3f3p4NBZ7ERQpu/2zBodx6kHfQb1UeltHV9n5bLqidZM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZR9iMLPrxFXbD11Yg4alYgOYIaNr3G5e1vjiPtzI10pQh5mgDPauGqYZem?=
 =?iso-8859-1?Q?MsiYq1Qbp9BWtBDAYeye0JvRYEgQtOLzuo+M5HNXY1noqwq3uyMDEuUT0/?=
 =?iso-8859-1?Q?LX8yg1ybOfNFWjg3PWsn+hn+n6tfBLTsyBVj4/EW4rLEYWnRzHuXYkE6fa?=
 =?iso-8859-1?Q?wrraBUJLVE5MqAHv4s0z8VdcTjo6rFGFj9cQKqF3A2ahRvw5sXzuCDZ+E+?=
 =?iso-8859-1?Q?KbMEZXob4etBRhJ1PeEQJKHniH6V4kpSDYsDVT39x6iSdlNlI5LoizqwhX?=
 =?iso-8859-1?Q?+p5TzZkKMOiLxi5qyFNETytAcvYDVimqoinxtUEDcj9zohmrVzLtBbOLYp?=
 =?iso-8859-1?Q?4inX7hYsAqun+xGd04dh15B1E6/xEsQZEB10hYCluy209LtofHq68uypde?=
 =?iso-8859-1?Q?wqvJf78F/0l8MGwZYa9ziCeALhdA8OmnzYI+qRaXgd/YeiX7sOA9BTrF38?=
 =?iso-8859-1?Q?Xq/fG1X8gfdARnCEWYvgLp43kU82FBYenqCC0ZADX7vS6BTtSyT+lCBLOh?=
 =?iso-8859-1?Q?3R/CWo5nz/ZU3EHL///aq0fFhaQdChqEIkQwV8i3W+b3NgwrwWWnihr1J9?=
 =?iso-8859-1?Q?x0mf3A8+N3M0bABOI/FRfP8Pr65ipRR/C57UAkGUNgNWvbzURPwtHutK+d?=
 =?iso-8859-1?Q?Az3FLYxnzK5rDlHlS/K3AwysxY4w9XZobWcAfR4sc2DY18oi4HBAaiCviz?=
 =?iso-8859-1?Q?KldoB1upt9AgR6TqKb+OLo7jFTms3SBL9A0TRZPIYu8eXjHed4ajaKq7LI?=
 =?iso-8859-1?Q?JFV10mVhzZswCRaExaXvAnSY7UBd/LevDNeKpRk0gLs5tz4ZwMJJjGoWTW?=
 =?iso-8859-1?Q?yH6fTJat3J7A07h8feJPAF63HP73pJhI9nVACAwCSTyZzv8Sudo46kZ3DX?=
 =?iso-8859-1?Q?hk2NAhT9RY5vpwZv+Md59ESuMRAv0T9tI03UTIPlirJiCooKQvRGOOwf4q?=
 =?iso-8859-1?Q?oKgxjpBtD0+4x4xa9iTpKxgbUFBV1cmXZYoSH9G4VX30ihjhaRubD8FyC3?=
 =?iso-8859-1?Q?unQwzajaVkmaO70gl7pBERM8oC6ojDKsPR2mxQ4KSv+0CDuTV4yPu65l9A?=
 =?iso-8859-1?Q?lMnBYTJCWgmJqlrU5P/zEV7Af7cLcHtYAGzyHaG9fglkBELiz0HZ/JWvQB?=
 =?iso-8859-1?Q?mrHHRWcdzv1sJln7HR6+M3ZAcjfaGOLkaG7XYq43nDfSgMipsKavkeu6H2?=
 =?iso-8859-1?Q?h7pg/7qfNgohnWnL+E7RtCcXjChqf5Iebs34Cb/2Gc0/41Uf7X+6dfqzBk?=
 =?iso-8859-1?Q?HpLdlqRt0sx2Q+Huedij78V8By4ta0m8L6cY+FrNGU5KcWzgv0ksZJz+Ko?=
 =?iso-8859-1?Q?E0w3f8aULzuFnZ2bDrYpzNUHYaya9/42v8GZn7v3ixVgkZ8F/PNj86UxNP?=
 =?iso-8859-1?Q?JVVeA87cWbr9JecktqjkPnbyRnq11wyadTFuFKFIlGWCJYeVee091dLDD1?=
 =?iso-8859-1?Q?JdM/s0/Cu0GhJnTrRAGTznA34sMkesxHRGBUqHtkkpBOB6tJ12UiXxKJ36?=
 =?iso-8859-1?Q?G6hTPPDE0K22XHftqgPC+ATgMW3nD1F6eJKXDDRBx4mfVvK4C1KWEM8TgM?=
 =?iso-8859-1?Q?sch/7FmbZkL6z/K88a8/fg/nylg3/L5jhRBOL4TtZ3FtixZnVPul9l7Bpl?=
 =?iso-8859-1?Q?w4OH4XM64vvq72eNiRWRZbANTC7s/3wYpyXHzCtfqlww9mncc2ROExjBp2?=
 =?iso-8859-1?Q?qznvA2RI3zFcdFuzyiXPH2eJxM3XUDi1MlhDoW+H78q37tpyx28jjKstsO?=
 =?iso-8859-1?Q?N/NusGZqajhE2CaaWDeZhUT8vRbg9Oixxbkr8zJmvWR7oXRTudIhEzelYp?=
 =?iso-8859-1?Q?sHB0ZIoalI+IhnevS15ZGIjRGnPW554=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f551e331-802a-4b8e-4425-08de963ef4a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:50:26.9497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwtj2AKzoHIeHY2WJbd197sf1xEFRTqCvUTeRI4LBag/9Ab//IKD6raq3Y9D9+7OU6fJFbVvQWNbxP+C6+CXAGOYIxCcCwuCyuKxfjVkw0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6132
X-purgate-ID: tlsNG-c1860d/1775742629-F674E497-EB7A424C/0/0
X-purgate-type: clean
X-purgate-size: 2266
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 8112A3CB923
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In cuart_init_postirq(), two code paths could reach the
interrupt-enable write to IER without a handler being registered:

- When no valid IRQ number was provided (uart->irq <=3D 0), the original
  positive-condition guard (if uart->irq > 0) skipped the irqaction
  setup but still fell through to the IER write, enabling the receive
  data interrupt with no handler installed.

- When setup_irq() returned an error, only an error message was
  printed and execution continued to the IER write, arming the
  receive hardware interrupt line with no handler to service it. On
  platforms where the GIC receives this asserted line, the result is
  either repeated spurious-interrupt warnings or an unhandled
  interrupt fault.

Restructure cuart_init_postirq() to use early returns in both error
paths.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/drivers/char/cadence-uart.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uar=
t.c
index b2f379833f..a63dc4adb2 100644
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -72,13 +72,18 @@ static void __init cuart_init_postirq(struct serial_por=
t *port)
     struct cuart *uart =3D port->uart;
     int rc;
=20
-    if ( uart->irq > 0 )
+    /* Don't unmask interrupts if no valid irq was provided */
+    if ( uart->irq <=3D 0 )
+        return;
+
+    uart->irqaction.handler =3D cuart_interrupt;
+    uart->irqaction.name    =3D "cadence-uart";
+    uart->irqaction.dev_id  =3D port;
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
     {
-        uart->irqaction.handler =3D cuart_interrupt;
-        uart->irqaction.name    =3D "cadence-uart";
-        uart->irqaction.dev_id  =3D port;
-        if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-            printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart=
->irq);
+        printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart->ir=
q);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
     }
=20
     /* Clear pending error interrupts */
--=20
2.43.0

