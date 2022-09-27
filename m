Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D95EBF0F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412443.655784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7If-00068f-DW; Tue, 27 Sep 2022 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412443.655784; Tue, 27 Sep 2022 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7If-000664-Ac; Tue, 27 Sep 2022 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 412443;
 Tue, 27 Sep 2022 09:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n76Z=Z6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1od7Ie-00065y-1l
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:54:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aba7514-3e4a-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:54:46 +0200 (CEST)
Received: from AM6PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::25)
 by PAVPR08MB9402.eurprd08.prod.outlook.com (2603:10a6:102:301::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:54:43 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::69) by AM6PR10CA0012.outlook.office365.com
 (2603:10a6:209:89::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 09:54:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:54:43 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Tue, 27 Sep 2022 09:54:43 +0000
Received: from 48459654104b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9BB8834-52DB-4859-B015-57645A67F56F.1; 
 Tue, 27 Sep 2022 09:54:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 48459654104b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 09:54:37 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS4PR08MB7950.eurprd08.prod.outlook.com (2603:10a6:20b:576::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 09:54:36 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 09:54:36 +0000
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
X-Inumbo-ID: 6aba7514-3e4a-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fyQql/WFU/EYVD6D6TTgLA0nsrjn/SxQkt/87TaYzFHr1cj01lTAmqHUu8khlGHgMCVO9igwjAImo2W8SL8NB3UjxtKyQ+RmBrRnaWJt6hkjkaZ1GubeXLcirL0YI72uaChpJ/RZQ2weAR/SACZdWubBsCUA9Tvwdu1uuWIk1rlRGo1tuHuUAhuH5k45mbBaWytVPNg8XmkdOmeKe1mD8PhxItJIhr3Vgh4LJEuHvPUtYrDSo0IKWfHZIHoYd6mXBUG3hrrMv9p08m3Dm5yKNOKxl8aI/5++cuMAquFonbYw4t4ptASM3AN59fG5R3FRhvwqDo6HJ3b/Rz2MmPrEHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNj5LyPGTgP8nBL4M5hDYfG2hHYT5Bypq+EWPXCJFvI=;
 b=IegX0mAjaO1/HzckbKxHBHhuX6vA0dz+tv2VutTCr5pa737LX/r024SBo98HIM4UCzrDlpnjfr7hUjW08GAvmcrqILFNTP10JiHjDcuVasDgOR75aSLYs9cVhFM+wLPClTFerMD0MWpr7nhXQQ9kr+X0xYyks8II4V0nuzWGyvsDE9tD/GuD17BrEgxphdasBkayMvToc80sVEcnqEUuYENrNr6LL+1zyRruYfmYvN3ePULvbmAiyOKgvoQXvOMB9RnHBGerm7Hg0c/McPnqU+6b34LzdRu7DWjCGqDc90kM/GNnn4Khi8o/Gj9IuoegdMwGocmQIod/3z3b29hEzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNj5LyPGTgP8nBL4M5hDYfG2hHYT5Bypq+EWPXCJFvI=;
 b=R3mLjo3pmxeawaeL1S3ydSnkzWv8dDVlQdbY1yveYySyo4o0gwy3pfGl6Tc+I/tvG3ArgGb1IFQhaWLar73v26XgkzynkVLBlSPYTDZW+FX2jj4hZmYHFmXk6g2LMiTx73XyWqC3FwTpHnrlhG5geVQznJBx5WY7EEQYbw7aWgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1919941bf762562
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAk7DL/eGCNgEG9hVUOak4X6pDN0dUoKSUVY2QH8GZwvjK9+GBmj2mmmFZeVYuN575fOOxx1dW9g/sBuRCOAfHn0D6jAqzdqxL8s6OVhVmzSgnRJiKHAsNZW/eZHcSWJNHR7+ZyotQH6y/NdZiY66eJDnI8CacoTbkuh0itgZBR9YqeMrma3BelXHwVq9uzCIBYt9VszP4/KIqTjyTG1KXOuDvZb4JiRzla9WNv37lS2At4YqUHpCAn5BIXHPE2sqadi7FUZytuyPxrReQ1OSw+/OuZ4biWBRHDVUVHWwt7z0nQUlCyiKcMpm+uodkfRQuUcrmkt2UtnGLEjgY56fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNj5LyPGTgP8nBL4M5hDYfG2hHYT5Bypq+EWPXCJFvI=;
 b=Eiyr9mR7w2s4ZW73gx4cA4cvNM7TLziBS4aWufPcV0XAI8I6reFR36VyNyrTrjaXpUHQT95PXW129+ioODhUJiHgmw2lill3utaR08Ixd6POG42Z4d5rzMJ5W1Y/j0fJH6WyXJ2kOZrdBfS2MbuRboTPE03BixqhL8idQSD7gvr61J8C8F7RfBkWBq1mgrkQ8zryJEyxgsdsGSKUkK3ukv+DFDd2gUB2ETtB2pCWePPfJzH5DOQO4pDJGMkiOnW4+YbEuUmFaBjBfu9A3EQWsRf3ad9akKKOAVventQtSsD+K3AFgIrCoKKr+xFO9TCn1DGd+RNN7At828gQkxUHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNj5LyPGTgP8nBL4M5hDYfG2hHYT5Bypq+EWPXCJFvI=;
 b=R3mLjo3pmxeawaeL1S3ydSnkzWv8dDVlQdbY1yveYySyo4o0gwy3pfGl6Tc+I/tvG3ArgGb1IFQhaWLar73v26XgkzynkVLBlSPYTDZW+FX2jj4hZmYHFmXk6g2LMiTx73XyWqC3FwTpHnrlhG5geVQznJBx5WY7EEQYbw7aWgI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh:
 Fix typo in DEBIAN_FRONTENT
Thread-Topic: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh:
 Fix typo in DEBIAN_FRONTENT
Thread-Index: AQHY0lZOQ7+DCxc2Tka27Nur8gXCgK3zCZ4A
Date: Tue, 27 Sep 2022 09:54:35 +0000
Message-ID: <94635988-CF1B-46FD-9E82-03675E59B62B@arm.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-2-michal.orzel@amd.com>
In-Reply-To: <20220927094727.12762-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS4PR08MB7950:EE_|AM7EUR03FT017:EE_|PAVPR08MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 62465daf-d145-466c-fc5b-08daa06e4da6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v28lA7OqZFjhU1wm4f4r6X+bhYnEFhksA81IjS5cif8plyY8q+CRcwltREWxo26U7pjYhJxYn7k9idrbk3UYpU4cDnKXyJjKcnDmgqtNLnS8UAFQNBPXk5WzafZd/YE7/v501s145JaS7C6mkKopa//80V/ZbW9/+/j3ETmNZeUWTIy2NEtH2vcJHBhkaU/ss7RQ6tfrV5ChZicnZRu0zWeEMJf/bTLXWuZoqKpaq2bwBHq8kBt92kjxInKrVn/XW85fyKRt8rLhPc6fFBSrjAbIJMc7IpFKjeWigIOBB7lktV6EdWAlNzvjw1hJTmSvrCABH7oNLCg2HEh6TErRoG2/6RjMDMDjRfMipnMYSHyXFBswhvVlYY/CcR6qK48ixZ8ijaskKVaMmVoEKHXa8SwG6IFENnj1+ss8kE9TVXMNYQVIIP4keGWZTGX/XIx5tzqGV2yivDLBPEncjf0/aGVfAnRajHb9rGBYieCVGgIN1LD//5ViZqwBnseJNzS4E2S0LQLE6GpMkCTZwwPqtbIvywf1FyuOC5AYfNt178rVhA2gxsFWgulED5X4fKUpsQZdXWO/GTYfHvghqRYIfwdXSldlmKHhlTTX6ErAJVbQTtJmTWWBC23rIFQ/A8DFGE2s35HuwIrAJUYCI5ocVAcaYjTuYqfS0USq6cQR/k9XlU+IItBBdrUNfIiPqjs1zfJcWJtwJrprDGamacY6N4RN8lmEofgjtAaIJZxipddGbWtQgahHPmPUjNNk25vrCfSRfhrN1dykJMn1UDx0kgrAusdGSWDgBXz+XhvH+xk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(186003)(2906002)(38070700005)(478600001)(2616005)(6486002)(54906003)(122000001)(38100700002)(36756003)(316002)(6916009)(86362001)(41300700001)(26005)(33656002)(91956017)(6512007)(8936002)(64756008)(66556008)(5660300002)(8676002)(4326008)(76116006)(66446008)(6506007)(66476007)(66946007)(53546011)(4744005)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E4487ABA376DCC45ACE565207454319A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7950
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1efbf6fe-a08d-4130-15c7-08daa06e4921
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CFbSBwZy7lq4eHztGLIdS6iamDj/yz9bYA3GGpHzXpHWnLKNupHxI79tT+U4g9FcTFcNxz2NAAd1AjpXskCr74O0Uu/wbcAadlvLcelIs1ed6Vz4oCIa3TVBgWlSq2iHBVEjGTjy6UeZLHUKYbdICGrYGXia0mc/0YJvoOyeF4jHxi4xmLTVz4SZRnoXn1nZAn9qj0Z55/ZFu+X+oq7X8WDloIJhsVnDRGBqwwQpcOpL+SK2r1V1uZeeZbdZeEpJ6Y12T/WCpjKpC9ElfXHD2bmz8+HCojUlk2Yty0y2FTHwaVO9wByxIUX8Wu075AHu6NoGpRUJXW9eON3CpsBS1+GaZvqMmBYpgKocyDDgI4UblrBEQUcD3wj1moZgWVUzaNbGSD2iYE6CsE+9Z95wq2aOAKAmsBXBmSrRgLMnpZfK78QDROkdwAADkNZAZp3Hu1JimnqKFlmpUe3VpWuBK9yE6oyI92t6bdohbTOrmBD5G1DKAI5vLHwWN/SXk3J9ghcNuQfwhHpaJtfhg9erhb2goOG7NXYy03YJSXMHMbyC4qBIyOoWX6h37rUjlgg9DFPzD6xAQvBQMppj3aZdlxACjdL05kZly8rLafY30gGVZFv2KTrEuxPDDgai7Gz05tDdvoSgWWd6JLmCONWWvrdt1bHY/lxh0qyZ+zHgClh7vcbiBuAbFH+DCkaLtdrce/99W4Qcd10phj62dFdNV9lNK8HOwdfeB9LAmjHJ7e2TuD9q5FoXHX7oKi/cJRHCVrw5aXGvicOVEqa5nwPDHA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(186003)(54906003)(86362001)(6512007)(70586007)(70206006)(316002)(40460700003)(8676002)(41300700001)(4326008)(478600001)(6486002)(47076005)(36756003)(82740400003)(83380400001)(26005)(36860700001)(40480700001)(4744005)(53546011)(8936002)(6862004)(6506007)(5660300002)(81166007)(356005)(82310400005)(2906002)(2616005)(33656002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:54:43.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62465daf-d145-466c-fc5b-08daa06e4da6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9402



> On 27 Sep 2022, at 10:47, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> The correct variable name is DEBIAN_FRONTEND and not DEBIAN_FRONTENT.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> Rationale for taking this patch for 4.17:
> Setting DEBIAN_FRONTEND to noninteractive menas that we need zero interac=
tion
> while installing/upgrading the system via apt-get. It accepts the default
> answer to all the questions (using apt-get -y only works for "yes"/"no"
> prompts). With the typo not fixed, we might get stuck in CI jobs.
> The risk is very low as we perform pre-push testing using GitLab CI to ma=
ke
> sure the changes will not break the pipeline.
>=20
> Changes in v3:
> - new patch
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




