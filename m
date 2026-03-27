Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH7+NZGgxmnrMQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:21:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D771346A2E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265881.1556627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w690H-0005VZ-Ps; Fri, 27 Mar 2026 15:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265881.1556627; Fri, 27 Mar 2026 15:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w690H-0005TN-N6; Fri, 27 Mar 2026 15:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1265881;
 Fri, 27 Mar 2026 15:21:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w690G-0005T4-01
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 15:21:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w690F-0039gU-CH
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:21:39 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c6a069-e002-0a2a0a5209dd-0a2a4501dd6e-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:21:39 +0100
Received: from [52.101.65.85]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c6a082-6400-0a2a45010019-34654155f43e-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:21:39 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PR3PR03MB6427.eurprd03.prod.outlook.com (2603:10a6:102:7b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 15:21:36 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 15:21:35 +0000
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
 b=NE1eQFw55jKkG87us87IDHz1M1UqYHX2cpvpK2qX6jyFmb5buV4nivNpEXyXk0PyEY9s+5S9xfokeqov6j1EWsGinnVbfraWm1P3c5E4Wb/+103/vAQMLxwlXEDUFhtEnRGQYfYkP6M9EAG3Skbb+ayKr6FdjL/tv8QewGPmZIqDE2KoTHBir+xCWmpYla2n3flYxInoKP8+7C6vHhOyqtUAs8vb9Vxz6Zwtw/2HCMRp9PE+QYzXg3LjJuyzwOZbU74gjVoQMCIxFQ97qgcdgL1U09MKkJF/Tc1gYMtAe9hBdrx6w0jiIuNOLcrF/JOc6KjLcjZ4VG5BVuGyt/pIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR8mJcOvh/N050TtHYXW65ot9TYuYnMtLA21dZ2q1QY=;
 b=MT4tfqs7Hb+GoApZCUWQd5poX8b9/tn/E8VWsYOnx21RXh/ujysmppn+xAEoPnzfZDfAycAvqvmS00Aug+KiZXEsx1tjJBymxz2DIgPBdbgqKmbg35sY/o2jHLi5TrYC9IpJqGrWtI4x1nuKQ+8Todt0BS1xbJhYh530PKY0evXzKi+yrj/5q6vtk4RBc1mkfABciTq9ZQ8MqM8eMhRYTYlXzq1/1AseOM2O6A08ssb9E4LBF216pCD9PbJzzhhqYEMUAbJ1H1Gx0OKp/RXcHFSfF6MDlcYuLY9Yp7x0Y6GlE7PhnYJgJFmjG1P7q5FZUE0JTC77TVir0lJ8ekd6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR8mJcOvh/N050TtHYXW65ot9TYuYnMtLA21dZ2q1QY=;
 b=GAOCfCodUJbZaeR0aH/r8qod/pSphmIOXkpO/N9DAI/1mT0gx+9VjW9UrNsOx6UxMOPlUoc4N/3IsMqykQ+xrSXzxOckwzZUrItq2bPPkXvzCo8uqfsAaS080umnELJrfDMxymEpe4yRASLpzxP39UXN/yPR6Hd8gl1QqPnJuSNjofk3tIb27JVUBE69+re25NzdbTUv/BpYXBjpUzfri+qh1/4Vp23TyqGxsQt6Ie2LpXqI1LI0tE3nae6PEVNkdznkNCpQD9jMEJw0vE7wemaqH43Ed5s5p2jF1EzHTTXQv8khoMNaJl9aaxulIhMHfjXv0Q28ndgVMOY/JU0A+w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v4] xen/sched: validate RTDS putinfo period and budget
Thread-Topic: [PATCH v4] xen/sched: validate RTDS putinfo period and budget
Thread-Index: AQHcvf1m+kNbfbdjU0G8nxFPhowXWg==
Date: Fri, 27 Mar 2026 15:21:35 +0000
Message-ID:
 <1bd06f2d7ba922f519141561979160747cf0c28a.1774624811.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|PR3PR03MB6427:EE_
x-ms-office365-filtering-correlation-id: 02a3cab9-867f-48b6-cadf-08de8c1488d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 PjhmoHIDyk3QVAwyk99GBtsTk13uACL2O3czg+3MY+a3/onStwWUF9WtQaiasAwCI1mdJx8OY5Pgx+ADnAvVKaid7RnK2jEAYRI3+Od44c9eMh5+OYJq5GXTDT1cD2pV3OK7GaJGS2NTj+wQnCndiyc2JHGanNc1eCHjAuNyIWVf45bgt9C8wND2QWdVJcnhI24sji9mSLXdHP7SxZhuamcyXBuVs7zI7EH0ZGtZ3i8HJRuV2KiJgBhBPH2ACD6jxvQcmVCjTL0fpmXqKwC1DQ17cCcy5/uWtmC/ThUTW+sM51u4Pj/t4v/FJm5LbEuimTiSOep5/+B5z1XgLXbJcii/7nkI99L+4kjOJDyk4HEHT2FiZyYlhcuNcFrdbcpknPy1rQZVSLkJZ9AtVgW4ika54Ewa30NtddQtZoCbxqqAwDQFSWVaZJVGCWjsLDAARhcDP1AtnY6nrK7Xhi7N0UldWCk79tAmiP2zoy5VRux3b6PivNxkCNcqqcTHzqg9PY8dkXzzZa1kMNwP1CjniI+Bv29n43T40IsvtGOVzc/XY1NWRRMZZGrNPNXVEjwDGaoz9JiwsXWEihp141qfEJdNuMxDQ9xd3hQFSgZtF+qs3KoqKBqiiX7E0Ijs+dJLiDZ4VOIiEC72CLoe08zBR1HYW4l7/L+CR5wWiSYX3XvQRyQ5rFLufJC1z9S/LgRkFsxa/Qh2uaiRQDcEvxsHJqQJBG7thkP/aO5HlHoPHsMlERRzv2rE2RX1VjIo6cG/PeZLNR8RqFEEMF8kz2gbZbDJMdeDU0ihMbtPndiIU2I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Crr+GDjfkJYf9dkhC0FBuIIJyhWVTNg+5zDP6/yxEIWPJqtuBAtNT9PnX/?=
 =?iso-8859-1?Q?fkZdPw9tgCFQndfL6zEq6xQDS8e9VTlpmTrGyRTZxRJwARF0MJnaPuHkq3?=
 =?iso-8859-1?Q?9S00eUd0E/0fzmeywptjO9e+PefVPVs05YytkrK38aca31CM+3ahHINIPi?=
 =?iso-8859-1?Q?isX5Oo5i3espskbxS1e4VvqL6c0q8dhHmGr+h9UdrfU4kggtV3ZZd1Xjsd?=
 =?iso-8859-1?Q?fvYfzBObXmE0O7g30CnNw98Kg/a8sFOSRSYsKpdmk394V9zkqEqymtXCR9?=
 =?iso-8859-1?Q?73l/0qqD4ucQj12GHfe3qnra01Zsq/yDQUpFPe60WLuDsygLngiU3oSZhA?=
 =?iso-8859-1?Q?Br/RgknK8MD9FeOPoQYwKac8DA6n+97Dh/F7lXJIJk6dJTR9xmlTO2mygl?=
 =?iso-8859-1?Q?pI3WFSWpvDMePvwOyNrvArueoh7h/NwT/w9dN88K2Z/5i9p2MikzvA6Xwq?=
 =?iso-8859-1?Q?vwMZlAV23Bj3i9QjYu+ovCjlpJgBamCdXDtb+SGK6UdLAZsXLlXUl+cM+m?=
 =?iso-8859-1?Q?tTbzfJfdIk7Kqad11TWfrKwTvzmaz0yQTL55OqTw4AJ3neb1RWZj0OBB/N?=
 =?iso-8859-1?Q?IiQ1NPnPQiyL9oMw5jjcieEbuFoBcSRVEKBFoebGWZ4s89jE/Kxn6Ggt+I?=
 =?iso-8859-1?Q?jRBDM3FCcGM6N0SXblxHbnrPV5cuGTeg6r1OxBuUyy/nzzYXXZnglg0YWG?=
 =?iso-8859-1?Q?9mpQuVlngWMoPSS8V9vodu5K+1zGN/sh9fAyOZJnqXP4uziioGKbqprK92?=
 =?iso-8859-1?Q?P0JSm3hKrYOJH7gL67JjCDEN1atYKi9E52EO+qAYIpeBkREKqMZ6X9IigW?=
 =?iso-8859-1?Q?F9p0V2ekpqpZW1HlBDQtSOj0TO1DYxedp1zsrh51UcSrihxSUb1sriaNbp?=
 =?iso-8859-1?Q?NdYU+mbVMABsxr2AjYFTc7I6xmScKFtv8gQbNnahCO/1ANW5pkczZMFQdh?=
 =?iso-8859-1?Q?N+j6RfHzDPWozEPxCq9eBoNLqb3b6dN/KLsAc8HVqMaBZZn11icNLirPas?=
 =?iso-8859-1?Q?5WYxTF/ML55C1mIozNpk81lrmHA9I22aOELYxpxasjj+XjenecVy6y+bRt?=
 =?iso-8859-1?Q?+fWH3Zmyj+8YaxE/xW4iRjUx2B79rArUTaKKDDK+Mv4Yswqz17sj16nqNQ?=
 =?iso-8859-1?Q?bxnxxMI0C2pobXtO2hs6kcUtbhLapgcsPdgWZc4T5kzubbYJLnHGDWc3vJ?=
 =?iso-8859-1?Q?GuvplrtXTW1W+v25Q41nQSVhfEHfUAplNUEtuNZ1tGJ0789YyRL2vsQXfF?=
 =?iso-8859-1?Q?GdsC0t4VI6HRlk2S4uMTSxyxtK/4YkVZhc7T6jWkmfnLrx6kMU5ao+KdkA?=
 =?iso-8859-1?Q?CweVSBQ9AxP9gFg+EdABSQcPRUZHTCanymwW4k/Z3hM3aVsOyMzYNsb17I?=
 =?iso-8859-1?Q?muakcY99TQNamcOFzUEGTTPptdQbTQvZ+Gmot9k1Nke9WbsjDtmAT1BiUH?=
 =?iso-8859-1?Q?2pSU1Q/vuaJd7lCI9KgwPHkwvucdRpMaCAj4RjlyFAhBSNaSTg7R76xHoz?=
 =?iso-8859-1?Q?wP017t3CC0I1wJSxDPaHrqVT/R+gC+zgP4Bz3YJZYpDgwZMuoZmhYG4NPg?=
 =?iso-8859-1?Q?ghOmO3og1zOipHm+hWKr2MvA6coXBFoidN5mSruptQ8FYr7EN+XrbJxomT?=
 =?iso-8859-1?Q?hVS/jcYFGq85e5pHSqYGMWnxi5wchdnWiYojoBpOMJR2VGW6saW7jMeaeK?=
 =?iso-8859-1?Q?bcBxPxsYX1VOB65VKrmRKN1wm4wUehFETq/ZzmI/x7HlOsk9xUYz46wHB1?=
 =?iso-8859-1?Q?+oUVESSO4XxIayucquea/6ADxxca77JR/UKtriqiwymYR/o2x/sr3kxuVJ?=
 =?iso-8859-1?Q?c/L7F7XvLF1qym8nRKSOAsYKLbmcdMc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a3cab9-867f-48b6-cadf-08de8c1488d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 15:21:35.5314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXlVYAZmds/wjBN0hK2PgaKdZ0oUnci3qGVV7YKUmYQ8hSAV89JTxwTbrqzF8ffQE2ZEgwMOiVJtnOLrGTEO5kzJjPpXCekt99nLHuUcPR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6427
X-purgate-ID: tlsNG-d62444/1774624899-8DCFBDF3-029C50B2/0/0
X-purgate-type: clean
X-purgate-size: 3462
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3D771346A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
zero values before applying period and budget to all vCPUs in the
domain.

This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
which already rejects values below the minimum, above the maximum, and
cases where budget exceeds period.

Use the same validation rules for putinfo as for putvcpuinfo, so
invalid domain-wide updates are rejected with -EINVAL instead of being
applied inconsistently.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Changes in v4:
- add R-b
- reorganize p and b checks order for readability
- add const to the struct parameter in rt_validate_params

Changes in v3:
- changed rt_validate_params input to get struct instead of
period and budget
- improved code readability

Changes in v2:
- introduce rt_validate_params helper function to check period and budget

 xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..b156f61afa 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1362,6 +1362,23 @@ out:
     unit_schedule_unlock_irq(lock, unit);
 }
=20
+static int
+rt_validate_params(const struct xen_domctl_sched_rtds *rtds,
+                   s_time_t *period, s_time_t *budget)
+{
+    s_time_t p =3D MICROSECS(rtds->period);
+    s_time_t b =3D MICROSECS(rtds->budget);
+
+    if ( p < RTDS_MIN_PERIOD || p > RTDS_MAX_PERIOD ||
+         b < RTDS_MIN_BUDGET || b > p )
+        return -EINVAL;
+
+    *period =3D p;
+    *budget =3D b;
+
+    return 0;
+}
+
 /*
  * set/get each unit info of each domain
  */
@@ -1388,17 +1405,16 @@ rt_dom_cntl(
         op->u.rtds.budget =3D RTDS_DEFAULT_BUDGET / MICROSECS(1);
         break;
     case XEN_DOMCTL_SCHEDOP_putinfo:
-        if ( op->u.rtds.period =3D=3D 0 || op->u.rtds.budget =3D=3D 0 )
-        {
-            rc =3D -EINVAL;
+        rc =3D rt_validate_params(&op->u.rtds, &period, &budget);
+        if ( rc )
             break;
-        }
+
         spin_lock_irqsave(&prv->lock, flags);
         for_each_sched_unit ( d, unit )
         {
             svc =3D rt_unit(unit);
-            svc->period =3D MICROSECS(op->u.rtds.period); /* transfer to n=
anosec */
-            svc->budget =3D MICROSECS(op->u.rtds.budget);
+            svc->period =3D period;
+            svc->budget =3D budget;
         }
         spin_unlock_irqrestore(&prv->lock, flags);
         break;
@@ -1440,14 +1456,9 @@ rt_dom_cntl(
             }
             else
             {
-                period =3D MICROSECS(local_sched.u.rtds.period);
-                budget =3D MICROSECS(local_sched.u.rtds.budget);
-                if ( period > RTDS_MAX_PERIOD || budget < RTDS_MIN_BUDGET =
||
-                     budget > period || period < RTDS_MIN_PERIOD )
-                {
-                    rc =3D -EINVAL;
+                rc =3D rt_validate_params(&local_sched.u.rtds, &period, &b=
udget);
+                if ( rc )
                     break;
-                }
=20
                 spin_lock_irqsave(&prv->lock, flags);
                 svc =3D rt_unit(d->vcpu[local_sched.vcpuid]->sched_unit);
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a=

