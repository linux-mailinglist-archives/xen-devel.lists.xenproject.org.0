Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI5yMCQzhmneKQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:29:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A58101DFE
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:29:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223759.1531157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQZX-0000Dp-Vl; Fri, 06 Feb 2026 18:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223759.1531157; Fri, 06 Feb 2026 18:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQZX-0000Bs-St; Fri, 06 Feb 2026 18:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1223759;
 Fri, 06 Feb 2026 18:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voQZV-0000Bm-Tv
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 18:28:50 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ed83ec-0389-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 19:28:43 +0100 (CET)
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IOFEH017501
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 18:28:41 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c4baykurm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 18:28:41 +0000 (GMT)
Received: from CH2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:610:50::22)
 by SA1PR16MB6504.namprd16.prod.outlook.com (2603:10b6:806:3eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 18:28:37 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::f9) by CH2PR16CA0012.outlook.office365.com
 (2603:10b6:610:50::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 18:28:20 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 18:28:36 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616I59sE1841430
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 13:28:35 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c218c6bab-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 13:28:35 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id oQZFvzUVxlOqboQZGvI18E; Fri, 06 Feb 2026 18:28:35 +0000
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
X-Inumbo-ID: a9ed83ec-0389-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=isu3H6ItSuU3iL0v5qYuL7PsHtP
	L9FGISgFy+2hK2S4=; b=ijF+HfJXdcKptn+rpTbJHF6cvlaEZeLW5JsdsvkleHp
	XBfOzl0Kd8h+hJWsOKcaa/ycZQN6M4bM8EA6oUGTYADXJAWNvSN8RX6d/DLYAdqD
	W4W1Joz/w4nSBwpX7V0ykmShvSiJ6Z7MLhs0ra7jZaiVjJz+9Q6HguPum7Y6M9pu
	WPdHN34sMXwMkql/qkQnlDecmo4NGaqcjce4nKFJB0OuuO3PP+QDzWStbO4Efm6P
	vivnhHw2r1JHhybRWOhG70HVKJ9Ef6nh/LB7kxmcyJ6uyBUGmbGGVDklK5DUjNQ0
	zXTO8txjiPbHjMGr7ihVpLl9M8ySdMxM813cXQNwYQw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiVfjd04WdJ+PdGSo+5iwkSJDGRdBqNJupHYGhq3bbNrhjNMutp/HLvP1DGWswbli+GM700miwjaajgmc/rh3yZ8JVQJwD2ZZHhej1BYP1rgRwtpywtIsoCWDIpQsCNQzEIFyWCjNzFV5DmqsKCJLpxXASKj0V6yl4QK8mTEzVi5cRI83lx50r7RwF1nEhLyTLcLB/lI5X5SezaWijMniabWNOm21VqkVP/VJxD4tUCNpq2RuOeKNAHar35NmyJiUqM5BocySJFBsvF73uPEf/Sjd+lkKbfTCONNN5yA0JFFHPInlG7omRYkW45dSPI5Jlpv0Stghnt685A1oWCvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isu3H6ItSuU3iL0v5qYuL7PsHtPL9FGISgFy+2hK2S4=;
 b=Z+bNVdgRtb6lyqrvdcgUE8XUYyWtJwOTHpKttIY4ThUuCECwNV+32fCjVnL5IziG4IihjncdkikFzE3VXmEZAn+A5UHWMW5HMYrI6+0xw57ezKSjuKBHixLhqBI3R+djSaJZ7mQZDY031gcLaYwoUXihxowAAzgcEVq5lsgZksxhd7DYVJTbWeqKz5BE1V8+GVYdB72hAOdJLCT3/i3D3mTCgbDZL8g3JSpTRFGUyY2UWs/H6ui2GHoiXoGbWaO2mnavngRPZYbnBS9xz9ThgHuUxetsCvIijjKxKDLmIDe+IIJiCiMCw020W8Al214jg1+HbPpgNFVT32Ak0fk8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isu3H6ItSuU3iL0v5qYuL7PsHtPL9FGISgFy+2hK2S4=;
 b=HEzrIrae6rv5GXCR8S1ZGM7E4SPWJ/nvgjdrdLk19NGM0hOQi8SM5O7nYUryBwCKNyKyd7gdWzI694jcAdPfx3+Q5R0G7AubUO0xjPBEBdA4BaGsF+fWKnE3N9JRTHvYQwR7nIfeEfEHD2j/C2KAH2aTcU8glA+WraXHED2trTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=isu3H6ItSuU3iL0v5qYuL7PsHtPL9FGISgFy+2hK2S4=; b=DajHhIcBQHXH
	fo+fzZ3Qs5NNXOmADnfW99wf4V62+57u9atLn5/ZPuQYCMUM9iruF0bmPsgEvZLj
	DeSbvZp+O/VVrgZZL/eLJzC163k70cwLJFp2umcJXA0Hf44GXyvttIGU6CxfV5mo
	z8xgGHd+tgGOODhPdke15U4frgs9Zv1aJKWsO6xWYgqmsuRkXWvutyM+BNzPnqDF
	vYejSZ3EJBJfrcSHPcVZfvyb/ZyoFxIRIAkTvCbJnQ2aq532NJzzQAqyShnymkOi
	q4kcwdRRZ+0WzAwGwE8e3/IGauX+zh7+hcQN1lCbpuvZ07K98gGS5UIcVTGlm2Oz
	EzxhSglxgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=isu3H6ItSuU3iL0v5qYu
	L7PsHtPL9FGISgFy+2hK2S4=; b=P8Y2B6cDLAo+cLuNM6E3acGt1UDHMK42LnAO
	1qlXc+EIoIEWKomBYI4h84e+CFLFAt1TACQDJJHpFYICzXBMENRI5MD1qaDamhhs
	1qCH/erpRmOCN3KIrKW/TOVDs6Go5fHdyox8HjfTeNXFROqMK8DbKaqd1UHbEtfz
	yn8+soc03ddMBohjAN4TL0bArnVrnu8cSKA7QW2PoaZ+bwOD5OXML0eyGybpbQo6
	0HhKpquTSG55fH7deZIHqLQc0v1TwtI0eZvY3ecCyxwnj8wxzUhMMCZlzs91kCpK
	49fZIoQOmo8lqTNYq+LJClk28bd3rvkJQnk22V5tbvZJp8gz9w==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oQZFvzUVxlOqboQZGvI18E
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 6 Feb 2026 10:28:33 -0800
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com, jason.andryuk@amd.com
Subject: Re: [PATCH] x86/cpufreq: Add Kconfig option for CPU frequency scaling
Message-ID: <aYYy0fHRX+gpHSkA@kraken>
References: <20260206013222.4081160-1-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206013222.4081160-1-stefano.stabellini@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060136
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|SA1PR16MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: baf4ceb5-2e45-4da7-1a50-08de65ad8ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9C78pw9bw+UvIxqmnfIS6ZcPxHDdwpIiEp/VFPXOWsSshWPzhAgLzk4lGRqk?=
 =?us-ascii?Q?9nhIKwB6wZdNWgq638QyrsE7nJAhIu4Fbf0v2D7jR4tD8H5wlXidu+VGqC1p?=
 =?us-ascii?Q?wirxo9a2VdOJZOvU7RocEEBXqmp0bZR7xoCXA0nDhLNRx6IYcomtV776NP8N?=
 =?us-ascii?Q?PNwTBYqNm/rCdT8x1wGQHR50pyCMdcOEhKF2GqgU5B9i7Clb1PGKCy0sBxPq?=
 =?us-ascii?Q?95sbb+s7UWl2J/uWSTxSt1WbXAiI+21TFyBynKXOTdheyqN5qcBDtm9H19qB?=
 =?us-ascii?Q?TSBzpqZOamd6TucGD0szFJKN7nxYa+VqNLEWFQ+26g7QgZtU/ugB+gJSGKE/?=
 =?us-ascii?Q?kOftN9jaL9Vgpij8gJgQ6lkFdT6/+w+ZpZPWFRQ0FBTeKRQ7EB4s+Z4FIUJN?=
 =?us-ascii?Q?oufeOQysqb3pVL9jYrwS/wEgx5Rzc06g/WfEJ+IxEiAoEaTdEr9GGWzBFv65?=
 =?us-ascii?Q?MYOJjQqj+bNG4BbJBi3sJvtg5G2jYrNgMK2ijW2NqhONkacjelyQgh+8WjUS?=
 =?us-ascii?Q?O4zEcPuO0GGSKCIhEP9UYY4KRRJeoQwfVxjfWDKWOsYEWspPLr7qNccEqNQP?=
 =?us-ascii?Q?YxzwgXha91j5WMC7W++o2ThYp0rnhCrGgGiUq4lL/9K3eowBaaEEFVLJ4S4W?=
 =?us-ascii?Q?qkqBhdmhe7IsPYDqhat9eoJ4mjnDOSPfXmg1y9eBjNEOyn/Ee/MdfwU87eh1?=
 =?us-ascii?Q?QDkQ5VjCwXeSBzYghtlWVhPBj+7/w4S2txjpv5DWGzPKysOWqjf/yTTufES2?=
 =?us-ascii?Q?ID+LrkE6PQzQtH4/ag7+efdhJmh43RoPVINaHpMaPcEvj22L74ydMZkuKgVV?=
 =?us-ascii?Q?JwACkKSLilig91J3oN6OiroI8dp3GGvA91GsDlS5t4jbdZScIeyDZpyXaqO/?=
 =?us-ascii?Q?DzhGh0jysjCQsqBSvwaFkpyX4Nvd7xpajWwx0gfRZ8hn86BwewBtNgL32h6O?=
 =?us-ascii?Q?LrBaaEFd8M8eJIS/XVTvyl8wzWb4Li9Hnl4vrn6o5+Yk112Gp/vPwG+/YJuS?=
 =?us-ascii?Q?PzPNaoB0fP7P+/T7PqgrTL+pXgOz/G2uvYtwOAEIm4v7VgZBwK2C6bdxMVfc?=
 =?us-ascii?Q?4/L86jaEHxYW2c9WVUTxPbmIuZSjspEpPMO7/eOx7XbeeOI/B+fPrlFW7R5a?=
 =?us-ascii?Q?o2dy02B0ne8wTUWlsxGiNXYj/dMWDIWu2WfKc1Pv6yVBhzGarvnPtcDocruB?=
 =?us-ascii?Q?uAAFUv1SQccggBvXLkfHrh1X0XiZIwfqkFz/F2IzgW3UJbqP5BD4ab7BRstI?=
 =?us-ascii?Q?gl1YLQJM1NzHGoHVTHlBSzb2bCFQlQBwr146HQs6EW74/IXrens7hX1KFMYY?=
 =?us-ascii?Q?D9jwPNzvbbxR6O5l2axh7PXjR5ZyDLXkMU2N5mRMzSalgak1saH8b7lonCft?=
 =?us-ascii?Q?sJsQeabv6PogD90PEzTAQEqfLm9OuvNHf3bsZ7nf2ZSdHBtzjdfXk5uw7naZ?=
 =?us-ascii?Q?FM6G44qHS/JCstgn1twVQWgyZjoLB0RITm1aExfTI3UfX8YNg/3ucghCaddU?=
 =?us-ascii?Q?tcqxTRxsmEt9RrT2wYdV3Tbl8AoZAt4SSevqV3TXW4X2tiBx9bF2itQLQZCq?=
 =?us-ascii?Q?2y7bg+j3wCsfaJCAl5W6ZUS+Pg9FMzgBH4z/4FQ7yXDiq7BECn4FNAp++TEI?=
 =?us-ascii?Q?zRK0cbCRmW6FcjqbUaYb9qGdR+qTlteOncNhfCIWkeSa0xgEV7B6lTqMddYy?=
 =?us-ascii?Q?SuDyZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w4ExBqCmmEvWYdaQ7ezzmqulSnhyIq6FT52UafSZAmhwHmF3kLRjpj0c4mR4OhsjLK94QEi8LTLNqG5DgAVKJZgtkRqfqHMfIpmdCikiWNO+4VIu+qmKombP/nFrnfpl5VsSgC+81bRvqCcfaoh34SA4WiqFR+/jrcqQUhJwtWOw+Ymd5CLBu05cKETXSP6A4AWVlhlLnRocFEJalOVOlZaOPN45+uSeZNpnfqO3XPs1zbkAQAdRljJYzpu/CU7LaCMQ6/q1C01sg5k/yTGvtFINDx6OC85D2CIWKrMNh2nOxOeTux592nCSf+7MMKSe2S24Zg7LJf4puopxO24kb+TbhzJp7CGUYUZ4NoIaA3Ited/Je9LiIrz/mFEPkIZ7udzYHHUDBA+4h1t4LJmvIWfz4yCjIav5yKoHHrgYdi/fpUW0L3ECJLrtE771u3Ns
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DkZLyZp1fEn/jZmE90c0XDJgo62KWSmd3h0mTvUBeX5I24EsfothiMbtuBLfvAZRX0lbmRXzWLDTxhi6bdBV4vUmzzy7Gb8rNnkjOvUwC3GaBgFSlO+S9/vqfYKfnwKAfxYsm191xzsKWO7ohpZEF8VPFtzWfbW6C0l4cj4wJTlwyki/70HvtrbS65xEjzhneCBicD5uO8B1Vcum+JLIxGtAa0bYU84uxYA4dIcP81b2lwnKstGzI9NXUh7c3RXP7TuYS2zYl2WaVsdyH2ogQ5lZmkKUo3HHma+ZQAJlJQqqKc6VAAlQc0XQu9isBQaOVlP2DLZCmXi5s25nnR2L26d02pRxJNowwMFSbuMGKnRY36W6QB3EmFCHBo8AC5R8crwcLkciwju8tX9JLktmwOizYcsCMTKGrc2f4ydMz1o3G3fS/zBpqe8aaE8pEDY6sPMdlyx6XmJ2AzGgXFWyVE3Rm347hXDf/ZlbpISE5xQ0YEZ1HvjhZc0F6Tk2PZm/JBE+HQSDLxWofUlpD9SQKueXWAROcyHDVr3zYeDOyfuJWZrxE1UVN6Rdc3A8m1g2AfmjtwodA/Ud64aC/rY5PTD/MxUMEMLoyQtPc/mTa9LjGuBlZph9/UckMCcfOaMG
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:28:36.5497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf4ceb5-2e45-4da7-1a50-08de65ad8ae7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6504
X-Proofpoint-GUID: d3zm9WobT4T_NyHFJHPsTsqwNxS3Vb4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEzNSBTYWx0ZWRfXxYoB9O7me2no LV/o066CUEDzzLQEQhTZG3VKYob8huyptc5b5UbQ88C+Y7Fk9LkTtqKU71VfdtlwWyJ1qIeS76y Qxdi362k0cqcsxUHmwLiouK9YXXsR0c+fRJM1llh1plV1+Aq84d9+a428lXMfuIGHZBhyOA8gRZ
 WDvD1k0f1VNEzpPADbyA7x8GXEL8DnaOALV0mur08OijO2sJgZDqZd2GvxgCl9WQUmb4Lgu7rBz syGzqcOsSQy2NEGViIROmp3k3aZiwUzL799Rsq+oYno8zqBMaiX29UqQZk78JwSG8BkQJ/8TWDd +ifNaXTp6H06c3Ss3w50prSoUJ6qZ+Zjr1mHReTaGAbpvqa8pDme4/Pm5FB5osEmdv+r4X/qGOy
 nrOmC3l3LdLc/BVdY32kJJRDwBjE4/7FouhbSMqsn9OljeJf7jb09eA12g6OQuZiWepMaR7JHiQ Ot1DnxppYoQy+R6VmtQ==
X-Proofpoint-ORIG-GUID: d3zm9WobT4T_NyHFJHPsTsqwNxS3Vb4c
X-Authority-Analysis: v=2.4 cv=Y5P1cxeN c=1 sm=1 tr=0 ts=698632d9 cx=c_pps a=KbXMGX1SJVu0lhZGOc8PIA==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=dEE_NiS0NobiUu1PXT0A:9 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 15A58101DFE
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:32:22PM -0800, Stefano Stabellini wrote:
> Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
> disabled at build time. When disabled, this removes cpufreq code
> from the build.
> 
> Add stubs where necessary.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

