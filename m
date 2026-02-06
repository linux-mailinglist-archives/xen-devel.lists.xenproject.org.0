Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA0eHjJOhmkxLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE4103164
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223849.1531213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNk-00080o-NB; Fri, 06 Feb 2026 20:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223849.1531213; Fri, 06 Feb 2026 20:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNk-0007vb-Hm; Fri, 06 Feb 2026 20:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1223849;
 Fri, 06 Feb 2026 20:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNh-0007sX-Rh
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:46 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id decd5cf9-0399-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 21:24:44 +0100 (CET)
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 616IOEjL009130
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 12:24:42 -0800
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013007.outbound.protection.outlook.com
 [40.93.201.7])
 by m0482515.ppops.net (PPS) with ESMTPS id 4c5dukdd30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 12:24:42 -0800 (PST)
Received: from PH7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::22)
 by LV3PR16MB6645.namprd16.prod.outlook.com (2603:10b6:408:270::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 20:24:38 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::e3) by PH7P220CA0005.outlook.office365.com
 (2603:10b6:510:326::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 20:24:35 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 20:24:36 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616Hl3bX1841426
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:36 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c218c6fad-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:35 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id oSNWv5ORZlOqboSNWvNL7L; Fri, 06 Feb 2026 20:24:35 +0000
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
X-Inumbo-ID: decd5cf9-0399-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=W0z
	vrbxd65Dho5s7fjUyTHQ6fvgLtTPnG+rL6EKOBJI=; b=Es4wwtubcVdR92h6Rx7
	PXy4oJaxmWMOGrQWYrpbDng9scVOEWs0J39C03q9Nd8f80AzDAwtYQAYgx7Kij0v
	bnmuSxV/xYJnaEkwOzEgZXR/b3/MpZUOxU1iYnvxSjf2B0p7eA9F+M+3R4rXZslx
	fGFrBkvLEc8LQagQHKKum/ecJF0mWt5ijSx0+A8YUNiJVhdpu3qI3LTpqexr/UVO
	8VbPaJ2l+MDLYW0gIY9POTCr4kd6H/LURQFKrKum+zkm5uxpYHilobIldt6nr7kH
	RMgGUqOT/m3sI/7q6GNDveoAqgt+UdD2dCgEJ4CyUmqrXHfiBUrjPwuLTN4j/Urp
	1Lg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqqAlia7aIux2IAqssNBexRV0faNWi2XQX3YapLmKja6sKeiScBorohIDdIh8OJclapCuyjjm/G6+XEVjfUX1uXfrKEwkQLLS2Bhv3dO2zAM331gFl4T8K8QwP49TyJnATbkL+uQpSp3fD3HNcAiuMAcBxdwbuKTRAnZkhfpFfE3UbOx/kQuL2F422BK2qTjW2BhnEFzjAVrcBcywntiKL0dWBA7E935hfsFJmQbNawU/VN2C0AbrM5Cx8sW5CxacaIuFy2PMEgb9dtG0heoFnaQHxM/tLPpa7UbPjPOUuH01GXMiUYsigaZkB/CZcnehF7LrkJ8CMYoRReGcei0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0zvrbxd65Dho5s7fjUyTHQ6fvgLtTPnG+rL6EKOBJI=;
 b=c89xKPemlmCyE7i8GJFVpxbzFgWlRJLpBt3xIdVV3ftEscBPURzf5qU68wQEK96DomlIC/y2V5ybYeJDrJeIzW/f4pBah+bbHFAdZpBUpW6O2Tz8NwC7bN0dNXWLBIpbQA/oXkk8tR0qX4vOcXDFpGQVmtFG0wrH/mefOOY4fSYcig6TmjeAAGdVOyeIGo1ZqF6sFRLM9HHBpQWq9AbIt0RRka5KGlDlCb/G+HVbTG2qqNaVmgOAN7EdClM8uPympCnJaHE/elm6wtkiA71NeoqtVODe5tihiHi+MKmAyqF2gD+InW6rNkhTh5FcR3R4GIArDQocbJRDVoj0XKLp1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0zvrbxd65Dho5s7fjUyTHQ6fvgLtTPnG+rL6EKOBJI=;
 b=F5+KwsrgtLTHHJZbuL2i47JSJgWcr+dhZKLtz2rkIh6j6JnWOtxyH6QiqYrzbzbaMZ/nIVQLIw2uP4i6UFPRERKBP6m2fVzv3WsBm80W97NFUsuoTRr52re8s13taCi7L+0lE2FHjtFdMEgs6yYjqBVNjHZfUIhgusuKxS844zQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=W0zvrbxd65Dho5s7fjUyTHQ6fvgLtTPnG+rL6EKOBJI=; b=
	RGiBunbeCNOcaJi/N2H/a+29Ie20agAJgrXeyH6cfUMCDCKfDc5wyv8mxd0OS42m
	wfSBmMd9apIArO7wNuzyLyu7chv2A+JhIAwyo2CxVBvgEZHN1+zXcs40fCeswvTb
	DEPKocZt7YHGwx+2qpJrTW5GQY3DO8B8nHnVK8bx7lNJI2EL1YjlKYqQvdOfHZHP
	RmMAxSmHG0zb11uwFvpa9guDB+qyPHSdwoZVD9N3Y2gEte+HhK3CyWltdcYpgFuc
	J/+yNLLLahSOA1BH+wzllXviRqrS4bwInuu76r1xNYiKq8cMijhj1ULPpBVxRl45
	h9N53u0lQoAhMj32w+LnwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=W0zvrbx
	d65Dho5s7fjUyTHQ6fvgLtTPnG+rL6EKOBJI=; b=nQfv9vEoevjWH9QqTwTa9gh
	okRKapMOwJNmUNJ68UXJ1ynYyRL64o9MKY6/kFDnz8lFBduKaL791cY7C+I+elR7
	O+bGGc+6ibVwj4s+9IRAltGAWTVIo5q+YEPjmlYw78TLR9hyxu1P8Wt4fWdH7yb4
	GbPGTWzru97CszngDi2fI6dfzEf/V1tenm8gWFT71PGylxOl8gpeuaEFqBuVGtXE
	k997xDjQhmOwB0w0pAn33eTbWBoA+HbrrfKQK3HUf5wospZ4rRqC5OweBCQZt/lW
	ilC6T6eCVVDP/rss3x/lWmM1M3iSb7m2TrpeNhmjMqQsLdggnay1Ov5u1qyzI3Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNWv5ORZlOqboSNWvNL7L
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 3/7] xen/console: add build-time rate-limiting controls
Date: Fri,  6 Feb 2026 12:24:20 -0800
Message-ID: <20260206202424.2054758-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206202424.2054758-1-dmukhin@ford.com>
References: <20260206202424.2054758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|LV3PR16MB6645:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6b88f9d-941b-412d-d2e2-08de65bdbf6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7CGNhXAXFncLRhRSN6JCmzGeGPGxZ4WOGt3pK5wUw4NhdZq9K2eccVVq60sj?=
 =?us-ascii?Q?s2bwnV+i6jgBiN/vuerW8xPAAAFLU67DMj4e2RQTb6spe2UhSBNBlSfeOSwC?=
 =?us-ascii?Q?f30zF19bxZlK+g2S71imM0V20Uc+yyNiDGPJVbiwPVbwKaJMsGUDe2PrP3Ek?=
 =?us-ascii?Q?vw4oDyRw+2cgnKUJEgjrBgU3F+M1GjG2poY+6pxEwR/YpbyU1BZ5UDrTVSxc?=
 =?us-ascii?Q?tVBKa/YlF1u2yAk4nVd+Rto/ZQnzJMgPkgex2eWXjUjxu9jFugPBo8xEOjql?=
 =?us-ascii?Q?860d+az//hVYRCxLjhKZD0PctIePAN6Z8onsbHayU+UaZT3jpi0zny+BzT54?=
 =?us-ascii?Q?31Umgw+zvFIKbXSmYegY44CADl0J3+L6tKmOwv1najyLLMaLfs26T35Uq5ZS?=
 =?us-ascii?Q?vmtQjwCuhzJ9p4rIJBDF47KBfnlkTz97NJlnhwlbUzL5OkOazfC3mQIVs2hm?=
 =?us-ascii?Q?qOkgSR59Wsan1vZm5wttJU0inzSwZgcidBkPFUk/6T/BX4CWozwo0EQPuDaj?=
 =?us-ascii?Q?NjJOjyrs8WsdgJqqIq7nk98CBtXQE6fs/iQwoGhf/GZC6mhdX3puAdPI2NGR?=
 =?us-ascii?Q?VKJ1j2BrppEFO5gKeZ46R3KtIC80tmZLicZPy75uu5OK/rszNc4T+1hExVGV?=
 =?us-ascii?Q?GVl3UKexwacYc3+AT9k3yfAh5U8rwtLh6i7ypNCBjew3JawavBbaO9n2vTgp?=
 =?us-ascii?Q?hXiu81fUhYZNdqo+OD84xJ6wY/zntI3M3dPMQCbqcR71F7DcBBF9OX3lO+yM?=
 =?us-ascii?Q?tQIzgC5wJuqGsYV9P+YQEsB78WTi/JHy05ucBZilgXPc7PXPLCr3ZTkcD6Ci?=
 =?us-ascii?Q?Zb/MKOGR2tahm6Kx1/fLuSnrmydvp+hQyIlWi0K5AYFyqeoudO1s54MBo17L?=
 =?us-ascii?Q?4iJSF7LnYPgXT5fbOZZo49/YDsKLMGPiIQ/afabo72AWi5att/VwoSsdP4GK?=
 =?us-ascii?Q?hhpMN3qEGuHslBqVT4EIN7+LD0igQ9yycVIMid467gp1rDMKiVlKmDZq/kH6?=
 =?us-ascii?Q?/tN12D2SacQfMG5lTLn5CRn24X7SQYyqjspB5hsrB8yuP3vDPFQH8e8ZvgrW?=
 =?us-ascii?Q?4iaK9NyDek8x97P8iqw1cCIFZ9MnPvxCgzSQLXDlXCitjI6bGUUcasZNl+Gc?=
 =?us-ascii?Q?lLUvhIz4bD2ld1G1EPXkGDse6dRPq4hU2CQD9F50+sB284HVnNYrJrzGnzQW?=
 =?us-ascii?Q?JZFWiNtHkaVZqNVi1GUGf5QrLG2Fi27+9UAc94zNzgRQWrqI++b7P/wINan7?=
 =?us-ascii?Q?X7KABLmXy9cHHBi8+MCJphn/uu+kUQDrHrIrQZrcHWAc4Jvo1K+EsaMb9bQ2?=
 =?us-ascii?Q?YjUuq4n7EXjODJq7L4qMHpISY+YXxpb9NE4q8LfyXab7gGGkMTnn3pefggcg?=
 =?us-ascii?Q?6ITJgbQVK+STNVtSVVWf2H/CVeZHJOJCtf7qAG5GyC3ImBwGZfcJtOkTqY5e?=
 =?us-ascii?Q?0p0BZdDsS97Up1axZqJgcliJ63qzvJtyqMApnkS310v6zS1qzW/eDS45514P?=
 =?us-ascii?Q?Ef+0iOKl5xpVuDK2fW46vrMy7/B9dIvJ2XVSQLmKBWr+79908T7KE3yTtTfj?=
 =?us-ascii?Q?kWj9kzIhnzoUCzXlBNJKtRU9K7M5huOLdhxAaNnVUauRzyB4bIrMQHufwKct?=
 =?us-ascii?Q?1yzgtK6X8NtsuCQZ22maE/ktJzQ7pWi78gSGGnTxpQtH4SYgOuByIqmHs1+O?=
 =?us-ascii?Q?WbdloA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	di5kvvBBzcPACO6VpnsNcIU9D61pCczfvurASQd+80V8IyYFdaNK9nYazvd2i1wFW0Q6Q0GZn1XIBHb8XrWQPGh8QBBXjXfU5cZDMTssYtKmGKo26NEFUZ1pG++iS+fR4Ym6HHV7XDFUVvQdjIbne5rtTniQkQYkn0XG9wTi0CC9Hf9uZCWO+5gT5I00Fv9Ga//0KAqc395EQLVHywBJi075mZefNMEErYxndiuAjmspXBrmHrEb9B05sup66NS0TPnJzcFRT+UOOXWCJzk4SxKNXx1/3qwBzGXTcXSKL6kaVGW1TB+pOM3YL9n1QLzfeEjzS3cAVzPyten7MyKpmnhZuhnFc7njzURnNxrvSC8FLohYGPkYMAODvJZ6K3deE8qdu0w5UpLbdu6Ph+RntHjZ+zWDD2xj5NwINHGTWU0CF9c3k2n1o1msC9Snb/aU
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z7wCFLqfnbELEpZjoKAggqWmwOWAVuDIj77zUloA2k5nQ4j3umDg+N8r9eTSH9zotB203JpUKmOkpXq3sed9DSrN/acgZw5VE6tTDT12VtmTAB4WkXyUGfaFEyi0bXtZDedAT1bjxZibXld9SIulj/lSf4v2TI6NcfSmgbtbMEhUXLxGThxjm8gWNK2lxUokuFUx5W5cG1CBsrjg4FegKDKwRn4sxYjtj/JC+nvpmXwp+0LjLNhyRvsc0DzJsyH1YCZy51NjoGE/Kp+Q+f3xuqHAQlgTcEjbnBu4mqhvW9qvt2xfJVWo98NVBlQCvObEAAYx8E1BwofpgRAIPi2jjpWapRZ6zGYhwGfIh6KRHd0LRrzsn98NrsKODGDmInDgrd2PReXblPkPYFRJ/wbhbWS177WVIkyDNeESeJmRd1ovABTJVSts+qIUiYcK/3nYBMZ2FnxooyqaXJ1m9F+gBnu8XMydIKohIaekUDw3BgZ8pTlGvnQmi5Uq1fs+ZA5FyzFkXMZRvSnbGrVPG/1gtKWFv1g/TWKwn2Du7BEnQ0RPCn9gRFQtXR+5cOpeaCeoBfI3HQflqNSr0dQADW1RZ7O98kTwUqO/48Iim9cBe47nImS76rq4o+i3BGJkM+x2
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:36.5858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b88f9d-941b-412d-d2e2-08de65bdbf6a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6645
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX+0enZNh7+HIy wvnmjazMgI368LI0cpa2wb7uv7D7yY5h3qRykbjscm4MYuylfDT9GOEQUP2cmUlK0Hp+ts0pwhY H275tdP2ybZe9Ga1I6K5ovExeH+pyrvqpPrVItdyupIv85W5zm6BeKrgGptoX4AZCvLOmW89wzV
 rR6xS0gkJtINXMOiNVbpEX/0bb/hyNvYOwNH6OAKVQf/BhWXdVdZtRccxm/ODLqvH7YKVIaPYSn FnMwJoXnSEj/EmaPtdRRgIfxNAYxwkUAMoTvuzdARkeGbGHvklocWXHbU8NKcDvaunlu3Nqvp91 mdOgK8e2FLqNaBoIQZWuJAseob+/Vbzo/GiAb1yGvGh0DiPo7591ANR7N6F4gYSEVCQCm4BJ8LX
 ERPeihRdKy25NS0CjI8VT75Bst4TT/baPbvAMV1/MR0sz95sm2NuoViipJt9xxdZhn6CUAE5G4G 3Qa7/Twf1bduXIrGVHQ==
X-Proofpoint-GUID: H0Y_FYu_U2aUQTqVi3kQFZ9GCBySh6o9
X-Proofpoint-ORIG-GUID: H0Y_FYu_U2aUQTqVi3kQFZ9GCBySh6o9
X-Authority-Analysis: v=2.4 cv=B8m0EetM c=1 sm=1 tr=0 ts=69864e0a cx=c_pps a=PxTiP5NnQLoflLcDylFrfg==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=hm9gxtsbu_PkzfZFzYAA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060151
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
	NEURAL_HAM(-0.00)[-0.994];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email,ford.com:dkim,ford.com:mid]
X-Rspamd-Queue-Id: 14CE4103164
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
for configuring rate-limiting policy at the compile time.

Use symbols for global rate-limiting initialization in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 xen/drivers/char/Kconfig   | 25 +++++++++++++++++++++++++
 xen/drivers/char/console.c |  6 ++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 8e49a52c735b..98b117762a0c 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -103,3 +103,28 @@ config XHCI
 	  Enabling this option makes Xen use extra ~230KiB memory, even if XHCI UART
 	  is not selected.
 	  If you have an x86 based system with USB3, say Y.
+
+config PRINTK_RATELIMIT_MS
+	int "printk rate-limiting time window (milliseconds)"
+	default 5000
+	help
+	  Specifies the time window, in milliseconds, for rate-limited printk
+	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
+	  printed within this window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Rate-limited messages are those controlled by the `loglvl` and
+	  `guest_loglvl` command-line parameters.
+
+config PRINTK_RATELIMIT_BURST
+	int "printk rate-limited message burst size"
+	default 10
+	help
+	  Defines the maximum number of rate-limited printk messages that may be
+	  printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Rate-limited messages are those controlled by the `loglvl` and
+	  `guest_loglvl` command-line parameters.
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c4c92e3efa39..ec87ecb3e5a0 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1321,10 +1321,12 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
 }
 
 /* Minimum time in ms between messages */
-static const unsigned int printk_ratelimit_ms = 5 * 1000;
+static const unsigned int printk_ratelimit_ms =
+    CONFIG_PRINTK_RATELIMIT_MS;
 
 /* Number of messages we send before ratelimiting */
-static const unsigned int printk_ratelimit_burst = 10;
+static const unsigned int printk_ratelimit_burst =
+    CONFIG_PRINTK_RATELIMIT_BURST;
 
 bool printk_ratelimit(void)
 {
-- 
2.52.0


