Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFS/CVSn4GlZkgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:09:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29240C046
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283154.1565435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIiF-0000II-JQ; Thu, 16 Apr 2026 09:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283154.1565435; Thu, 16 Apr 2026 09:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIiF-0000FZ-Fy; Thu, 16 Apr 2026 09:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1283154;
 Thu, 16 Apr 2026 09:08:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wDIiD-0000FT-Jy
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:08:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDIiA-00DMIq-Tr
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:08:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e0a708-bab6-0a2a0a5309dd-0a2a450c94e6-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:08:36 +0200
Received: from [52.101.66.42]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e0a713-62f1-0a2a450c0019-3465422acad4-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:08:36 +0200
Received: from DU7P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::26)
 by DBBPR08MB5914.eurprd08.prod.outlook.com (2603:10a6:10:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 09:08:30 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::19) by DU7P250CA0011.outlook.office365.com
 (2603:10a6:10:54f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 09:08:30 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 16 Apr 2026 09:08:30 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS4PR08MB7853.eurprd08.prod.outlook.com (2603:10a6:20b:51c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 09:07:25 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 09:07:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MikJ1ZYx8lklMNkZ7Lx/9q21mSty4tX7e1F78s1HpDbZhXKBEqSkNft8Ww8hDmt6xya3zqBR1P0jlHoNwC228v6mFTRIF5nXg+U4Cy3RRfoNJiJvC7iAw6iPkZVcfHSIZ+IcogihlNyciZ9N08jDW6tLOpCo+9Jf/ll/n64gys7cZZU5TEb1EJbddGHbdI1ISMkbsbjZ44+adGwX0BgHCosCEOYW26AAro9dVwYFM3N4aN6ocW9l3sbDqW/FivrpaVTN86NRWu7Opw0g8B2Awa8N04yr97+nT8mZ/BS31kKES+3JN4Jjvg17niTodJUslmoPbASyWEWMklLHS64ScQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm5UJllHbmNZIIv/M7TUu8Wi/T/dV4sYogTv03TP/yk=;
 b=J/FBTAW9cDLE7cvZCW1429c2pq0my7yaE8pEzy51klk2FrnPO2nB6OKiRBhJPAELueYGJCZ8yY8upIxnJJxiW9R94CwMZZ2xA3NEvvz8mHGI1EGP35np1OQkdA0FpmICfJ/hJbg8mV6IvY8JrnSsZap7PpAFfkSpqvn6CWyd9gXHsTcK+tQ5JRkoutktBLnHySYm7h5mRjMeQTtftCZV5uZOq56aaD7VU9NNELeMODs5LnEoOaAm3yKoBzBojqo1RdiwVP3U/6fNoMNh5JjpKGG0Dt89V/+IVFv+IXwfagCCymdwK8AkPa6snbiySHAU6EIQpTZObWjpVxxW19yKxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm5UJllHbmNZIIv/M7TUu8Wi/T/dV4sYogTv03TP/yk=;
 b=qx3hy+5BO7MEw8FY4Hr9loG5uoqHWiX61KlkkwopSkbl0dIF6OqelHYyF8aui7A3vr4D7nxJb+XHqkJJKI0rHlkx/wUal4F9MqqE6WgEBUmHdhGfSXfLRV1GE9uQm73V10kGE/2WHCBX2CbczSr7QnXImv0fGX/Tjv66vW5kMGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqd5Cni1oDVLkxpy93okFBQvBkEydRnSMmMXuD6zP7vUMTFJlOwOZQRDntjkiMtfMWl4IzY6mcLq0Ny2Lg6OOs2kZZ18PSywn0VxqDMyq+Indg6neShURYfQABKUnXriMW3WfS30ft6q5I8wp46HHbeLr0deEIDN0lSonuDelFLWLAF+CZw3SSsfYTeKTMhcAzZ5yIrMjhcMUM641XmyWGhkyjA291x2tG1f1P2/p61qP8POV/FStGiGFmUNQJkkYUSGsViZ4BMCjgcSzIo5VDlK/NNvm99fq93vJNTsIRBD68HWQlvLwYw6r3dqCF+GU57rgl3wJ4HznLrIyJZWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm5UJllHbmNZIIv/M7TUu8Wi/T/dV4sYogTv03TP/yk=;
 b=pxclCoH92GJ1d9vlPnQhlHoNSzwpAVmXJRBI1vDb3+ZFqeM4IcZ0eUvjZuLBP2OmRH5xaiQiEpn4Mw3NFR5z8ONqL7ji5bVNxzH6OE3foZBRS64xZdMdCez2tWjuHtDqAtttG8LdMZwCBSwkhziw/u1bIwAV9l72/srBbS+iV+SqAhbx1lr3NqNinNxKNuf+YUoqnBCi9u7wlORD2PjRMDEhg1KfXcFFxKFXWgwBgJchEMOmvjxkkZZEPh4km0HRaz5VUKgiP4mXvnJYwlXNmxwLWaYZvex5yp0Y8GxuqTCkBfuRlV9IwOLM9Q1ex1CijQZ4+ApnNg1CT9My+8Ydmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm5UJllHbmNZIIv/M7TUu8Wi/T/dV4sYogTv03TP/yk=;
 b=qx3hy+5BO7MEw8FY4Hr9loG5uoqHWiX61KlkkwopSkbl0dIF6OqelHYyF8aui7A3vr4D7nxJb+XHqkJJKI0rHlkx/wUal4F9MqqE6WgEBUmHdhGfSXfLRV1GE9uQm73V10kGE/2WHCBX2CbczSr7QnXImv0fGX/Tjv66vW5kMGc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Topic: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Index: AQHczMxJn1pwTu5+sUmN2MgYtFAQK7XgQWaAgAELlQCAAA1zAIAABFcAgAAIYIA=
Date: Thu, 16 Apr 2026 09:07:25 +0000
Message-ID: <2CD46F3B-C978-47F3-ACBC-BF2F39985B42@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-6-michal.orzel@amd.com>
 <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com>
 <1ab0c888-e890-490e-adad-938222f31a62@amd.com>
 <6E811F82-6F9F-4894-B2A3-03AA166E78F4@arm.com>
 <de3ed940-c788-480b-8820-66afb3c8dc82@amd.com>
In-Reply-To: <de3ed940-c788-480b-8820-66afb3c8dc82@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS4PR08MB7853:EE_|DB1PEPF0003922F:EE_|DBBPR08MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: e350155d-54b4-4ce1-1fb7-08de9b97ba9d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 uu+rB2if8u5nPyfyPuspagONrf9YbgzyigmT+9Igehv9lgT6kGEQG3Qyn5OnDePVbt9+VIlnH7znryZTXn70e4q5tXBxEylKROqfZmezJp7OfavT9A2ASxIY1TsV0NrzfHKPdAR7hKSqrrQqoRvLQyyLBTsBKxr3hvhyNOQmoKw123om/G0dn36oqSQ7uGvQjkGxVLcvbwmLuCOT+r/+j8BoBPLfWE8x81wg70t6Za+YzQdPg05KxGYIL6MY7DkSFc002oS+2MSFw9Ay0E9525CRv6PgUkSM/UNmf0Nt8DtLy4ImTX+ArRd0nEs2dyexFfkmAc30QdVXXKdSt8doOzkhZL7k8TPdPSr8HDBZhqaFJJbaAQtt8AcaVCF3KkRlrwEQbntqX2riJBDhmNiu4L2imZXWn9racboJNcHipXv4jcNl/ekGBDgyCdxMVIYEdu+poVElfG80LilgK7NRC0WqljSRpxyhnXkBFLNzjGy4xI8V0foleSTdWBRA+nUyN2vSh5wOKUQQRvtdoA/r1X3cMEmUF0Z68eEFf2AiZMBpzbZNOPLPXAshksNPlWdACQZieT6IMjNqg+bfEDl28QZhMBj6SCAuTLLUSzxCnEQW/3eK4J2w4QO/SrUJzGufc5PVS9wc188BuqkQ5iGj8aDHFP2pVK4jZ3VYFV0qi3zcurVIxJf91B++oWwNhJkrFo+BEclyzDa/xg8EPaiP4v4snsWS73I9VEf8EO66rOdbCWR9SQL8iyEQVORotH9ngu1gG96PQ9CalF3EcTtdBjjUfzpJ5Djy2CUC39mNQTA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D733387CBCCB5A4EAC3806AF66711F14@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 LzOwr4bgHor6XuLVRJikMkyCzf1HIt+28ei9lF8dF1gtdRzJO+S4fNt/Ti45tr1QF/KzEWitr6DmYEydTneAHy53wxlqRVN4jrEeKF+8agv66nw9iCihmGVijpqNwKSImX1ol0dmoWKOZHV7o3sQ479Q9/1burvdDfKkRViey9UiBw2T1rtxJYAPZUArFSfzsM1EEgE7uwvbT5lrF2dM+TOzo2i7pa8733rMKwn+w51Hstvbu8iTaIm8FwRuChp7VSrT3foB4mlevTUywLIV8NeiOoSWedg249LRG2XudF/Vhw7APvYGEWHfJ3uKz/8/4asaILP4UETvEex/smr3gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7853
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a35adb12-7d19-4bf1-1f29-08de9b9793b2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|14060799003|35042699022|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UC1FMZAmj18NaY9xFpxjwehq0E0nVUbR0Y7iV1tVLxmGV8stifcYwlrIYcksdHmWQnzJRahtB4/M6NdWLjyeqmB7LZvJjP6u3d5EH1RFuJ+Xgww6TM5Ltoy66Qc2lh7wFCvixeZU7KLteu064n3OK1jsHM++mSi3Nc+5maA3GmTgGNx2yu1e01JUTb+lNG0IV6G+L/cmEnSerPokwVXekItR+xPys3l607R7+CfyWt1wkTEkUodV3jQkFj7mCuJ3wPKmK83tadYPWNLCnN9epbS6hy1uTVs5LYdREvzNFK8hzuWiA3CpWDA5QgJTTM/gmR2zJkQUQBMVr0B70C2S3oHSExzkOQZIqh5akQg2hJ+kqjRVbyRgAQ4s9hriJD9vmaI8SYvSmCVhGWrn60MnRjdl01aa+GjPlAvFL/K/awC+z3/Z+LnofXFCi6eOlVQjHUCLPVcde1NtxLAOzVwWx89MjPAjCDQy+K6/0x/GsH53yG0pb85lXrWKvfOZZ2yho63x0ixlUdlhf0Z6texj8nZlTsROLvXmjYBg2Zzy9TsMgZeAGVhHTsY+xY4jFp5RKI2yKrYvvs7kc3ObvvvtmkRvIpwaynpO7s2N7gwNpiMc1t+DVqdxXsGi8gKKxTU7Me0jGiWbJhYYhOdWVPTDoriHbDggnJPgeWZDy6cGe+mK5MUL4TzKSM8PSGyw45oek0kkY5KoVDiYGqevV+HgS8d9Cgp4DehwX33ka7t4fEuduj7U4uaind1/v0QddgrX7Hvz29JWDIS5D6OnxKAzVA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(14060799003)(35042699022)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y+AXG2vxwfmoF1dyM25+nqcM+AdV2SNCOIovJEUyp40GHSF+Kyz7f8dtB99mCa2r2fonXB5aj6eW1lKUgsCYXM0ihV2F4N6Dcx/CqDcOQXGfCJZAGcD1maxsgvYDp97AOWwcBVG8Zoy57GOz0wCwjb3NEoLCmnOXjVBXWXQH8WrSekIWBzFEl64hk14vsGk66vdqsmlsgNCa2Ujgq8AEId6nIMxOn7Ya7PX8Rwx1Ro6WnnZaOHG3vyOKN0oZCOiSq4uzFYMM6AOMPhEkDNkEv2JSUPm/UGE1WqzmOv4xzCfYglhtLu/FqJMKa5arfDZGCEYjvix1GVajlsd6r5odV334I+E4remi498g3otMdC6ZU6uhtOmS+Esu4t8eGPCrGBRZkaUI/6ophS923VFsSeaLMaMk/qA4wpeliEDB+yK3h1kysuQMazr+7zZvLWfY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 09:08:30.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e350155d-54b4-4ce1-1fb7-08de9b97ba9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5914
X-purgate-ID: tlsNG-d25034/1776330516-6CD63CF5-DB8B3062/0/0
X-purgate-type: clean
X-purgate-size: 4854
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,arm.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: BB29240C046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMTYgQXByIDIwMjYsIGF0IDA5OjM2LCBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE2LzA0LzIwMjYgMTA6MjEsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L2RldmljZS10cmVlL2R0LW92ZXJsYXkuYyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZHQtb3Zl
cmxheS5jDQo+Pj4+PiBpbmRleCBkM2Q0NjY5NzE4YWMuLmEwZGVlN2VkYjdlNSAxMDA2NDQNCj4+
Pj4+IC0tLSBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZHQtb3ZlcmxheS5jDQo+Pj4+PiArKysg
Yi94ZW4vY29tbW9uL2RldmljZS10cmVlL2R0LW92ZXJsYXkuYw0KPj4+Pj4gQEAgLTI4Niw2ICsy
ODYsNjMgQEAgc3RhdGljIHVuc2lnbmVkIGludCBvdmVybGF5X25vZGVfY291bnQoY29uc3Qgdm9p
ZCAqb3ZlcmxheV9mZHQpDQo+Pj4+PiAgIHJldHVybiBudW1fb3ZlcmxheV9ub2RlczsNCj4+Pj4+
IH0NCj4+Pj4+IA0KPj4+Pj4gKy8qDQo+Pj4+PiArICogUmVzb2x2ZSB0aGUgdGFyZ2V0IHBhdGgg
Zm9yIGFuIG92ZXJsYXkgZnJhZ21lbnQuDQo+Pj4+PiArICoNCj4+Pj4+ICsgKiBUaGlzIGlzIGNh
bGxlZCBiZWZvcmUgZmR0X292ZXJsYXlfYXBwbHkoKSwgc28gcGhhbmRsZS1iYXNlZCB0YXJnZXRz
DQo+Pj4+PiArICogKHRhcmdldCA9IDwmbGFiZWw+KSBhcmUgc3RpbGwgdW5yZXNvbHZlZCAoY29t
cGlsZWQgYXMgMHhmZmZmZmZmZiBieSBEVEMpLg0KPj4+Pj4gKyAqIEhhbmRsZSB0aGUgdHdvIGNh
c2VzIHRoYXQgYWN0dWFsbHkgb2NjdXI6DQo+Pj4+PiArICogIC0gdGFyZ2V0LXBhdGggcHJvcGVy
dHk6IHRoZSBwYXRoIHN0cmluZyBpcyB1c2VkIGRpcmVjdGx5LA0KPj4+Pj4gKyAqICAtIHRhcmdl
dCA9IDwmbGFiZWw+OiB0aGUgbGFiZWwgaXMgbG9va2VkIHVwIGluIHRoZSBvdmVybGF5J3MgX19m
aXh1cHNfXw0KPj4+Pj4gKyAqICAgIG5vZGUsIHRoZW4gcmVzb2x2ZWQgdG8gYSBwYXRoIHZpYSB0
aGUgYmFzZSBEVEIncyBfX3N5bWJvbHNfXyBub2RlLg0KPj4+Pj4gKyAqDQo+Pj4+PiArICogUmV0
dXJucyBhIHBvaW50ZXIgaW50byB0aGUgRkRUIG9uIHN1Y2Nlc3MsIE5VTEwgb24gZmFpbHVyZS4N
Cj4+Pj4+ICsgKi8NCj4+Pj4+ICtzdGF0aWMgY29uc3QgY2hhciAqb3ZlcmxheV9nZXRfdGFyZ2V0
X3BhdGgoY29uc3Qgdm9pZCAqZmR0LCBjb25zdCB2b2lkICpmZHRvLA0KPj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZnJhZ21lbnQpDQo+Pj4+PiAr
ew0KPj4+Pj4gKyAgICBjb25zdCBjaGFyICpwYXRoLCAqZnJhZ21lbnRfbmFtZTsNCj4+Pj4+ICsg
ICAgaW50IGZpeHVwc19vZmYsIHN5bWJvbHNfb2ZmLCBwcm9wZXJ0eTsNCj4+Pj4+ICsgICAgaW50
IGZyYWdtZW50X25hbWVfbGVuOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAvKiBUcnkgdGFyZ2V0LXBh
dGggZmlyc3QgKHN0cmluZy1iYXNlZCB0YXJnZXRpbmcpICovDQo+Pj4+PiArICAgIHBhdGggPSBm
ZHRfZ2V0cHJvcChmZHRvLCBmcmFnbWVudCwgInRhcmdldC1wYXRoIiwgTlVMTCk7DQo+Pj4+PiAr
ICAgIGlmICggcGF0aCApDQo+Pj4+PiArICAgICAgICByZXR1cm4gcGF0aDsNCj4+Pj4+ICsNCj4+
Pj4+ICsgICAgLyogUGhhbmRsZS1iYXNlZCB0YXJnZXQ6IHJlc29sdmUgdmlhIF9fZml4dXBzX18g
YW5kIF9fc3ltYm9sc19fICovDQo+Pj4+PiArICAgIGZpeHVwc19vZmYgPSBmZHRfcGF0aF9vZmZz
ZXQoZmR0bywgIi9fX2ZpeHVwc19fIik7DQo+Pj4+PiArICAgIGlmICggZml4dXBzX29mZiA8IDAg
KQ0KPj4+Pj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4+PiArDQo+Pj4+PiArICAgIHN5bWJv
bHNfb2ZmID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9fX3N5bWJvbHNfXyIpOw0KPj4+Pj4gKyAg
ICBpZiAoIHN5bWJvbHNfb2ZmIDwgMCApDQo+Pj4+PiArICAgICAgICByZXR1cm4gTlVMTDsNCj4+
Pj4+ICsNCj4+Pj4+ICsgICAgZnJhZ21lbnRfbmFtZSA9IGZkdF9nZXRfbmFtZShmZHRvLCBmcmFn
bWVudCwgJmZyYWdtZW50X25hbWVfbGVuKTsNCj4+Pj4+ICsgICAgaWYgKCAhZnJhZ21lbnRfbmFt
ZSApDQo+Pj4+PiArICAgICAgICByZXR1cm4gTlVMTDsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgZmR0
X2Zvcl9lYWNoX3Byb3BlcnR5X29mZnNldChwcm9wZXJ0eSwgZmR0bywgZml4dXBzX29mZikNCj4+
Pj4+ICsgICAgew0KPj4+Pj4gKyAgICAgICAgY29uc3QgY2hhciAqdmFsLCAqbGFiZWwsICpwOw0K
Pj4+Pj4gKyAgICAgICAgaW50IHZhbF9sZW47DQo+Pj4+PiArDQo+Pj4+PiArICAgICAgICB2YWwg
PSBmZHRfZ2V0cHJvcF9ieV9vZmZzZXQoZmR0bywgcHJvcGVydHksICZsYWJlbCwgJnZhbF9sZW4p
Ow0KPj4+Pj4gKyAgICAgICAgaWYgKCAhdmFsICkNCj4+Pj4+ICsgICAgICAgICAgICBjb250aW51
ZTsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgICAgIC8qIE1hdGNoIGVudHJpZXMgb2YgdGhlIGZvcm0g
Ii88ZnJhZ21lbnRfbmFtZT46dGFyZ2V0OjAiICovDQo+Pj4+PiArICAgICAgICBmb3IgKCBwID0g
dmFsOyBwIDwgKHZhbCArIHZhbF9sZW4pOyBwICs9IChzdHJsZW4ocCkgKyAxKSApDQo+Pj4+IA0K
Pj4+PiB3aGF0IGd1YXJhbnRlZXMgdXMgdGhhdCBwIHdpbGwgYmUgbnVsbCB0ZXJtaW5hdGVkLCBp
ZiBhIG1hbGZvcm1lZCBvdmVybGF5DQo+Pj4+IGlzIHBhc3NlZCB0aGlzIHN0cmxlbiBjYW4gcmVh
ZCBwYXN0IHRoZSBzdHJpbmcsIHdlIGNhbiB1c2Ugc3RybmxlbiBoYXZpbmcgYXMNCj4+Pj4gdXBw
ZXIgYm91bmQgYSBjb3VudGVyPXZhbF9sZW4/IGRlY3JlYXNpbmcgY291bnRlciBlYWNoIGl0ZXJh
dGlvbi4NCj4+Pj4gDQo+Pj4+IE9yIGRvIHlvdSB0aGluayBpdCBjYW4gbmV2ZXIgaGFwcGVuPw0K
Pj4+IEluIHRoZW9yeSBpdCBjYW4gaGFwcGVuLCBpbiBwcmFjdGljZSB0aGlzIGlzIHNvbWV0aGlu
ZyBub3QgdXN1YWxseSB0YWtlbiBpbnRvDQo+Pj4gYWNjb3VudC4gQnV0IHdlIGNhbiBzdXJlbHkg
c3RheSBvbiB0aGUgZGVmZW5zaXZlIHNpZGUgYW5kIGRvIGEgc2luZ2xlIGNoZWNrDQo+Pj4gcmln
aHQgYWZ0ZXIgZmR0X2dldHByb3BfYnlfb2Zmc2V0IHRvIGNhdGNoIG5vdC1OVUwgdGVybWluYXRl
ZCBzdHJpbmdsaXN0Og0KPj4+IGlmICggIXZhbCB8fCAhdmFsX2xlbiB8fCB2YWxbdmFsX2xlbiAt
IDFdICE9ICdcMCcgKQ0KPj4gDQo+PiBPaywgZG8gd2UgYWxzbyB3YW50IHRvIHByaW50IGEgd2Fy
bmluZyBpbiBjYXNlIG9mIG1hbGZvcm1lZCBwcm9wZXJ0aWVzIGluc3RlYWQNCj4+IG9mIGlnbm9y
aW5nIGFuZCBjb250aW51ZT8NCj4gVGhhdCdzIHJlYWxseSBhIG1hdHRlciBvZiB0YXN0ZS4gSSB3
b3VsZCBub3QgZG8gaXQgdW5sZXNzIHlvdSByZWFsbHkgd2FudCB0by4NCg0KSeKAmWxsIGxlYXZl
IHRoaXMgdG8gdGhlIG90aGVyIG1haW50YWluZXIsIHdpdGggdGhlIGZpeCBhYm92ZToNCg0KUmV2
aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo=

