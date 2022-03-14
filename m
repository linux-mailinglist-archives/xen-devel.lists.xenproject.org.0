Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6134D8872
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 16:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290288.492272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmsz-0007nU-VH; Mon, 14 Mar 2022 15:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290288.492272; Mon, 14 Mar 2022 15:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmsz-0007l0-Re; Mon, 14 Mar 2022 15:45:29 +0000
Received: by outflank-mailman (input) for mailman id 290288;
 Mon, 14 Mar 2022 15:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTmsy-0007ku-2j
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 15:45:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4a5d91f-a3ad-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 16:45:27 +0100 (CET)
Received: from AM5PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::27)
 by HE1PR0801MB1929.eurprd08.prod.outlook.com (2603:10a6:3:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 15:45:21 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::5d) by AM5PR1001CA0014.outlook.office365.com
 (2603:10a6:206:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Mon, 14 Mar 2022 15:45:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 15:45:20 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 14 Mar 2022 15:45:20 +0000
Received: from 8e710da06b42.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E841923-5AAE-4233-BD26-D781D33A611E.1; 
 Mon, 14 Mar 2022 15:45:09 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e710da06b42.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 15:45:09 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 15:45:07 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 15:45:07 +0000
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
X-Inumbo-ID: c4a5d91f-a3ad-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSP5qxlPbkb/wXyKUn/g/JMQjPLtHaHj4o2z7D2JHCw=;
 b=DjnDpKQUrm6mddzSFCONnTG9GjOGneyPbGRJTXavHBz2PgVlJVGXeL8CTzbDXgMrQloNSTsqnCAFxK4NuhygB/Ckq4DlgZr9LJ6qxQk90mB5GY3h2eXieGtW4kIiKHNl71EbEtyugLK7UIpJCW2vOpqc3eI9wZ1toyRFFHlR9VQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9724f29130723f29
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkK7t25wch+alkNli+y0EDHQo2ZcxwIlOPtDU75LT2fsKG6Z6wNlQraUrHdjnkZun7nsTraP8uRUxVWdZFkDASRGQpxQtlrJ6XOu53j7QaejheSYXy5JJOqRdzas1Oz5UrKGD46bA/vEPJFAV7wFezjn4YBYY7b4PXgLWGtvmjuvMxKyytxl1FBZDBmioFaUScprg3I52X10h3KLrNegeFgifh7wlYjk4MGbJBVx2Kkt8sq1OlZsX2Qnxlpo3vXym4wRfnxnSybEmJi1jRrpm6nGLsFRQKJCg5zStgMfsM0wjkCS44DMo9EzrY8jCRl1UTIZrAE0uQLsSeDojZg+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSP5qxlPbkb/wXyKUn/g/JMQjPLtHaHj4o2z7D2JHCw=;
 b=JDyFaoHq6Km/WPKKuPSbjVjzZst/dL+bgb/f/vReE9rP61ZNAZSKHaItRhOWvaV+II5Q9UAumXdl4FZz6PMNIU/tMeRG7MhDKypNOo0TYcaROUQRGvCSyulm23oGIFyE/EJEyNX3+rWBiav+vESnUQ1HjUKbs+eug1GMBFKkNQHnTEOSoYeGdQd2yX1uLqNIBcDcLuOzPFtnjheo7fM21jm49Y+qKBrB3imFi3FsC8u+n4nZjJt5+/LVZYgpmNAdRNcfZZXUckxYX0LwZ6WcDXrIFBYqmz9SFRkonQuoKH3LJNfQEKwVfsU2UBpahQgFHPfgzKpu0hApebaiVkq81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSP5qxlPbkb/wXyKUn/g/JMQjPLtHaHj4o2z7D2JHCw=;
 b=DjnDpKQUrm6mddzSFCONnTG9GjOGneyPbGRJTXavHBz2PgVlJVGXeL8CTzbDXgMrQloNSTsqnCAFxK4NuhygB/Ckq4DlgZr9LJ6qxQk90mB5GY3h2eXieGtW4kIiKHNl71EbEtyugLK7UIpJCW2vOpqc3eI9wZ1toyRFFHlR9VQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 06/14] xen/smmu: Add remove_device callback
 for smmu_iommu ops
Thread-Topic: [XEN][RFC PATCH v3 06/14] xen/smmu: Add remove_device callback
 for smmu_iommu ops
Thread-Index: AQHYMyV2HGYvXqb6DEeqlGy6Hds1/ay/DqkA
Date: Mon, 14 Mar 2022 15:45:07 +0000
Message-ID: <1373EBBD-1145-4608-B236-0047C4B5FFB2@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-7-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-7-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 47d6970b-14ca-41b0-2afa-08da05d1a589
x-ms-traffictypediagnostic:
	AS8PR08MB5912:EE_|AM5EUR03FT055:EE_|HE1PR0801MB1929:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1929651622C25E30059EAB5DE40F9@HE1PR0801MB1929.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sboyCVtszvbMchj9RBv34qpp855EzLFWB4rHJ1h964plnD+DRI/bwHKPi9YCX+PSlwpHWwfg+GwhyvjyfTPVe26pPnki4iRPIvWcd7r6CzPZ6nIEnIhXVbsPc8a51HF/qtNOoAtFJ0d5/jB0UR0xGydL5CIICaCBPgAnmPor4HJoylyVDMGTMdp8scnn4y+UZAaVTuTgurD4iBEJs1+NMtZ3gLQprBYYA0ulVHS9L4AYWyxdZnNJrtEFNC5w9cOTEInKuKUxnqNEjE/WtLaXdobrEc8YO1PnfXetMBYWtVOfR7axaP9CbEvCBD7JIVX3Rrl8gbIVHevSM/VbZ+FqmlxrOc6bVIsHQ/zH6LDh1uA87VwmS6UUKZXZEAN0UJg9F3p9qQYIPvx6lZsj7gqe7uMov9ILOPgua4FctgcqDP/CLyhU3fyCsHnnpUesINKYS7gxQbrciE2/ICmQjsDn0YS+L9d9Kw4yTVHRtUzhFFIdGQKKZMCSveiR4VvXwfrXuDWZ4nvopQFX+hSvdIPL/iDJuwm7+h6wv3kiUmaH66wDTGpNHJJgMjlJ+tIlbamxWwgvrgoU0tqDzxas51DyiFwg+UUHdo0JlQFopCj6qHHM4GKwjtmRr1MTEzOqjY4HB8o9Dxl2UVEyjhfTTLHbTw3WpjoFDysgvQCsbaeGsR2G8oEL0AXRLAry7lKZJKID6XCxiViPtKQLRNPDoqBBspagabvvDE3ISRcBoMQE02/xj1rTpT7Cohs1lYEep7XO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(33656002)(54906003)(508600001)(6916009)(38070700005)(6486002)(4744005)(5660300002)(316002)(36756003)(86362001)(8936002)(38100700002)(66476007)(6506007)(8676002)(64756008)(76116006)(66556008)(91956017)(2616005)(53546011)(66946007)(66446008)(4326008)(6512007)(122000001)(2906002)(26005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4BB5AB6AD221247BD43AFD290F06A62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45580a40-6ad0-4ace-da33-08da05d19d62
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WY4Y0ZeGn4UqtL+f9HRPjAEhcg52LVCfi5bKvorlanum0/8RD0VYSUblQVqomneJ8CVJ0iwAoinyP3HbSdnm4GSU0S6wsO5USolcb0FRVeDd1XAXuHO39m+5zVNotCYQfH28cpm8OtiOwaDuZa7j0F6W2Jbg1Tm7ZvILzHM2aQv00up4DKAz9bVDBLKf5cbureoJ1/0NvtEZ4xrQPiKlkaXyOA+YQEaYWgACpXEURY4Rh/xCvAFpAVg05yMWLyn/+DuSvq42fmqjYopsEzK8wC0KQemvc9SWffssRVQ39OKARUGuXMso+xJUrVJ9HOrRzXXeDGn+AyzMO+2fRusdj1ZrjElqPfun5UH33THoKdBwpplAntpY9ZGE5NtSdjVbZUFuB+XYqt72hjeuQWRpitMJyQyPfglfeq64/LCGYrDFz33ptaJEkLsEmWPF/goYeBVt8nJtHpZeb9uON3HwtGUPrRb5LSAbbxkdoSl+pSQGmpEP4TxdlPMAgouScXknky3QJmO4huBLA3vFOteSyd2OOeiqVUPaaur5nYgyPoPtjIf9cBbR0N2bUC1/M94ncfLLoTQkWVLcqa6lcM3wJKv8FX3Qca2a1H6Zj0QXReujWkkJFwRILmDY3BbmJdZMBjML6PAvNezl4mz40Pcfo0QHXxG1zD+WzQqHeLoF82AExwI8SjPUJW/5wGTj27gf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(4326008)(82310400004)(6512007)(33656002)(86362001)(336012)(2616005)(107886003)(6862004)(70206006)(70586007)(186003)(54906003)(508600001)(6486002)(4744005)(356005)(81166007)(2906002)(36756003)(6506007)(53546011)(36860700001)(47076005)(8676002)(8936002)(40460700003)(316002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:45:20.9255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d6970b-14ca-41b0-2afa-08da05d1a589
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1929



> On 8 Mar 2022, at 19:46, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>=20
> Add remove_device callback for removing the device entry from smmu-master=
 using
> following steps:
> 1. Find if SMMU master exists for the device node.
> 2. Remove the SMMU master
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>

Seems ok to me,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



