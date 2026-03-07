Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN1nIfKTq2kSegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 07 Mar 2026 03:56:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD66229B42
	for <lists+xen-devel@lfdr.de>; Sat, 07 Mar 2026 03:56:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248393.1546486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyhpD-0002gO-Q5; Sat, 07 Mar 2026 02:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248393.1546486; Sat, 07 Mar 2026 02:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyhpD-0002eD-Ke; Sat, 07 Mar 2026 02:55:31 +0000
Received: by outflank-mailman (input) for mailman id 1248393;
 Sat, 07 Mar 2026 02:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AsXE=BH=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vyhpA-0002e7-W3
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2026 02:55:30 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1302d7e0-19d1-11f1-9ccf-f158ae23cfc8;
 Sat, 07 Mar 2026 03:55:19 +0100 (CET)
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 626K3NYc1670247
 for <xen-devel@lists.xenproject.org>; Fri, 6 Mar 2026 18:55:17 -0800
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
 by m0482515.ppops.net (PPS) with ESMTPS id 4cr0xundqf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 18:55:17 -0800 (PST)
Received: from DS7PR03CA0221.namprd03.prod.outlook.com (2603:10b6:5:3ba::16)
 by CO6PR16MB4258.namprd16.prod.outlook.com (2603:10b6:303:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Sat, 7 Mar
 2026 02:55:14 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:3ba:cafe::7c) by DS7PR03CA0221.outlook.office365.com
 (2603:10b6:5:3ba::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Sat,
 7 Mar 2026 02:55:13 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.0
 via Frontend Transport; Sat, 7 Mar 2026 02:55:12 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626MvtNs3430266
 for <xen-devel@lists.xenproject.org>; Fri, 6 Mar 2026 21:55:12 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4cqucss2r5-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 21:55:12 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id yhosv7PVAV4jQyhotv3fSK; Sat, 07 Mar 2026 02:55:12 +0000
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
X-Inumbo-ID: 1302d7e0-19d1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=gf/yYKG8HDzbk3g9D429cY3fp
	LWeKIBrGrZW8+ZjyEU=; b=odcXM5zFiiwACXwXH12prETVwgk6hysCC85MIGuBe
	5UMdkaTZlBrO0oN8nuISaCNBXsJAXq5iscX+9XjTB06AEN4Z+y7ZXZPv0AUWAo44
	xzgRO+iZrPQgLXFw9i4oxiS+ZQslJGC+JcdYJ/axdk2IGi7aLWt0j/kyzKqbWpm9
	fV0bfmE8qmSE8EfNkiJs2g5ktHalC6EY1cHFRZ+LD5ZxB134Mu66BHds4Y3boh+9
	28ECcKUTfL1ZyUBK3E/0MBUT1E4dM4CLZcGZ98K+DomMm/8u1LEhOOjjEzm8qC9A
	K//pKm+Y8cEuVC9v9WqZTUZhBvk16BZwZR35QKaQ6kgfA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVAg9+k+N/e8gWrUp44ZnfhOxWdqts4jww+W5VWmiAu/4M86rvsrUQ8rK9r8notiOu31hQ/pDbUzeH72OavGkAIK+s2VhlpfRGh8pDVXxNUIFMy86z1xAxzX9ee+PACxU7NNTIXeAalJf2Vx6dPhGMRaFX46asOMZNKLGIpH96PkKx1njXOSF6UOyNGiK4U2fs2bRUxmYxBoSc6qOGlaxxQC8rbO/ZlGa+DjK4Lyx+ARnVEAPGbFsYyOeWcMBED30iuwaIq6tHH3A0ocICyKXZ6szoVhdYb0qaM7C4wepqppLGY9vQQbc5i5QBRKmUFMlSnHCuKDVW0O0kZdytQN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf/yYKG8HDzbk3g9D429cY3fpLWeKIBrGrZW8+ZjyEU=;
 b=k3YPTOj1Olp1Pbr32Olcy1oURJaUQ7MlkxnNgbcNrObEfzjsIu2vUtDfFwTlZBZZTyAZIzUQLqj80Pr+Oy/uagrotdP4JXz8/qrdGWXN8xwIlUgWgEl3up7bqVVenFLDPjfkpR6vyOiSGYhxmoXWHJOgnQ/MKdUE4XcG4LFLsyW+wwoZ1Tz6B3HJAczOXawtiq3Kudh3wPZjb1nlXTRQmNRWjdA/Aaph+MRBsguqq2xWbUiX4N5BAxkS0eqTn785FF09mA/B0WBXw15UHgmZk1BOucOnne+glfpxb06KWhDdemsam7OrBAgH3BjEk1upB9ATkYOYf/a2BBIF6qFvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf/yYKG8HDzbk3g9D429cY3fpLWeKIBrGrZW8+ZjyEU=;
 b=M42B0z9lepaRgYsLToZUyrCSeHWPdAOf+R4FzBGRUoVly0asZxOSe0rJG/c3yNfle1kmmZmxHkZVYw6sCI3i6BtP3AHAzd4akpTEJNw++Gm7tJt5Qq3BCyCsCiyn+l5kb40worHi74dmwXEoUHLc00Vt743h/I2G+vJCsrnqUXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=gf/yYKG
	8HDzbk3g9D429cY3fpLWeKIBrGrZW8+ZjyEU=; b=Ob+vZZq642g95iKJklfTj4K
	prRtP6JWZq/3hi9VlZbUheIeTznuTZ89IZ90L40DB+M62ulMHLOSyyEQtNrE2Lrq
	Nk/2Q6aBREv8GMj2szUcv8mWXWvYggW+xh9Wzd/zZT+aPK6QA/1doU/2sfrGci5y
	FzJDfvNiv6BqTHpAwQNZ/up7q3KEOFA27XRQ3q8R/85yTnAOkKcwwwPkb9dDCkQb
	CqiA3+7peVDWqVxQH24v+d8cOz2pFUqTRsePAX7X2T3eFbxkihGASCUnZ5sxnbp4
	u93/7gwbyoGF5BheCGsdCbaTYenx7eWiIfKumAEY57uIp0I5/lI+/KZecjnvCpw=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=gf/yYKG8HDzbk3g9D429cY3fpLWeKIB
	rGrZW8+ZjyEU=; b=lNM82muanUQSi7Y1JhaLDuZkhl5N48nnptEh0Xl0kY1WFG3
	LGIfCBWQ0qvnKoygvjpJKqKGeTp6ImJ7cGjtH1Hs9Uxtd3THttnh/gFVizMI0SRQ
	JrdcQEdPtubrfs6ekTShWO+jRFcmr7sSCtmtdxB30BWSz/tzJgeFiRmte6AT/xnz
	N5qPr9GHRsg6+A19z7I8lSKv0yTBMBLBu7FtjTw322Pl/sPw2LFjbntL0f0pHga+
	VIXDkHW3fjkbn0Yj3pt+NtnLxSK7EndlFdCdVli6f/guLEQKML4b8yOZ7z8To+so
	tbR8lBfd3Sn9LUSAU+QzKlfKbiI+JQ/fxLBfCvg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: yhosv7PVAV4jQyhotv3fSK
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6] xen/domain: introduce DOMID_ANY
Date: Fri,  6 Mar 2026 18:54:52 -0800
Message-ID: <20260307025451.3148078-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_01,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603070025
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CO6PR16MB4258:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2185a8ed-e103-434a-dc15-08de7bf4f418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	m9nQSxcU9hoNf2TUWRWsG42EQuip0cX13uJak6eFhJQkaeiO6bx+Th3ZW2BnU3hyJ1bLRNv1ls9DP1ai7vwdhtgonACRu6eBikoJpDRPAL59MYtm6/2UQzY6wZ5b44Gn5DMD/RFE4mi2SAP9Y/C2COJ1efidDMfcmI/3jJXkUYJRkYSShq6tf6n9UDFcR7juOcIBg+bQncynBaSCThtymHiyL5GtSw6ITesc+y0V+svqnfbd0QPg5mtRvlIdla5uLJ+JF1SblJwGQGbVeNq9+eXNUtT+azHnp2jTax15CqYHPtewkjG2Btc/xWyfaplBW5Zj/E070tE9vrxT1zs+YMVYNGzCB6LIke8R2EE+HrrU/EQJUYYVj3At6mrqG+iCeu1OwIKhqrYwf4ArzECdSJtZq+KZepqsJ4G1Hmo82UjCgHR8v9HKsay9w/6wQFCWdbChbA85w0cTorjWUcEbUT8uKW4AEXBKL4aOqfrJhkZ8BpUhVVRn3qupwRCRbXZPHDQ8xJWiQ8lJpglAWUtZSdySAQckbHd2HZQHtE4/KOypCYIA/Bm9mQwv9Zfo67dk/1sPOt3lgoA2vU/zVcqa58QCxPqv3l5/BsbPuCPhDUN4ZiZ597gQ69RG1S/nZdN2nMq66DKcbEarNDNATwVGwYyiLNas63yh/QjeEV8fkAWYwriITKdZrjpJDYOKejgNX2fV9V/vVhuc+2cWf4vtc9yE9NIUEmY6IsLDTBF83dYPvEKf35O0ACKjIB+bjWxon1FhtV3GqBDYiWySEbkWmQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zHoKZXZPXarKSk6Y5Iqr8aia8jWASdtzS+3Z2K9/qUuQohPt4pO5HWd8MJRN8p6O2HQw5gz9iYmCG2llxk2Iwb0Fk309zrqjsdeAXU3N5LQ1d2cjIVdLonBBDVEAf2TcRMo9ABxTgVkMVEAOGsHEfgIq2PpkSbh8o94oPCOkL6f8c/e2zyrN0AvaMhxOrABBl3y1yjQqc/g1mHqckGw9TZmiG25rlRwNAnAFQKK3CsczR+6C+ifGA741682OP5iGU84bf+aAHE7YXZP+TX1Bvl8yQama2l7DQZJzISERdCgq0I63th0C/BHY/vQqbStupVH0FbZ8kMrnM2bkjQRJm4516dy11PSwdnCYNDxzD01/nZWLtASB2QO49j9+xeaROREfgzZeBABHEeMZxrOnzvGZz0rOx+R1/J7+tE8in8Y3DorVle9xWs807BZr9x9d
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HbqQqg8cTnHh49gnijR9Gh5n28gxpwBXbyC9aeecCEREaNfSk41G+XPjO6EUvvURm/jrQGRIkJ3gKNma3wUdBe6FL+OEa5jJkyEu5V7xGAYyolNTRISP8IzJKiQ2cEzAf2ptbTfm2nL0fBaO7kBwN+tn4nJ1fp6XbOiUG42n/DZQbcdKvtZLuUNHAiJSIHKqDzt2sJg/RaBPZpCD1C7I3DLrZSqBMsE3XFNyly0ZP97kNuQfUEPCuIyvs0JDW5D4nORUp+gBZJHnvCai7uzVfjSMzQNKTwB7LafOjJR9cvjIx8JU/qCWbVe4ui3iUCIzSyLUhAif32MINksDa5xhGgbLDWAOtFx9rupx8/twlcB1fvl3x9npKt25ppAvHHqe/la9kt5EPQhGq+MyZfcdis9RTk+V6/zJW1JGpb2gzlfgW8H1kV2URaeU9oWLNJxSqapQyajB/NW9qyvWFBDDQmEvnldDXrCVJkqE8IXpZNmj5XeAHeq3cseV/NK5JAgLLlg4Zzq7Yo/fV9Js/4b5rd46N/fqacxNyvDdvJRV7po0YOzZADE4nTecPi8hzUKVp9Aj+xNb5OKFaEDF0hQ/kty05kWbKUyBj/eIixcpvBl+kI+QN7p4j4mFdhWZQJjz
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 02:55:12.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2185a8ed-e103-434a-dc15-08de7bf4f418
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4258
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDAyNSBTYWx0ZWRfX3cOFhJB9wS4K
 s2RtWCgKjnoTeUVYyKgSi0wO/ufmSYqtnXHRxlx90g5XZTi2ApOgfrGHBTA3+g+jOe0c5nal3Mw
 4Kw1BxKVVwSRGZ9czpapkeS++1edzyGbnUkoNBS8ltJeZCXFviYLXcrP2FpKVMcjKriHXOk6NOK
 VWXTQOr3SoRMjXKMIWYj4Jbc+8aO1jsaWS5fQ4P/1Kl/tAmDFm+QnioCGRyyiBYiSt4RaM7Wrr8
 GGAT+gnnVeOqm0Jt+NsWjgVj0HdImcHbdK2t+yM4lW5ox21mX+XO2b+C1pXhijahweh0tMYxp/w
 3+PPuFtRJAUpckHifvgKmuQATbIcmI9P4zXd1AE66kULVRicyJ6nHetrv8wVz/xhJ6hMDyNrVzL
 /RO3+v7mY0hduHbPQyM7oJYcOMmOkfDiACZGQUVd7qEfW9z/76CpGSuv1Z0aUnUfpakJnSb4lBu
 C9UnpQk6dqe3QB9gfUA==
X-Proofpoint-ORIG-GUID: 2DXbRu_iQEBCbSm27YYvksPWBzzxElFg
X-Proofpoint-GUID: 2DXbRu_iQEBCbSm27YYvksPWBzzxElFg
X-Authority-Analysis: v=2.4 cv=OdWVzxTY c=1 sm=1 tr=0 ts=69ab9395 cx=c_pps
 a=uJxR2RjB/d5PFa0hjvWx4w==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Yq5XynenixoA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=Scr0WcHX4gzoYZdgL5MA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_01,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070025
X-Rspamd-Queue-Id: 2DD66229B42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,ford.com:email,ford.com:mid,gitlab.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

Add a new symbol DOMID_ANY to improve the readability of the code.

Update all relevant domid_alloc() call sites and harden the domid_alloc()
input value check.

Also, fix problem with passing invalid domain IDs in
XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
uses 0xffff as domain ID.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- fixed domain ID validity check in libxl__domain_make() 
- CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2368290952 
---
 tools/libs/light/libxl_create.c         |  6 ++++--
 tools/tests/domid/harness.h             |  1 +
 tools/tests/domid/test-domid.c          | 12 ++++++------
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/domctl.c                     |  3 +--
 xen/common/domid.c                      |  5 ++++-
 xen/include/public/xen.h                |  7 +++++++
 7 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index bfc9149096a3..79af2958d170 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -666,7 +666,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         }
 
         for (;;) {
-            uint32_t local_domid;
+            uint32_t local_domid = DOMID_INVALID;
             bool recent;
 
             if (info->domid == RANDOM_DOMID) {
@@ -681,8 +681,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                     continue;
 
                 local_domid = v;
+            } else if (libxl_domid_valid_guest(local_domid)) {
+                local_domid = info->domid;
             } else {
-                local_domid = info->domid; /* May not be valid */
+                local_domid = DOMID_ANY;
             }
 
             ret = xc_domain_create(ctx->xch, &local_domid, &create);
diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
index 17eb22a9a854..65da0d075a2b 100644
--- a/tools/tests/domid/harness.h
+++ b/tools/tests/domid/harness.h
@@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
 
 #define DOMID_FIRST_RESERVED            (100)
 #define DOMID_INVALID                   (101)
+#define DOMID_ANY                       (102)
 
 #endif /* _TEST_HARNESS_ */
 
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
index 5915c4699a5c..71cc4e7fd86d 100644
--- a/tools/tests/domid/test-domid.c
+++ b/tools/tests/domid/test-domid.c
@@ -41,20 +41,20 @@ int main(int argc, char **argv)
         domid_free(expected);
 
     /*
-     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
      * will never return the same ID.
      * NB: ID#0 is reserved and shall not be allocated by
-     * domid_alloc(DOMID_INVALID).
+     * domid_alloc(DOMID_ANY).
      */
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 3: expected %u allocated %u\n", expected, allocated);
     }
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == DOMID_INVALID,
                "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
     }
@@ -64,7 +64,7 @@ int main(int argc, char **argv)
         domid_free(expected);
     for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 5: expected %u allocated %u\n", expected, allocated);
     }
@@ -72,7 +72,7 @@ int main(int argc, char **argv)
     /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
     expected = DOMID_FIRST_RESERVED - 1;
     domid_free(DOMID_FIRST_RESERVED - 1);
-    allocated = domid_alloc(DOMID_INVALID);
+    allocated = domid_alloc(DOMID_ANY);
     verify(allocated == expected,
            "TEST 6: expected %u allocated %u\n", expected, allocated);
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..3c18dae5e625 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -852,7 +852,7 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        domid = domid_alloc(DOMID_INVALID);
+        domid = domid_alloc(DOMID_ANY);
         if ( domid == DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node));
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..b969f5ada6cc 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -409,8 +409,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_createdomain:
     {
-        /* NB: ID#0 is reserved, find the first suitable ID instead. */
-        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
+        domid_t domid = domid_alloc(op->domain);
 
         if ( domid == DOMID_INVALID )
         {
diff --git a/xen/common/domid.c b/xen/common/domid.c
index 2387ddb08300..b0258e477c1a 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
  * @param domid Domain ID hint:
  * - If an explicit domain ID is provided, verify its availability and use it
  *   if ID is not used;
- * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
+ * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
  *   starting from the last used ID. Implementation guarantees that two
  *   consecutive calls will never return the same ID. ID#0 is reserved for
  *   the first boot domain (currently, dom0) and excluded from the allocation
@@ -31,6 +31,9 @@ domid_t domid_alloc(domid_t domid)
 {
     static domid_t domid_last;
 
+    if ( domid >= DOMID_FIRST_RESERVED && domid != DOMID_ANY )
+        return DOMID_INVALID;
+
     spin_lock(&domid_lock);
 
     /* Exact match. */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e6315..f35a6f21f063 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_ANY is used to signal no specific domain ID requested.
+ * Handler should pick a valid ID, or handle it as a broadcast value
+ * depending on the context.
+ */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.53.0


