Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1937FA568
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642317.1001716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dzh-0003ra-Ko; Mon, 27 Nov 2023 15:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642317.1001716; Mon, 27 Nov 2023 15:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dzh-0003oZ-GW; Mon, 27 Nov 2023 15:57:57 +0000
Received: by outflank-mailman (input) for mailman id 642317;
 Mon, 27 Nov 2023 15:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QuWu=HI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r7dzf-0002I6-Sl
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:57:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8fd8a61-8d3d-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 16:57:53 +0100 (CET)
Received: from AM5PR0601CA0075.eurprd06.prod.outlook.com (2603:10a6:206::40)
 by AS8PR08MB8039.eurprd08.prod.outlook.com (2603:10a6:20b:549::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 15:57:50 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:206:0:cafe::cb) by AM5PR0601CA0075.outlook.office365.com
 (2603:10a6:206::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28 via Frontend
 Transport; Mon, 27 Nov 2023 15:57:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 15:57:50 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Mon, 27 Nov 2023 15:57:50 +0000
Received: from 91ede15fb737.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3EA755E1-3230-432F-BCC7-0ABB00E66786.1; 
 Mon, 27 Nov 2023 15:57:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91ede15fb737.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Nov 2023 15:57:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6274.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 15:57:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 15:57:41 +0000
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
X-Inumbo-ID: b8fd8a61-8d3d-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=izw7FWhg7q5nDSFr7X0650SQvlOlV1Tneh9ppLAcEgZydk9N9dDx9FtUsC3gcUyLASq5C+JkAAUL9NsuVQrMwfYaAfmpLe5Qeml3erDLoAqdx2uMH0jxoP6aCXUCo42wM7yz5Kh66cpPMz3cPcDpIjmq7v6Yz3dQbE70W3wt2a6vsK1BzW5Q6uZFNn6bZw+yrnr6ezL1i2fwR5AcF2B+aNfItblukM+rLSZUHnJArzuqgM6zOZKjEVcX8f8aEawSAXMq0pvYJ5WZvpXpIjl43pcsI8G6CJOcBCqwj6ghpWg151q76ydQJBRrwWlt/YgJS0h8GN+98PETmpqHoLwTuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91kmgh05WO/MQ+6qanLkX98vKIokRWJqu/BtHo4wXic=;
 b=F5FGr635EKCDWk+XuUozOm4TPPclgb1o2/UNFuKlG+t6gwL0gYgfCcKIruvqFXPXU5tkYomt2EDr73f1XRluAMEWmtCOGdP8wd8552JQNy0R30PC4mEseoXgucGvREbe1BLGyBY5TZkooNC99EuU/ljqwv8zMsmebkLb9VB1A7sPKHMFi2KQSLTyU5VKrqvTa/NU58j+FIedet5GlZzQbArXYnvd+6zmxLkvvTGiwcflHn/rEBZMoigs9yUe48d67bGfUx9hvp1X4C+QEK8F/HtwgVPth1BZtohoMEeUZOImIGIhFKM9JoVqJLP6AIs/cZ8JG5T10k1NQ6XrNxHaIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91kmgh05WO/MQ+6qanLkX98vKIokRWJqu/BtHo4wXic=;
 b=+K0UIonVMQFB31m10TWqLgQkh5sQE3+VckKTpJWkLEBe/NOshoc+DYmjJZ5zyuNZkD+q69IZQJdayDKFMROtwjrIW+dbYk/coOJeJBoEat7mpgaaoePZfbv5j0i5tCIUY1VzhVQE4eWSE9pg7f0JD1UcvzijB65ZOYVkPufjRFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9ec52d7dac228ac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeumLFkTJTTNSd3i1hktqTHdUp27+p6DQvSvmqSF9W8XoQt+SYHVaGpIkk1xKJ4f+ZuGUc/P69jp3+dN26LxjrAQO5YOZk4RVTjpeU+jFwpNvvsQvsdGpOJWghl6qMpqJIjmBr14B1secHl16uKjaDyigvoCaXJhcEPGupRgbKYRxd2V1C06CPKGU+vQN3j6gTP2FP7wcot29HDtVSOBPHu9LTpAY/QC17B3Jx7uytCRZ1Ll6qW1K5PHu8Oe9aO9RsUWKHwEdY5qJgd04pnNj+h2g/xP3m1zLAjcgzLGAXtQTuUFTf/KhVBq+c67I80Am6jOFsA2ludXm1ygqxDHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91kmgh05WO/MQ+6qanLkX98vKIokRWJqu/BtHo4wXic=;
 b=dWjs4uGzzozBgw24vcQg6BdYITsA8dyAZG1qr54FUm+Ivw0vptcK9YKlPhseiG+685ygpS6Al8P38olDL5+V+jgojQpejXs/RuzV2KwQa/jxUrQWMi8fHp4HvHYAk/YNSbrjaBQM/STgIovQU8qDvQOAPw+9aeXxrFQ1JP2aT28IuU6+vdzpw7dJF7Z9YaMep2+/jzCnBPspNNSyB+BVMNMFPpJorzGzbOM8v/4BYtqicneQ4Dpy0vu77sIDUElTm+u64NmVMLFiKezHp9cDDqkncLv/ALehLjSklwWSGZ9zpRQlEBbPVyTFa4h/Y/WVbEHg25STVJ+kPgcPacCyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91kmgh05WO/MQ+6qanLkX98vKIokRWJqu/BtHo4wXic=;
 b=+K0UIonVMQFB31m10TWqLgQkh5sQE3+VckKTpJWkLEBe/NOshoc+DYmjJZ5zyuNZkD+q69IZQJdayDKFMROtwjrIW+dbYk/coOJeJBoEat7mpgaaoePZfbv5j0i5tCIUY1VzhVQE4eWSE9pg7f0JD1UcvzijB65ZOYVkPufjRFg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index:
 AQHaHhwDfni7SbjBtk6S7YLD/w4HebCJbICAgAAi9QCABIyNgIAAK/0AgAAEPICAAAbTgIAABQ2AgAAAhAA=
Date: Mon, 27 Nov 2023 15:57:39 +0000
Message-ID: <BAE8E255-F65F-414F-B30C-A1F2631E74ED@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
 <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
 <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
 <05808302-3e8b-4e87-89bc-950261300958@suse.com>
In-Reply-To: <05808302-3e8b-4e87-89bc-950261300958@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6274:EE_|AMS0EPF0000019C:EE_|AS8PR08MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: b5842b22-1706-4dcc-7682-08dbef619bcb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y3bvQzq5h/JImwVEDtJ03wbsMcMXDbQpoB9P6CZEfwzjQZNpNx8Xzakn8paVutXS0oly/C6sTUJwQTKIjjoY4ImHB3ZOQjNbxY72n8fJdhWpO6Hm4ty80DaunKuuxnDRMsGwjTeiafwyD+DWJOQHRuxPc0gGEkTmJ9XrEGBwcjtLkP3wkK0Y/0eCnzyx3zWC0YLfbBg+r50xRcMm8ReEPRbOGXIVpHZ6pGNREbtAmfB62qpy2fMrwBww0AXNE9GWqWFM2EYhIiqJXghdDoY/1xQxkHhdJVatTR/Tnv55xoK6spksLR4wxRgGVOAnKl4jwcRM6u7mD2ezaRKsiMGXdh0gECjVL9/eRAPQywZGNaAzUeMnwz/6qSwi0kEmkKZP1b0SA0eIJm95Z/Jq8Elo4REe57ONLPwQLAjczE6ePqFnCjzAxoLsjgA3ajyWNfTRbYNBzGpQYZVVJ1Y92P0O7pWPvJ1sbEN6Mu5qOgn/GJeFcqJAxp9pXXGULpEuS36nP6MfIJ17IL9AbJm+36zXq+/GgmJPVbhJffhZU4PGKZaNBrqVmdwf3KjNghPKwnLUA5K/6xzymstgOAaQVugCcIPC8BC85bIOVCGaTU1HGFRXx2vsln1U7d9woL7PCn5pCh6FhNXb4CyllaijgmeN9NWQskNtviCoPG3PhyZiC2XCkGYl/d5LN05d3IzKzzU9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(122000001)(8936002)(6512007)(6506007)(71200400001)(8676002)(91956017)(316002)(966005)(76116006)(53546011)(66946007)(66556008)(66476007)(66446008)(54906003)(6916009)(64756008)(86362001)(4326008)(6486002)(478600001)(5660300002)(33656002)(41300700001)(2906002)(36756003)(38070700009)(26005)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EF444DCB77E494EA1F2576C431A28CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6274
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a080487d-5d41-4f8e-053a-08dbef6194e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yrtk36C1cVE5hGJxLF4S3KUCVhBEout+o/Zr/ErjUt2+0j2JOEkz+RCS1VKcGjr72bG+a2nUUVdRIwRB6col+2myvbZKWFHXA6kocPK9G1uwjrQw12bu6UK1P6ZM4jLD/w6YPmLv95N0Rd7cTE2FeEsOG+oVJGDJPrvPZ0nfiHPkU1x4VUV8No9kBwY8vVkHgsFAFLUPFQwWRMNMKD2H62oYMEYdcQDeqsWXYAt5vr5nZSx3D0kmejUFn5Rt7/sq0kCHw0TU3BtV/XD4eb1nA3mKBSuZdO7vDd4rbQNvkJh4rNtRGOfG6eG3TCI3ElZmcP6ng3DVs1ZUqjwS40QB3MvICqG8fEcWQvgxzkdF59nCXwraCCwHz4xx2LBc2NObto4sbp9gXSTnBb87K75O2GDG4AuiUZWLrl/q9k44iwIDAJrPSYmex0ye3jxNn3y9kn9VDP6A602dkP+nQVo3GOCYGBAoGzpWMTu8uK3zM63LXX6pbyXi2OmaWZqD5YklKCvy/DWciLYxz8iTiC/I2KN+mJPuTn5oEmKTOsjkh6p/51NPIHTeZMaBM5FeX1fiw5avS2C0YZeXeVdJWSPfNY6a7/WCES7Ni40yAL5uwlUi47St8puX8VSF3Xya9CYPHOGkt7tk5bAuuHaGmBxHjx4X3J50k9VjL0Nn6QIap8IVvJyVHOeTXVt4RenSDbLLHXg90zMTOgZDDHzw3Pu4peLEYTIvUaz9Z4J35pqzpTpmN5j8WxnvQfHayr22xLJ7ObvPDfZlhScaxX9Cn4d+Zg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(36860700001)(33656002)(36756003)(82740400003)(81166007)(356005)(40460700003)(86362001)(53546011)(6512007)(6486002)(966005)(6506007)(478600001)(5660300002)(6862004)(4326008)(8676002)(8936002)(54906003)(70586007)(70206006)(316002)(41300700001)(47076005)(40480700001)(2906002)(336012)(26005)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:57:50.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5842b22-1706-4dcc-7682-08dbef619bcb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8039

DQoNCj4gT24gMjcgTm92IDIwMjMsIGF0IDE1OjU1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjcuMTEuMjAyMyAxNjozNywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMjcgTm92IDIwMjMsIGF0IDE1OjEzLCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDI3LjExLjIwMjMgMTU6
NTgsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBPbiAyNyBOb3YgMjAyMywgYXQgMTI6MjAs
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAyNC4xMS4y
MDIzIDE1OjUyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+PiBPbiAyNCBOb3YgMjAyMywg
YXQgMTI6NDcsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+
IE9uIDIzLjExLjIwMjMgMTU6NDcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+PiBMZXTi
gJlzIGNvbnRpbnVlIHRoZSBkaXNjdXNzaW9uIGFib3V0IGNsYW5nLWZvcm1hdCBjb25maWd1cmF0
aW9uLCB0aGlzIGlzIHBhcnQgMiwgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYXJlOg0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiAtIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAyMy0xMS9tc2cwMDQ5OC5odG1sDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFlvdSBj
YW4gZmluZCB0aGUgc2VyaWUgaW50cm9kdWNpbmcgY2xhbmctZm9ybWF0IGhlcmU6DQo+Pj4+Pj4+
PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2NvdmVyLzIw
MjMxMDMxMTMyMzA0LjI1NzM5MjQtMS1sdWNhLmZhbmNlbGx1QGFybS5jb20vDQo+Pj4+Pj4+PiBh
bmQgdGhlcmUgaXMgYWxzbyBhIHBhdGNoIGxpbmtlZCB0byBteSBnaXRsYWIgYWNjb3VudCB3aGVy
ZSB5b3UgY2FuIGZpbmQgdGhlIG91dHB1dCBmb3IgdGhlIGh5cGVydmlzb3IgY29kZS4NCj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4gRm9yIGEgZnVsbCBsaXN0IG9mIGNvbmZpZ3VyYWJsZXMgYW5kIHRvIGZp
bmQgdGhlIHBvc3NpYmxlIHZhbHVlcyBmb3IgdGhlbSwgcGxlYXNlIHJlZmVyIHRvIHRoaXMgcGFn
ZToNCj4+Pj4+Pj4+IGh0dHBzOi8vY2xhbmcubGx2bS5vcmcvZG9jcy9DbGFuZ0Zvcm1hdFN0eWxl
T3B0aW9ucy5odG1sDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IE91ciBjb2Rpbmcgc3R5bGUgZG9lc27igJl0
IG1lbnRpb24gYW55dGhpbmcgYWJvdXQgYWxpZ25tZW50LCBzaGFsbCB3ZSBhZGQgYSBuZXcgc2Vj
dGlvbj8NCj4+Pj4+Pj4+IEkgY2FuIHNlbmQgcGF0Y2hlcyB3aGVuIHdlIHJlYWNoIGFncmVlbWVu
dCBvbiBlYWNoIG9mIHRoZXNlIHJ1bGVzLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+
IFF1YWxpZmllckFsaWdubWVudDogQ3VzdG9tDQo+Pj4+Pj4+PiBRdWFsaWZpZXJPcmRlcjogWydz
dGF0aWMnLCAnaW5saW5lJywgJ2NvbnN0JywgJ3ZvbGF0aWxlJywgJ3R5cGUnXQ0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+IEZvciDigJxRdWFsaWZpZXJBbGlnbm1lbnTigJ0gSSBj
aG9zZSBDdXN0b20gaW4gb3JkZXIgdG8gYXBwbHkgaW4g4oCcUXVhbGlmaWVyT3JkZXLigJ0gYW4g
b3JkZXIgZm9yIHRoZQ0KPj4+Pj4+Pj4gcXVhbGlmaWVycyB0aGF0IG1hdGNoIHRoZSBjdXJyZW50
IGNvZGViYXNlLCB3ZSBjb3VsZCBzcGVjaWZ5IGFsc28g4oCcTGVhdmXigJ0gaW4gb3JkZXIgdG8g
a2VlcA0KPj4+Pj4+Pj4gdGhlbSBhcyB0aGV5IGFyZS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFdoZXJl
IGRvIGF0dHJpYnV0ZXMgZ28gaW4gdGhpcyBzZXF1ZW5jZT8NCj4+Pj4+PiANCj4+Pj4+PiBJIHRo
aW5rIGZ1bmN0aW9uIGRlY2xhcmF0aW9uL2RlZmluaXRpb24gYW5kIHZhcmlhYmxlcy4NCj4+Pj4+
IA0KPj4+Pj4gSG93IGRvZXMgdGhpcyByZWxhdGUgdG8gbXkgcXVlc3Rpb24/IEkgYXNrZWQgYWJv
dXQgdGhlIHNlcXVlbmNlIG9mIGVsZW1lbnRzDQo+Pj4+PiBsaXN0ZWQgZm9yIFF1YWxpZmllck9y
ZGVyOiwgd2hlcmUgYXR0cmlidXRlcyBkb24ndCBhcHBlYXIgYXQgYWxsIHJpZ2h0IG5vdy4NCj4+
Pj4gDQo+Pj4+IFNvcnJ5LCBJIG1pc3JlYWQgeW91ciBxdWVzdGlvbiwgYXR0cmlidXRlcyBhcmUg
bGlrZSBpbnZpc2libGUgZm9yIHRoZSB0b29sLCB0aGV5IGNhbiBiZSBwbGFjZWQgd2hlcmV2ZXIg
YmV0d2Vlbg0KPj4+PiBlYWNoIG9mIHRoZSBRdWFsaWZpZXJPcmRlciBpdGVtcy4NCj4+PiANCj4+
PiBIb2hvLCBvbmUgdGhpbmcgd2hlcmUgdmFyaW91cyBvcHRpb25zIGFyZSB0b2xlcmF0ZWQuDQo+
Pj4gDQo+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBBbGlnbkFmdGVyT3BlbkJyYWNrZXQ6IEFsaWduDQo+Pj4+Pj4+PiANCj4+Pj4+
Pj4+IC0tLQ0KPj4+Pj4+Pj4gVGhpcyBvbmUgaXMgdG8gYWxpZ24gZnVuY3Rpb24gcGFyYW1ldGVy
cyB0aGF0IG92ZXJmbG93cyB0aGUgbGluZSBsZW5ndGgsIEkgY2hvc2UgdG8gYWxpZ24gdGhlbQ0K
Pj4+Pj4+Pj4gdG8gdGhlIG9wZW4gYnJhY2tldCB0byBtYXRjaCB0aGUgY3VycmVudCBjb2RlYmFz
ZSAoaG9wZWZ1bGx5KQ0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBlLmcuOg0KPj4+Pj4+Pj4gc29tZUxv
bmdGdW5jdGlvbihhcmd1bWVudDEsDQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYXJndW1lbnQyKTsNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFRoZSBhYm92ZSBtYXRjaGVzIG5laXRo
ZXIgb2YgdGhlIHR3byBnZW5lcmFsbHkgcGVybWl0dGVkIHN0eWxlczoNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IHNvbWVMb25nRnVuY3Rpb24oYXJndW1lbnQxLA0KPj4+Pj4+PiAgICAgICAgICAgICAgICAg
IGFyZ3VtZW50Mik7DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBzb21lTG9uZ0Z1bmN0aW9uKA0KPj4+Pj4+
PiAgICAgYXJndW1lbnQxLA0KPj4+Pj4+PiAgICAgYXJndW1lbnQyKTsNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IFRoZW4gYWdhaW4gZnJvbSBpdHMgbmFtZSBJIHdvdWxkIGluZmVyIHRoaXMgaXNuJ3QganVz
dCBhYm91dCBmdW5jdGlvbg0KPj4+Pj4+PiBhcmd1bWVudHM/DQo+Pj4+Pj4gDQo+Pj4+Pj4gSSB0
aGluayBpdCBhcHBsaWVzIHRvIHBhcmFtZXRlcnMgYW5kIGFyZ3VtZW50cyBvZiBmdW5jdGlvbnMg
YW5kIG1hY3JvLCBnaXZlbiB0aGUgZGVzY3JpcHRpb24gaW4gdGhlIGRvY3MuDQo+Pj4+Pj4gDQo+
Pj4+Pj4gSSBzZWUgeW91ciB0d28gc25pcHBldHMgYWJvdmUgYnV0IEnigJl2ZSBhbHdheXMgZm91
bmQgYXQgbGVhc3Qgb24gYXJtIGEgcHJlZG9taW5hbmNlIG9mDQo+Pj4+Pj4gdGhlIHN0eWxlIGFi
b3ZlIGZvciBmdW5jdGlvbnMsIHNvIGFyZ3VtZW50cyBhbGlnbmVkIGFmdGVyIHRoZSBvcGVuaW5n
IGJyYWNrZXQsIGZvciBtYWNyb3MNCj4+Pj4+PiB0aGVyZSBpcyBhIG1peC4NCj4+Pj4+IA0KPj4+
Pj4gVGhlIGxhdHRlciAiYWJvdmUiIHJlZmVycyB0byB3aGljaCBmb3JtIGV4YWN0bHk/IFRoZSBv
bmUgeW91IG9yaWdpbmFsbHkNCj4+Pj4+IHNwZWxsZWQgb3V0LCBvciB0aGUgZm9ybWVyIG9mIHdo
YXQgbXkgcmVwbHkgaGFkPw0KPj4+PiANCj4+Pj4gSW4gbXkgcmVwbHkgSSB3YXMgcmVmZXJyaW5n
IHRvIHRoZSBvbmUgSSBvcmlnaW5hbGx5IHNwZWxsZWQgb3V0Lg0KPj4+IA0KPj4+IEJ1dCB0aGF0
J3MgcHJvcGVybHkgbWFsZm9ybWVkLCBmb3Igbm90IGFsaWduaW5nIGFyZ3VtZW50MiB3aXRoIGFy
Z3VtZW50MS4NCj4+PiBXaGVyZSBhcmUgc3VjaCBjb25zdHJ1Y3RzIGNvbW1vbmx5IHVzZWQ/IEkg
anVzdCB0b29rIG9uZSBleGFtcGxlIChjcHVlcnJhdGEuYykNCj4+PiBhbmQgb25seSBmb3VuZCBt
eSBmaXJzdCBmb3JtIG9mIHdyYXBwaW5nLg0KPj4gDQo+PiBJIGhhZCB0byBnbyBiYWNrIHRvIHRo
ZSB0aHJlYWQgdG8gcmVhbGlzZSB0aGVyZSB3YXMgc29tZSBzdHlsZSBpc3N1ZSwgdGhlIHNuaXBw
ZXQgSSB0aG91Z2h0DQo+PiBJIHNlbnQgYWxyZWFkeSBoYWQgYXJndW1lbnQyIGFsaWduZWQgdW5k
ZXIgYXJndW1lbnQxLCBsaWtlIHRoaXM6DQo+PiANCj4+IGUuZy46DQo+PiBzb21lTG9uZ0Z1bmN0
aW9uKGFyZ3VtZW50MSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmd1bWVu
dDIpOw0KPj4gDQo+PiBFdmVuIG15IHdvcmRpbmcgd2FzIG5vdCByZWFsbHkgYWNjdXJhdGUsIGFz
IEkgbWVhbnQ6DQo+PiDigJxUaGlzIG9uZSBpcyB0byBhbGlnbiBmdW5jdGlvbiBwYXJhbWV0ZXJz
IHRoYXQgb3ZlcmZsb3dzIHRoZSBsaW5lIGxlbmd0aCwgSSBjaG9zZSB0byBhbGlnbiB0aGVtDQo+
PiAqYWZ0ZXIqIHRoZSBvcGVuIGJyYWNrZXQgdG8gbWF0Y2ggdGhlIGN1cnJlbnQgY29kZWJhc2Ug
KGhvcGVmdWxseSnigJ0NCj4+IA0KPj4gU28gdG8gc3VtbWFyaXplLCB0aGlzIHZhbHVlIGZvcm1h
dHMgdGhlIGNvZGUgdG8gaGF2ZSBvdmVyZmxvd2luZyBhcmdzL3BhcmFtIGFsaWduZWQgYWZ0ZXIN
Cj4+IHRoZSBvcGVuIGJyYWtldC4NCj4gDQo+IEJ1dCB0aGUgZXhhbXBsZSBhYm92ZSBfYWdhaW5f
IGRvZXMgbm90IGhhdmUgdGhlIHR3byBhcmd1bWVudHMgYWxpZ25lZC4NCj4gSSB3b3VsZCBoYXZl
IHN1c3BlY3RlZCBhIG1haWwgVUkgaXNzdWUsIGJ1dA0KPiBodHRwczovL2xpc3RzLnhlbi5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0xMS9tc2cwMjM2Ni5odG1sDQo+IHNpbWlsYXJs
eSBzaG93cyB3YXkgdG9vIG1hbnkgaW5kZW50aW5nIGJsYW5rcyBvbiB0aGUgMm5kIGxpbmUuDQoN
Ck1tbS4uLiBiZWZvcmUgc2VuZGluZyB0aGUgYXJndW1lbnRzIHdlcmUgYWxpZ25lZCwgYXJndW1l
bnQyIHVuZGVyIGFyZ3VtZW50MSwNCknigJltIHVzaW5nIOKAnG1haWzigJ0gZnJvbSBNYWMgT1Ms
IGRvbuKAmXQga25vdyB3aGF0IGlzIGdvaW5nIG9uLi4uDQoNCg0KPiANCj4gSmFuDQoNCg==

