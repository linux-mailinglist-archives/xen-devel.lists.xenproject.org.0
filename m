Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM6OM+yJsmneNQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A38926FB9E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251869.1548710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW0-0002iP-NJ; Thu, 12 Mar 2026 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251869.1548710; Thu, 12 Mar 2026 09:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW0-0002eo-Ii; Thu, 12 Mar 2026 09:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1251869;
 Thu, 12 Mar 2026 09:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOdu=BM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1w0cVy-0002bV-Lg
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:39:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60571d06-1df7-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:39:33 +0100 (CET)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI0PR03MB11417.eurprd03.prod.outlook.com
 (2603:10a6:800:33f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Thu, 12 Mar
 2026 09:39:29 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 09:39:29 +0000
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
X-Inumbo-ID: 60571d06-1df7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AybG1Qz+w9ZnIsfc2qqHjkhrDTMkXuct+b/rVdY7tbAUCEqie1XWxPAkLCFF9N1Yvzs0pey9COdI1XafvtDQI5+PusL8syD5neifq+V4T1LYyEY73pjGC8SdFR919ThQUyXQzWXCdMyPiOrcDQxsVRMhisJTUgDqyEfGv4rhSU+c7bPLOVcUjJIVjfFjBhZ1G7R2ofkoFO0ibPZuFe79CRlqc1XAcFLPqg0hsCND65Bvlfd8iyw5h69nqFlOtAltZIR+4N+sN18BA4X+au2MuKtefIYfAvxtGNg0E7qqwJw4BOdxplb+7RUer6HsMOEz12Gjkt1AE/aZw5Rsqe90aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLI6IwIK+VlXbgQ3Sjr7x5ljFFWsn3YcrGhmOMX1iXY=;
 b=S5WFk69Xg1KHZgCLcaUg+OFsKEu/TpzSXSsw9tQhuItrV9Fw8Wn+zV5MOBA50EDpN90yu/lnNy5S6pg7EfHG4XhJO9Af+svS8X+poMM6Cukb8k/ngXkSMAj9QB2cvzp5WGcxH9/5ZT05WAe31b/5bV56vi8LCdMJ9PWaAwPWvpFRyXq7V0bgnszLmjp0YbGWXbShdRWzYlICXwVQrA2tPcUUB5xaqXZDcMoHg2rRUAG6FzNOZgEwa0JRhMnAQjzlMlj+T85LgLgDgTIOGyiJM157G1xVOCPvPtbVbtLVwye4nQNHMPmDCSd24OxsVGFnY0XDGXEQ7O3ApyWwLYc5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLI6IwIK+VlXbgQ3Sjr7x5ljFFWsn3YcrGhmOMX1iXY=;
 b=OoeKr+0A/yFO5Gv7Y4I56Rdanm8ulUlbe+DxbyUL878Eq04T5JrKx2YXqyp+1sNBRanogLdG5OutuwVxcZ6JpMzSa/KIEeOYxpb0IyUHRxw/FNMnOAxW3rMZLkYzsf9+pilaE3HiWF5iYMh9Er/f8f2IaBojXTOcB/4jsK72PZCCde9EOI4wPJTsnrkTrw07H0jIwDhQxlN8URAj24h1tKgOG4fdlZCYONphQOwMpZbAK/cuobmWz4IXRU/+mTN4mgMaw5mpXUmRQFJKpWPR5/oHUG5PVaIh6o0mezDOsFdSROFLkV85K3B2/h0sYR9H5D6BmAVTffmkfiiKhVN9Pg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Index: AQHcsgQfYo2+uc7QB0+uZY6Wrq2Bgg==
Date: Thu, 12 Mar 2026 09:39:29 +0000
Message-ID:
 <733d58a26766a1d15e47447ed4f3cd299dc28cf7.1773307749.git.mykyta_poturai@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI0PR03MB11417:EE_
x-ms-office365-filtering-correlation-id: fc54aa19-5856-4573-714c-08de801b424f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 VpjDlbooQ1zHEXVSZioWg6qY3s702CPSMoPWZDDPn1VSLwOZn/NPlyr8O/ElES18ks1Rd31oTWkTliNb7EGlei0wP4l7hH/CMnm8zRDapHs+tVOVZ779KB3tFwbACvDtHbFeWvroXE18j7RNjq9Nw7OCqnr9x+8Ry+pB7f/XPion7JvU1pYFkUofWCPDXY9wW+z6WGn3KmxVNa326ONe3ZMF9l5XPOsD7OmKNvXzw9J/mSQbBsU9IzJ7CXZgNdVhLLRIO7lS+bYyUzfK5vFhIWQ3Lg+L3B14opVR8xVS19oiJXE92sZOJIA/7rw0oM91oDMlERs0DuYBvQ5NA3xO6+m6whPo+9cnSvek42jEi1TpM101wMiHj8dg6vTZUHFKY6kpLw1ND9RsJRB6dLWC3A8I8t8zht6e+RHfY9KaNm3WeDvTPVGteg6w4mYfHOpCPF7vw8Wb6kZSIPu67sPKLPufAtU1ZIzUzOloU7DOjqjxJV8x3VkSXg3cf1soN12defrKWRkTUhSpouXQ3w4SYDXHg2LmAvSQucu3K8WLlqJ1pOpwFZqMHXZtALgvYm0mwY+B5ugPohQ7wL6qFol93td5wq/0L4S7C++h5xkrqvN4Vu6VtROvuGL4lFzovv3fB36ri7wGm0BiIThpjpswkz5H2uFqxXluTWLwELKen6Ymjrgv51PELLFwBoV/ibYsTy6/Ssi1v1csQR9g93f1PON2toC2OzIB051cnR9Y9P3O8jPLcy+Z1fgZ0j7mfz0GR2kQTbFhE34/YvWhDPcuwEfJJPvxqFfWnF+2fLtNrdc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lEs1eqVyJxfDAviCaW2K5hTR/HjXfKlKwLHFC5Hzdnzu/xQHZnNObxgPCM?=
 =?iso-8859-1?Q?Oio5/P+HFRLna6fHS2Oo1o4nuzuHIEZX8Pd9GV5yySfB7RJyItV/AmD685?=
 =?iso-8859-1?Q?JrnruB0PzNIC3mRVWsKEoiHyzwtYVNuIqsiEoCn9jrXD/3KEa3nSS6AJqQ?=
 =?iso-8859-1?Q?v1vjuPmCX4yN51Hp7lPnUV52mZcPdVQLwM8V/JXBz8eyVq5KlQ6UXCcDy6?=
 =?iso-8859-1?Q?jHtrP89qGQwD1nyM6lGlNGyczU/pIT2qfVisUpXJpac603sgnPlG9ZZVRH?=
 =?iso-8859-1?Q?xBGisxV3+KrLpQLhZ6dbiC2wK2TiAgdSERkocV6s9KHzCfvZKmZooG/CH8?=
 =?iso-8859-1?Q?Oa1VLROV6ajsc7XAUchnPN3b9LPA0qzA1WdhfVhBm2gXjNJ30tOBPfRCC5?=
 =?iso-8859-1?Q?/75lD5/7pp4de6gAKek+st096i60Tyvg0XkibAlgh4CaOpBoWv3x9ro6DR?=
 =?iso-8859-1?Q?m2i2Cz7lfcYsfhRT3sWPnw9uNXMDPAFF3nmhSX7V1+cVMstuowdhfy6o5o?=
 =?iso-8859-1?Q?5CLVIERd/hXNKairx5UUOFjez44y/ZGtD45peqsOVA4QBNcH92esV2KIz2?=
 =?iso-8859-1?Q?SvtaXOJGgUHPZ9c8cFPF9RlKVLHZuKff9Gk9PgwMNnvpqOILp8t/uZuV+J?=
 =?iso-8859-1?Q?Yw/AcH9psctgW4imX5WtjRsZiZlxiVnTIv4qFwyXQxh+KtpB0nprH2edC4?=
 =?iso-8859-1?Q?1EvHS7OUXIecGKCJeHj15XKRRYDhrWHxI4VpGZbGe3big+yeOUWxIGY5Hq?=
 =?iso-8859-1?Q?rlKHIZVT7RWa/+fgPXFSd2mcIpiONBF/aMr7+aFgRCLNgf8/nYX/orftgV?=
 =?iso-8859-1?Q?1rYaH3lPhWwiMPlVb84QWgh08V8JoRnaoQmkC4zwu+i7TzwH+NkpyDc6iI?=
 =?iso-8859-1?Q?2r9zPed02NUB8ji3qNKYcXrFwxBDQaiUlWVecg9B7BIt29mMao1H9fhbEI?=
 =?iso-8859-1?Q?djIXet7txrBJ5Jug+5Kq96XprcYT3Q/thlPSMF7bRbiiR3h1EF+tFbDT18?=
 =?iso-8859-1?Q?Qbik/My7G3wSTJqSa5XmEK3zBp1+1e6rRwznAtyU4GF+qxY+u+VSy/oY1X?=
 =?iso-8859-1?Q?431pBnlqVwem+kZhbytA+2bciciGWyZFWpRxoaBHZohZ8x+vuGT4oNAst7?=
 =?iso-8859-1?Q?egcSArZ2nZQFZZRFvTjL1VhRQkyhQU46953wvUo5CEXUlEMbmJCjrxf3F5?=
 =?iso-8859-1?Q?YRjL19OzKPZpnhpKqFmDLoFKsRzbvNdr+aXEs0BMcZv5nXfj9WB+ttBlqR?=
 =?iso-8859-1?Q?F1afENLt6/ON4fXHq+BI4x/CvutD03jSouB3FIPOLrUYATwurcTvDcMY0i?=
 =?iso-8859-1?Q?kUBvN9Wv8ev5ZGAb3rrMvD4dkEYoRYHc4A/yhj+q+1fSpGs/W2K2UjLTeO?=
 =?iso-8859-1?Q?SCKTdIzBcJuGwJ4oBfrE7uGNK6xBQqvmBSCcoKABzm2pRrrpCOf3QITdu+?=
 =?iso-8859-1?Q?i7WZwgcpCBvqy32qVmTPdgFnTVj98otuEUiAnUMKS0ISyw3ZxiiL9KwF2D?=
 =?iso-8859-1?Q?IvmSiR5+GM5gYM7fHBohMUci6zSQUvlpTD+GDbLmZwq5VgQej0OEMjFlyP?=
 =?iso-8859-1?Q?tDBwe9boLsWHjh+75fcgTGXD0tcllw6yJTr/PvAnZ5TWGkmmGGBn77We1L?=
 =?iso-8859-1?Q?Egea/bTUM/TIoJek5q4wh+wU5bpJb7EgO9PPcbr4/9rTtaN7A+at6oSy+9?=
 =?iso-8859-1?Q?Hcw0KX7D0RzSEacH0DSYRRNAEiNXFnpsBNLmH3gq7PB5AiwzwY7wafYRr5?=
 =?iso-8859-1?Q?Y7RTGxpm/GR8gub8qbM5/BJI9ljiB2f0A991GYX2F/otb1R+2RMhH/gVaA?=
 =?iso-8859-1?Q?0wTLPl3ZWZekRaayW8FzG78iy/mOoRc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc54aa19-5856-4573-714c-08de801b424f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:39:29.7339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9nRvl/F8/1rq3d6lGT3Ya57T5V7KDyBRg0eTwSfaw4ciVz1oarbNrXFN43XQRmwo/0fAdYVbYjRMn3Ps/EaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11417
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
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6A38926FB9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently on Arm the desc->affinity mask of an irq is never updated,
which makes it hard to know the actual affinity of an interrupt.

Fix this by updating the field in irq_set_affinity.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

---
v5->v6:
* add missing locking around irq_set_affinity calls

v4->v5:
* add locking

v3->v4:
* patch introduced
---
 xen/arch/arm/gic-vgic.c          |  2 ++
 xen/arch/arm/irq.c               |  9 +++++++--
 xen/arch/arm/vgic.c              | 14 ++++++++++++--
 xen/arch/arm/vgic/vgic-mmio-v2.c | 11 +++++------
 xen/arch/arm/vgic/vgic.c         | 15 ++++++++-------
 5 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..5253caf002 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
             if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
             {
                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
+                spin_lock(&p->desc->lock);
                 irq_set_affinity(p->desc, cpumask_of(v_target->processor))=
;
+                spin_unlock(&p->desc->lock);
                 clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
             }
         }
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..7204bc2b68 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct ir=
q_desc *desc)
     return irq_get_guest_info(desc)->d;
 }
=20
+/* Must be called with desc->lock held */
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    if ( desc !=3D NULL )
-        desc->handler->set_affinity(desc, mask);
+    if ( desc =3D=3D NULL )
+        return;
+
+    ASSERT(spin_is_locked(&desc->lock));
+    cpumask_copy(desc->affinity, mask);
+    desc->handler->set_affinity(desc, mask);
 }
=20
 int request_irq(unsigned int irq, unsigned int irqflags,
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6647071ad4..c59f6873db 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -445,7 +445,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
=20
     if ( list_empty(&p->inflight) )
     {
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         return true;
     }
@@ -453,7 +455,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
     if ( !list_empty(&p->lr_queue) )
     {
         vgic_remove_irq_from_queues(old, p);
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         vgic_inject_irq(new->domain, new, irq, true);
         return true;
@@ -473,6 +477,7 @@ void arch_move_irqs(struct vcpu *v)
     struct domain *d =3D v->domain;
     struct pending_irq *p;
     struct vcpu *v_target;
+    unsigned long flags;
     int i;
=20
     /*
@@ -494,7 +499,13 @@ void arch_move_irqs(struct vcpu *v)
         p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+        {
+            if ( !p->desc )
+                continue;
+            spin_lock_irqsave(&p->desc->lock, flags);
             irq_set_affinity(p->desc, cpu_mask);
+            spin_unlock_irqrestore(&p->desc->lock, flags);
+        }
     }
 }
=20
@@ -574,8 +585,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsig=
ned int n)
         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
         if ( p->desc !=3D NULL )
         {
-            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             spin_lock_irqsave(&p->desc->lock, flags);
+            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             /*
              * The irq cannot be a PPI, we only support delivery of SPIs
              * to guests.
@@ -944,4 +955,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, u=
nsigned int rank, uint32_
  * indent-tabs-mode: nil
  * End:
  */
-
diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio=
-v2.c
index b7c2d7ce99..fc04741ca1 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -159,24 +159,23 @@ static void vgic_mmio_write_target(struct vcpu *vcpu,
     for ( i =3D 0; i < len; i++ )
     {
         struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid + =
i);
+        struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
=20
-        spin_lock_irqsave(&irq->irq_lock, flags);
+        spin_lock_irqsave(&desc->lock, flags);
+        spin_lock(&irq->irq_lock);
=20
         irq->targets =3D (val >> (i * 8)) & cpu_mask;
         if ( irq->targets )
         {
             irq->target_vcpu =3D vcpu->domain->vcpu[ffs(irq->targets) - 1]=
;
             if ( irq->hw )
-            {
-                struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
-
                 irq_set_affinity(desc, cpumask_of(irq->target_vcpu->proces=
sor));
-            }
         }
         else
             irq->target_vcpu =3D NULL;
=20
-        spin_unlock_irqrestore(&irq->irq_lock, flags);
+        spin_unlock(&irq->irq_lock);
+        spin_unlock_irqrestore(&desc->lock, flags);
         vgic_put_irq(vcpu->domain, irq);
     }
 }
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b2c0e1873a..81ba4099ef 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -812,21 +812,22 @@ void arch_move_irqs(struct vcpu *v)
     {
         struct vgic_irq *irq =3D vgic_get_irq(d, NULL, i + VGIC_NR_PRIVATE=
_IRQS);
         unsigned long flags;
+        irq_desc_t *desc;
=20
         if ( !irq )
             continue;
=20
-        spin_lock_irqsave(&irq->irq_lock, flags);
+        desc =3D irq_to_desc(irq->hwintid);
=20
-        /* Only hardware mapped vIRQs that are targeting this vCPU. */
-        if ( irq->hw && irq->target_vcpu =3D=3D v)
-        {
-            irq_desc_t *desc =3D irq_to_desc(irq->hwintid);
+        spin_lock_irqsave(&desc->lock, flags);
+        spin_lock(&irq->irq_lock);
=20
+        /* Only hardware mapped vIRQs that are targeting this vCPU. */
+        if ( irq->hw && irq->target_vcpu =3D=3D v )
             irq_set_affinity(desc, cpumask_of(v->processor));
-        }
=20
-        spin_unlock_irqrestore(&irq->irq_lock, flags);
+        spin_unlock(&irq->irq_lock);
+        spin_unlock_irqrestore(&desc->lock, flags);
         vgic_put_irq(d, irq);
     }
 }
--=20
2.51.2

