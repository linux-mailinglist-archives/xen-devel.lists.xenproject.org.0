Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALYnLK34s2nWeQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:44:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8BB28268F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253572.1549751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10wM-0006Gn-Cg; Fri, 13 Mar 2026 11:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253572.1549751; Fri, 13 Mar 2026 11:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10wM-0006DC-86; Fri, 13 Mar 2026 11:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1253572;
 Fri, 13 Mar 2026 11:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q06f=BN=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w10wK-0005zu-OF
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 11:44:24 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb21e65d-1ed1-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 12:44:23 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU5PR03MB10219.eurprd03.prod.outlook.com (2603:10a6:10:51b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:44:17 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:44:15 +0000
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
X-Inumbo-ID: fb21e65d-1ed1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne+5rdChiqpoBE41dI6xMEUACodZ0jf9kMigVwMJISg40RT818AqFJkbuC1Nke99OGf+88hS/2DY9tg/nX87TAk1h4z1AeRllb3ZJj48MYH4YcoeJBJInaSqorVOLMNEuZpd1t/pNkSvIpgsB4IFQqJ3zMX1YvXwSOOr/Q2jQoctlbvEHnulJalnNlvXmi6fPgHUjgh327690Efld0ubnFtcq6kEXiJJvWAbuNontROOhiqVYV6uEQzy3ZsKgimE+6MgPfhqHHn+jIkPkhoo4p/uqB7cx44D1AW4puApmnejSEXepXBzbBb+aKgMFwMyZ2DC4LmqNlR8BcFdLDd+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImfwjO5yizsGwgyTir/GZv6N41PvSfvoDoYndUw3Pi8=;
 b=t5+PKFxABdcLP37OqQ7q5gzxC+tBGBTqFuh8LrCsCWQSA4xeLgqzLGp4Ul0xTt+HbLhEF7/OxY0M16pRUGLqfu4sV7jj54wbXwY4kti3WfosQeUaHoGoIQyvEN8oh9FzoT6gFPT18y7TihW/iCrZFQ1A8NwdqNqqOwMYiwQt2zVnoOZtbGOdGWjkOuPE3vt4h9aMTBCe4sIe/+s0hguZOSh9D6NH4hg/QsyjdgVS3XUBDMP/3eAjHgNKjaANFaWB5nCzndJH3aOQAkgukyOvT0l/Tm0SdzpnEV4v6rT+pZFNJW03xukkOcD6Vxk1X2eb1/vRPf01iCGjIW5XtmAxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImfwjO5yizsGwgyTir/GZv6N41PvSfvoDoYndUw3Pi8=;
 b=NEs/9J12UrYYgCZFSXLOTZz3/aWoyrcepHk49enN4qPKjJjfxGegRYdpiU2Z0PUbrMG0A0nc4oVZbjF3RoJsFtV0SGWoGlfY5OnK67/Gk/LmUU7b8WRrjL/kJNkpUZ7aimO4f0/gOV2j7/kttogUqrkFnHo3Cac2iXdSXswJciJ8z5dRGj1VCiFOTUqnhsM+5tAmQnh3UPCl1Wcvwa3dJ8lDAAWo9O/K3nOkL70BjJH/RH8UXppsAfYRwKVDw3bjCWu3L87FI4ereHzvN6EFznoQXj2OePtvXVL67io4XHC5TUwMcCPEJpWfaZwH35vsn7Yfl3d6VpfNO7QD7UeeRQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/2] Address violations of MISRA C Rule 20.7
Thread-Topic: [PATCH 0/2] Address violations of MISRA C Rule 20.7
Thread-Index: AQHcst645g7QlNxsOkmEje6S743Qyw==
Date: Fri, 13 Mar 2026 11:44:15 +0000
Message-ID: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU5PR03MB10219:EE_
x-ms-office365-filtering-correlation-id: 99ea81c6-7164-4a92-6e2c-08de80f5dab4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 6b8U4gVNHAXF72zhLZUa+IKvzxczJBdmN0X1vEWqNhl8nhOVW65Wdnqh6auxYehsmhmV8JP9YyhuVaZWvqmXl7+hYW5UvTIHh0ZsEXoeC3Pcx14VqRrq7qH07GA8Ji948muYUO98iL/XpyEaSwhTkkIJmq7mfeDdHwAbqlJUY+hBU/IUn3NsYJn8qPWzk093fqmo3TBouqTZBIywmrQ07v+ZLyGAYYOzc+c5wBO0s5RCTHYkm5ozOW5GhHAuGK/Mi/RXUO12OqNWEG9inEi4xePklDHeyYck2+JTxP/exsRVi2IvuroNH+QzyUIAsy1rzZeQHyg+uwY3FjrrU0aP+nlzj/n/FsG2aexuVH+1VshFeGTidpKBapqSaISfnfPvYSrH4AICZG9+0jL8M28xbUQsQfUEBZEKv+Zgyk4mFd0M9jtK3apzwYzC8O8hRltfPucg4T+k2PfGgrO/zKDYQ7bOnaSL4nN9HWA/xgZde5j0QajHSACQKJaF9OI41RCmPuyd8Y+PVQURL5ZF5WXD+JypMlzwap7zBJpuqKsjqUYwRNIe4S76OKIpOAcVCvcgG/xc6Ty8aVGkyhrR9iZwcvgwTMhUBdJCLtUZukKjBIsa00/+IqifjZxX6WBhHA2+B6IZ44kvSk5JLajoaby0RA60O5uWQtvT1E9pZEJn8X0Tezu6L6ocP8kKvAfPE6MOOUsncujVUpUqnl8X/AaRYRQGtHiYxjScoNUxJIIIYg/AfP6OQZ9W5Rgtp8OOygwBmmiVXpln2YFNUhydPnsJY/2UC8bf7J2FfOjlsfsVfFQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JhfTbasKz1Z2nYg3Y5KgvtJZPJEJzQJuxh2932neJ8V4usUtqQFTWJzad+?=
 =?iso-8859-1?Q?J/V5sS80/Z6Z3RtNZgtHO50+IQ2HMKqx174dPjxlW5C7iZR+f13Y5gEo1h?=
 =?iso-8859-1?Q?IuhmdasuWjrFAl3cUeaHx7DccvmzcqxbhvQOzuwVbkSexP/abwLbg9g6hd?=
 =?iso-8859-1?Q?K8Wqs1VMENgWu78EUoUqSL3Ko1diEYL8EDXUW5c4cVUHsBLU+l/7KDa8w6?=
 =?iso-8859-1?Q?ncPjDvcnd4AI5Zgb+f1hhEtV6rKWb+aBz199hmfJ63RWwQuABoM5ddntka?=
 =?iso-8859-1?Q?WwLn4ZAL49FHwDAm2kkn0RdBVMSXD+LQRiFzQZgpgNmdrP4IOGV3VhcQlQ?=
 =?iso-8859-1?Q?7vlLOeZtOxFe8Rf+1thDK7RE1y1KXWz/2IR++ZJpOx7Y/7Uq1+dqW1A7Wc?=
 =?iso-8859-1?Q?F7761CTVwLvqpol2vvxhM4Tt1giRr5H81gGe89Bnsw+b5OCPrljL8Qswkk?=
 =?iso-8859-1?Q?crkuMG8ak1/9VzNN0EExA+EJCj5ZK7uxVnQfzpVRu+qvHkNMqtcxbwEtjS?=
 =?iso-8859-1?Q?P/FIOvsf6TX6zVmc14wi9IzIoxLBGiW0Q+B0GySBWppaJGl2dOL/Usspn1?=
 =?iso-8859-1?Q?sdHr+yCnDaYHJDeDEyZRSQiH4xNG2RHTX6SbyQ7DelC6v2G75s8usGY5Eb?=
 =?iso-8859-1?Q?bvNxwSR410pnY9Y9SDOxlTQdnXht+gOQXJ9+MieI4eCJE5plcWRfk4bvLR?=
 =?iso-8859-1?Q?SDfZYqvw7/I8NDI1WnNzYF6AwR4DXT1DQRnD5eGa0LHfDlPDGsmmDWjDI6?=
 =?iso-8859-1?Q?fc36rW84XIyZ8Z7UbV4UkAzDVbgCLXQh0K9uGRrxyrY45RqahOtAc+CG8w?=
 =?iso-8859-1?Q?DzoQaDqLPqNraZtyuqh0FZw0WZE7Y0NCjr69LEsqDjZvzv6z4FVNBciqVS?=
 =?iso-8859-1?Q?B7NSBhRJEtDhO50hHZPD25O5oOflel0A5OEAbhESPsn2dpxxEbzUq9f+sn?=
 =?iso-8859-1?Q?OeK0z4gOBJRvL40CcGKLW5fjCaX9gc+taY9T0l2LG7BlaDB/rfcTezqJJA?=
 =?iso-8859-1?Q?5zVkCvXN8vMy8RgBJ8lqBkd9MCuBnt+9c0Hk9fHGiVSRPgp8rKixga84g9?=
 =?iso-8859-1?Q?Wk+sJFzdiEyHzcvsdQlFYBK3CqSt23ZN40h1XFZIAMq4TWljdJrJRCEcJ0?=
 =?iso-8859-1?Q?KBd01ZDmR2fcwhr3rzyf6qyAtgSSwD030KBtzUrKt81FLtkf3A4kk5I5ti?=
 =?iso-8859-1?Q?BmqborMZS4OBXWcwGV5w5Sqs3Im5PoOef6QscPqs7sFoY1oAnVG4ko+eeh?=
 =?iso-8859-1?Q?+Z5sz2P04AayqWPOJIxbUQShLDem0q2AkwSrf8kV6bnzymiYqqLxaaS0wk?=
 =?iso-8859-1?Q?qhsND+ZScL9qulSuXvoRuFjgO2kYEStzBVj2FyaMbGhASaOQu4i1Dccv+/?=
 =?iso-8859-1?Q?TI7RyCGTTWLGZhhGYUYDRcL6Y1ofpRbODlGQgBLjHnvXuYRlydbLVdFwwY?=
 =?iso-8859-1?Q?kW6unWS3Qvg33a/+rM4POb6+MEqJq4ATneSL0V1yviFa9TubhEkvSDVfNF?=
 =?iso-8859-1?Q?0z6P1OgIdVFk2nTMpcJ7NvC5LC1r6Yz/ssnQjGeCS43g5uPbjCTEWjpqiS?=
 =?iso-8859-1?Q?vvQNe3QW+S2gZ62yt9leWKpmek6MQDHSKr9Rb3SnKKfALVPPi47VPbi1IU?=
 =?iso-8859-1?Q?K/HIxJeZ4YwFPTQmtrpORl3NV8bjYh7DfhKJ8rW7gnKr+q2GurgOFnft5+?=
 =?iso-8859-1?Q?LgWZ/zTXpCMcAOPqTwORATjo1fwWgrIa5EJq0n0yGyDCaVMZSJ9RjOBT0r?=
 =?iso-8859-1?Q?/u2CQbrpAZW8H4bPpKnz/WpKbfp7zlAGV7jvQdYEgxrrGm734Q0sliLRBf?=
 =?iso-8859-1?Q?SMnzBzrlQQlZITRaN7V9AT3fFJU02jk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ea81c6-7164-4a92-6e2c-08de80f5dab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 11:44:15.7429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxzu0Hn1D/8dR7FyFt8mza05jzm4DPBqxc5jnXunSG3osGz+gZXIH7E/7xg/lZByUxr2hgxxUtb/1Mo1Y6mt4xpJrVWonINoYkYnJ7mQg9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10219
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4E8BB28268F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes some MISRA C Rule 20.7.

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2383264392

Dmytro Prokopchuk (2):
  arm/pci: address violations of MISRA C Rule 20.7
  livepatch: address violations of MISRA C Rule 20.7

 xen/arch/arm/pci/pci-access.c |  6 +++---
 xen/common/livepatch.c        | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

--=20
2.43.0

