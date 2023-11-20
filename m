Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C438D7F15AC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636831.992561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55Fk-000547-2K; Mon, 20 Nov 2023 14:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636831.992561; Mon, 20 Nov 2023 14:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55Fj-00051Y-VK; Mon, 20 Nov 2023 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 636831;
 Mon, 20 Nov 2023 14:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSKs=HB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r55Fh-00043p-My
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:27:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc12067c-87b0-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:27:51 +0100 (CET)
Received: from AM6PR0502CA0063.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::40) by AM9PR08MB6035.eurprd08.prod.outlook.com
 (2603:10a6:20b:2d9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 14:27:48 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:56:cafe::ee) by AM6PR0502CA0063.outlook.office365.com
 (2603:10a6:20b:56::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26 via Frontend
 Transport; Mon, 20 Nov 2023 14:27:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Mon, 20 Nov 2023 14:27:47 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Mon, 20 Nov 2023 14:27:47 +0000
Received: from dad9a6a57cb3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDB0D67E-51CF-417A-924A-6975E86317D0.1; 
 Mon, 20 Nov 2023 14:27:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dad9a6a57cb3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Nov 2023 14:27:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB10356.eurprd08.prod.outlook.com (2603:10a6:150:d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 14:27:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 14:27:36 +0000
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
X-Inumbo-ID: fc12067c-87b0-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NU8QDb+bsviL8jjdPDRGTd1YhPUZUaT+4a1Bh3lmv0I4p/cEopz0CKH5WkEBmFKlxT5Yy/XG9SQLWDTxmQGGk1ZjSQTUGbL/PSLwoJhxtrPPBYQveTCyCBjzZkndowaSo93LRrCvrouQNLC/TEioTESub201oXQNSA9m9hqcTLHPVc9S7NJuKsqX+iQDicNRAHQ5oLXupo+vcSBEXV0d2UXgxncyCxTVPeJUH6pNkZOCWLmMM+Svdtrt1jwgyIg9r6M+QN1gl07KcqCrLZ0pFLykeBmDNYqGR9iaDjxNlyq3W6jhtEpct0jK3UxWGYDwdd0NQBwxX7az19A4TYZjbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJmh38ehQC9Pcj/51VUC4Ah9+U/3SWX1NyuDybmZXZc=;
 b=EtyM5de2ysTa5df8+P7ZzmJahWKS7i2rn2fQ7KjRdtf8TVmRMFIxWLIpMk0527OYMJbHGzk8gxj5JmmeAU9dwDuoZZCopuAy86gwhi3WepHnl4UNiSfWYBpdG1rTKbQ0zkLjl8fcNWKhI30kjDokrTwWFGuUzgHdaHwjNFbij+cJSJmp+rlV48yoGCmyFq/g2vUirqg4ByT8Wo0TN4rR1ljLAbUNIPgrpTiLqDKX8cmmiUv7YN8kOM3xEY8RMYKZkNTdntL5tR6OszVMCmuoVTJaOYp76woRXLLlJnrZ1Hm0iZUbclx9X88C6S7fSHphRmvIk37ikTk0TdXbTtqEnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJmh38ehQC9Pcj/51VUC4Ah9+U/3SWX1NyuDybmZXZc=;
 b=15r2Zyg2ZPNNNFkns7TY7ML3Eq5gb6pHcRh9Pegsea2/nYW2I1PF2hBlR1/8rVm2OI93LxeklTQt8QV/Bt8Ml9CPHCR5Yntdlmnmx7SL8ZCYUnFRzv7lVxE/cLV5x8z4bGBwRpKgDENiPQLkvDzpd9IP/9SVwgOnU2pbwxJpOOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87401bc26c0838dd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfyY9ZABOMRk2oCkSl32kXlekqkoqWdiiOTwPokwM4a0+nZXWqVZgKgjixZdPLxO3P6sT8B4Dp2Fh7k21RwskC0c8UDbMt9bJmfz1Xnm6pwF1/8NfZVPnxQHJiTFAHw6YZgUqFDDTHSSpw+81fMN+1c0g8SfUNudKBNJKhqCYjUGpjQYzcZAVfzthadZmKxf+v4kbMsXZmcAxXJMS5Jt3aODu6FeN/1WvIRTBcMk/S7mNDzjy4zy65B/pauj1qE0NbvPB3OUwSF1w6A/F1zO8PL/ATANGQf5MO2XvQPaT02Tz3mEgca5H3DXgvhIWwX5Qz/uAVWj8XCuhE7OmvHsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJmh38ehQC9Pcj/51VUC4Ah9+U/3SWX1NyuDybmZXZc=;
 b=l5zNp/hrq2JLAspqnzotcueIP32IhU0HAjod+oVrs/rBWoSjc0xqUGfUlRZUCm2jNBwoaSz17dMjlB/z8WRUhZrzLBQTIQ0pA28DEX4My092BSlf/jnwFm55f/Wqm/MDpfntEVDi0lt6TD0G+PGF35QR7I7XpxTvGJA4/U42UoqFrrGnujVe7v76uX7rSskhkZ9+1txOPVs9xGFGREtD62ROoU0iwZvxvnPohBJaGTuuXdxUI3KUJAOQDKD6wjdoT5TC6/g90ASfmR0DLvCpGCMuXapuHWg3aD3DK9X9zr75H33cUtedq/IQoEWZJMVW9PsmOzLljErlNrlFBWGC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJmh38ehQC9Pcj/51VUC4Ah9+U/3SWX1NyuDybmZXZc=;
 b=15r2Zyg2ZPNNNFkns7TY7ML3Eq5gb6pHcRh9Pegsea2/nYW2I1PF2hBlR1/8rVm2OI93LxeklTQt8QV/Bt8Ml9CPHCR5Yntdlmnmx7SL8ZCYUnFRzv7lVxE/cLV5x8z4bGBwRpKgDENiPQLkvDzpd9IP/9SVwgOnU2pbwxJpOOo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v5 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaG4QK5MCX1n0HKkuH99Fs2YTq1LCDN0+AgAAIlICAAARyAA==
Date: Mon, 20 Nov 2023 14:27:36 +0000
Message-ID: <DB403D33-700B-41A4-94D5-233D26900708@arm.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-4-luca.fancellu@arm.com>
 <98980da0-2940-43d2-a6c1-e064f4921e74@amd.com>
 <0c32e2eb-7ffe-486c-a11c-477c3cff5cba@xen.org>
 <a60d951b-7e23-4421-a7c6-68b99f33cba0@amd.com>
In-Reply-To: <a60d951b-7e23-4421-a7c6-68b99f33cba0@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB10356:EE_|AMS0EPF0000019A:EE_|AM9PR08MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: ec39e002-95cf-4b52-e6f2-08dbe9d4de80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QDEGeMCJmW2QYqZl2s+HaAFuKHgsE2TQJu+f/pMxYfjNuPPdum1cB8hnVA9gxsVKlLhkmyvtAtQ8HElj/1lVKOwSFbKz0B9GovMEz6Mu74MTZHiyuFfb1oMpYosPl7R5Tgu0fVeINVivMsgbe9Uhdj1KXl8NdMdLWwe8XKJeW7C250GUS0biX+zGG8zeufXIaJrM/XzqR5ohTXk9VcfA7Ij9RBz7e3jISow2LoMJ2diRa2WUu8V7F2OCy9rz5EsV/SgRH8APipgqi75xykM1DbTKodn6dGENRRMsKbllfMxDoUrz3Wp4ucFzf6zM6W2CzADLSElx1GZu8o6Zk99QlC1tW4csGbKvrAOCAYAe6cOvd3eFRNQE5nWF5tbn79AHSLm1dvQRMglnOHfk6lpo27yevPoaZ0C6z1sjM8T8DG0IIm1iApxVmkTD/iL1OXRyCRsYjgztYT8uDXXmLfDPQLOUO08M5PIHVqbqbl6aWkgo5DhRz2bA50eALHFEAw2ydscEANDc0U1X1P0ZkqF7ul1dDtVIK0uK4Qm5LLeTcg5u65kIdoK8Mz5lMFkBQrBvqILAuEqrm213ffIm0gHUh7yRELYBCwuzQVST95ruJahp/0lHN22QpqGrUl1awoKlgnwyZBtFOq80EIkbpl+nAqJayr3F5ff3l7dPTuk3Htk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(122000001)(2616005)(6506007)(41300700001)(6512007)(33656002)(38070700009)(83380400001)(36756003)(26005)(8676002)(4326008)(8936002)(5660300002)(478600001)(86362001)(6486002)(2906002)(76116006)(71200400001)(38100700002)(66446008)(66556008)(64756008)(66476007)(110136005)(91956017)(66946007)(316002)(54906003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDD1DE1CCD58834CA525127DE37D8E7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10356
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f931107-0333-489c-b3a7-08dbe9d4d7f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xTgevFcabX/xUI6QNyNCozuzhxEnqAdUqtrNtQtQp1cXxlgWxjqU0uO+vagF7Zcb2PPuKWP+rP2Ye5/xbNV9u70uPUC2CA4dm0hpQcjNzWaNnx3c83E1OgQBWWbcC8qahM+aaE4QNcYCm8EIOAAB/pElcQLG9pc3sQ4Rneov/YtMtYgPEXlF9mscU75wpw5KxvrhWWIOQF4KnJH1FoR1tix/c5vny/MjkyPvdfNmutZ5OzgN+pEvegddWQyBzrsnTQbSaUhTWsIt/UR//eB/V2CGTUZ0jnJJJVtapn3a3Ws+4yZPQSlZDF0QkLChgOpG17j374qG9PFfAfbd7Tn1mXjHAY1FWQz5XceLvDRHiNXsjDS6JxhEuHO2mBSxELLmbmoQhgFhUWYNwjAUjD0B2L2fxJchLzcGv0Xcu6pQjAMo8Rzml4tkCvUuA0dbjUKaWcoYDsFmde4POywt72Papp00JGb+Fp7y5kuL4vx1+cuBaLlbur3FS2bRjfkQETz+RvpeN8Q216rA2i4QRYpxCC2AIsjnD+9VmtSi0vSJxbIBL6bgXMd/Mu7HU4iEcM9BqJxrgacd0VKaTT+3nDwCko4NWPFqCbwwC8jrWyzD5w73h0SLV4dNaACBPL/C5sMFOX0bXlwH269h7COBzGi2DMKSVGXhoRqpzx4caNNW1qRvYbrZPf7uXgZa2Hewhu4kIxkbmb2hOVGgwxrKefC+ZltQO5eYNqfr1IOHRN5MsAPfttDOgl3wzOWvJjUDyFDlE95dOLNk18WAoqqbIsfWeA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(83380400001)(336012)(6512007)(26005)(107886003)(47076005)(36860700001)(4326008)(8676002)(8936002)(41300700001)(2906002)(5660300002)(316002)(478600001)(6486002)(6506007)(110136005)(70586007)(70206006)(54906003)(36756003)(33656002)(81166007)(86362001)(82740400003)(356005)(2616005)(40480700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:27:47.7916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec39e002-95cf-4b52-e6f2-08dbe9d4de80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6035

DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNv
bT4NCj4+PiBSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4N
Cj4+PiANCj4+PiB3aXRoIG9uZSByZW1hcmsuLi4NCj4+PiANCj4+Pj4gLS0tDQo+Pj4+IENoYW5n
ZXMgZnJvbSB2NDoNCj4+Pj4gIC0gZml4ZWQgbmFtZSBpbiBpbmNsdXNpb24gbWFjcm8gX19BU01f
KiBpbnN0ZWFkIG9mIF9fQVJNXyosIGZpeGVkDQo+Pj4+ICAgIGVtYWNzIGxvY2FsIHZhcmlhYmxl
ICdlbmQ6Jywgc3R5bGUgZml4IChNaWNoYWwpDQo+Pj4+IENoYW5nZXMgZnJvbSB2MzoNCj4+Pj4g
IC0gcmVtb3ZlIGhlYWRlciBpbiBkb20wbGVzcy1idWlsZC5jIChNaWNoYWwpDQo+Pj4+IENoYW5n
ZXMgZnJvbSB2MjoNCj4+Pj4gIC0gbW92ZSBhbGxvY2F0ZV9iYW5rX21lbW9yeSBiYWNrIGluIGRv
bWFpbl9idWlsZC5jLCByZW1vdmUgaGVhZGVyDQo+Pj4+ICAgIGZyb20gZG9tMGxlc3MtYnVpbGQu
Yy4NCj4+Pj4gLS0tDQo+Pj4+ICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDEgKw0KPj4+PiAgeGVuL2FyY2gvYXJtL2RvbTBsZXNzLWJ1aWxkLmMgICAgICAg
ICAgICAgfCAxMDE4ICsrKysrKysrKysrKysrKysrDQo+Pj4+ICB4ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgICAgICAgICAgICAgICB8IDEyNjUgKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+
ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tMGxlc3MtYnVpbGQuaCB8ICAgMjAgKw0KPj4+
PiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oICAgfCAgIDYwICsNCj4+
Pj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgICAgIHwgICAgMSAtDQo+
Pj4+ICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMzMgKy0N
Cj4+Pj4gIDcgZmlsZXMgY2hhbmdlZCwgMTI0MCBpbnNlcnRpb25zKCspLCAxMTU4IGRlbGV0aW9u
cygtKQ0KPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWls
ZC5jDQo+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Rv
bTBsZXNzLWJ1aWxkLmgNCj4+Pj4gDQo+Pj4gDQo+Pj4gWy4uLl0NCj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb20wbGVzcy1idWlsZC5oIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2RvbTBsZXNzLWJ1aWxkLmgNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi44MTQ0NmNiZDhiZjMNCj4+Pj4gLS0tIC9kZXYvbnVs
bA0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tMGxlc3MtYnVpbGQuaA0K
Pj4+PiBAQCAtMCwwICsxLDIwIEBADQo+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5ICovDQo+Pj4+ICsNCj4+Pj4gKyNpZm5kZWYgX19BU01fRE9NMExFU1NfQlVJ
TERfSF8NCj4+Pj4gKyNkZWZpbmUgX19BU01fRE9NMExFU1NfQlVJTERfSF8NCj4+Pj4gKw0KPj4+
PiArI2luY2x1ZGUgPGFzbS9rZXJuZWwuaD4NCj4+PiBObyBuZWVkIGZvciB0aGlzIGluY2x1ZGUs
IGVzcGVjaWFsbHkgaWYgeW91IGFyZSByZW1vdmluZyBpdCBpbiB0aGUgc3Vic2VxdWVudCBwYXRj
aC4NCj4+IA0KPj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgdGhpcyBwYXRjaCBidWlsZHMgd2l0
aG91dCBpbmNsdWRpbmcgYXNtL2tlcm5lbC5oPw0KPiBZZXMuDQo+IA0KPj4gDQo+Pj4gVGhpcyBj
b3VsZCBiZSBkb25lIG9uIGNvbW1pdCAoKyB0aGVyZSBpcyBhIGNvbmZsY2l0IGJldHdlZW4geW91
ciBzZXJpZXMgYW5kIEhlbnJ5J3MgbW11L21wdSBzcGxpdCkNCj4+IA0KPj4gV2hpbGUgSSBhbSBp
biBnZW5lcmFsIGhhcHB5IHRvIGhhbmRsZSBzb21lIGNoYW5nZXMgb24gY29tbWl0LCBJIGRvbid0
DQo+PiB3YW50IHRvIHNvbHZlIGNvbmZsaWN0IGJldHdlZW4gc2VyaWVzLg0KPj4gDQo+PiBPbmUg
d2lsbCBoYXZlIHRvIHJlYmFzZSBvbiB0b3Agb2YgdGhlIG90aGVycy4gSSBzdWdnZXN0IHRoYXQg
dGhpcyBpcw0KPj4ganVzdCByZWJhc2VkIG9uIHRvcCBvZiBIZW5yeSwgcHVyZWx5IGJlY2F1c2Ug
SSB3aWxsIGxpa2VseSBjb21taXQgaXQNCj4+IHRvZGF5IG9yIHRvbW9ycm93Lg0KPiBTb3VuZHMg
b2suDQoNCkhpIEp1bGllbiwgTWljaGFsLA0KDQpJIHdpbGwgcmViYXNlIHRoZSBzZXJpZSBvbiB0
b3Agb2YgSGVucnnigJlzIHBhdGNoZXMgd2hlbiB0aGV5IHdpbGwgYmUgbWVyZ2VkIGFuZCBJIHdp
bGwgYWRkcmVzcyB0aGUgcmVtYWluaW5nDQpjb21tZW50cy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

