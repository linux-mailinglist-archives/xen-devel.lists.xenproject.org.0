Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709767E6D67
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 16:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629714.982075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r16vO-0004o4-Mj; Thu, 09 Nov 2023 15:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629714.982075; Thu, 09 Nov 2023 15:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r16vO-0004lg-K0; Thu, 09 Nov 2023 15:26:30 +0000
Received: by outflank-mailman (input) for mailman id 629714;
 Thu, 09 Nov 2023 15:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6cS=GW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r16vM-0004kP-VG
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 15:26:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 592a5520-7f14-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 16:26:27 +0100 (CET)
Received: from AS9PR06CA0343.eurprd06.prod.outlook.com (2603:10a6:20b:466::26)
 by DB9PR08MB6474.eurprd08.prod.outlook.com (2603:10a6:10:255::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 15:26:20 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:466:cafe::5d) by AS9PR06CA0343.outlook.office365.com
 (2603:10a6:20b:466::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 15:26:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 15:26:18 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Thu, 09 Nov 2023 15:26:18 +0000
Received: from 6b96da4c07ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C04B0B07-E5A4-492A-A97C-AF920EECE94B.1; 
 Thu, 09 Nov 2023 15:26:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b96da4c07ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Nov 2023 15:26:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6395.eurprd08.prod.outlook.com (2603:10a6:10:254::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 15:26:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 15:26:03 +0000
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
X-Inumbo-ID: 592a5520-7f14-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AilNS/OfuGsSH5rbXo1cxB2/TD34aSwv9sOUl5X1KMKKKWd18WYn2errpEXxTQd1vhbeMmy20jJEwcTG/i4D6BwNGE9wtRgPK8K+CTpZlQTFKAJlCrFQVzkjzFumfy4DfuUj4DdqiZ8xL7lvMn/vl/63rzd4ji5j7m1dsT4eDVLB5nUskdjuQOKfCouGNPsh3rZEi42PoyYYtr8eLxbVUoaDORfnTBxDMbFN3FmPBNt1O+1+YFxcmxcmB16NedvP7jT7XcsJ0qHcznQ6zkZDh31qpCgw2jOk+Gk/kTSMZEDNUcIADckyx5saTbxriu7tRNzdo7z/A46QShQVs5fnEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+onWsxtyX/w6HWGFNvhf0glyoxfq7tyA8Ffyh4DhmFc=;
 b=mKRx7mJ963P9TX1NPRWySLm1C/MWXxLZ5L9x85BCbRkXBxJcc4p1bkMp6yOut3snokHC5Xg5GfSL08Ytij7b3INXLMTZQGqXBo0+I8RW4VXnWCDyALWinl07pQN3ysdoECpOTo+ohmR5ibW+Cv/LY3K6BiyFV7x+boqSX1xzevFrtyrzNPDY0j3Gtoq4FgT7jomHchQjsmsZlHqYi4SPKZrx3dV3Ny+aplwrm/kULxs6umO1joDuZiPHuZpqCJTqogiaV1R0FKeSaG28o9BinE53MOTPTd5KN4AAUITgEmqNVXI4ei2xssXdpC5UalcKeJOmgc0TCk8FXl8CUa0I9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+onWsxtyX/w6HWGFNvhf0glyoxfq7tyA8Ffyh4DhmFc=;
 b=PHU18rq6hI7nj/QfV5cDvgEmtTPYNHEueIXkMXIMBxxXAJ2HJzfxSq8Bz4F5cBwmc89RgZI7TtSP537dogXEByGkoQtgO54G44YdKjgZN9LbaCVbkjEAp3vwdK9yI5za43Z4sARyPMEeHZdmTyW06yHXMGDezuoKHCQOyM76zAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: adde4a790d4c2882
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bv/5PXHrLtrmpLIaqS1Bk4hg84Q9GIzctvIOKaKOGGl6ByfFVB+A013uzjlU7iYiBj+W9nsQfrYOFQLKZfsgZVlPteqTiOyfk3FZnT4KDmDkKW92025F1VsWFbDLublmRKraHbgte1RIh/apgczeFvVF33+LGTlS3strYDx/nwp8p+q0zjr2gHsBpl4jcDAe17q9uOtTeqAzG9aVjGgXpO/XgJu4V2heTGmSKoksufXQv68gWhjkLg35C2AJopsAqbAYIJ+XKDKtwL/zVflzeNp6KTSnlm1CG5wfM4FaEeMmrO0XO+1C6CKH1PuW+QlBEwGjxs19oQg9Ezkt7GaG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+onWsxtyX/w6HWGFNvhf0glyoxfq7tyA8Ffyh4DhmFc=;
 b=MkbJ+1u6ZM1YRQbxsmee4CrvzzOMxWv3okwwas2TYG8mljdoeiVzl7+zaLdExA/b1nikM6abUQDiewZzi6i3ElzgWqZc0btb6J3G9OkLvgrmu2ZWNzfFOqeSUnf+HeG+1WRRym/0+IMU95H/TU0VMAPq0A2I2ZOeIu/yfqnnjE5w4T/XLctwuFVPf61tu8RobdivqB/wgZOrFbnZ3qTan/Eg/SBVcj7zTx3GTc9NOlKnvhh2Qr3wQ5TjeoaBDBBrNpWp13147+Hz62eTdizt7h3IjvQE7h085R6aAC+ps1/8oiLMZq/KoqdckeBetMgsC8SFt04rRYn4qM/A7LDz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+onWsxtyX/w6HWGFNvhf0glyoxfq7tyA8Ffyh4DhmFc=;
 b=PHU18rq6hI7nj/QfV5cDvgEmtTPYNHEueIXkMXIMBxxXAJ2HJzfxSq8Bz4F5cBwmc89RgZI7TtSP537dogXEByGkoQtgO54G44YdKjgZN9LbaCVbkjEAp3vwdK9yI5za43Z4sARyPMEeHZdmTyW06yHXMGDezuoKHCQOyM76zAM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaEuwcMi2uzYg9sUaekJ4uQMuKYLBx1QmAgABHKwA=
Date: Thu, 9 Nov 2023 15:26:03 +0000
Message-ID: <305BEDEE-7191-4EA5-8BCF-C92A1CF21D32@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-4-luca.fancellu@arm.com>
 <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
In-Reply-To: <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6395:EE_|AMS0EPF0000019B:EE_|DB9PR08MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 7850ccf6-ba26-4843-4bde-08dbe138389e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j901oB0h9ba55W76d2OsnO13wREgWap+uGDlpsm52PRQ7NiPGHRZ8efgSZCMZN4aunt3316uZ+d9S+v3GOOwENa/Q2dge87Nth5fo2LAs1qU6rryhhtHlFO/GwC2cdCVFSmUkzFxXuFYW/PcdvmryvqoefO3REOn1CdPTBiyTg/DnDtHVUQyqeU4cd58LePvIozI/qunTjbCra3psLS3+6DwGLZGY1tdt6wzlPMY8NxLJDChYsDm7HzQagYz1DW8M2TYu6ikhlqdwHAxG5KTbF3sjirHEtmyPwZeT64TpYE30UMlsOoBdePYdeE3u+D+WrZOx8VY8GYj9i8F7R2oMIPw5TQ7H+tOqMXUIVl9kvnV0sn+12Kvo7sh2TgHRA6kZ5Rpn9CBhpWEaBnNRJz/O7CbuC5bOwTjitrk8sG6g3ptCMOv5H/XGSuiYcIiR0W5trT/o9GfhPkot4ZPDKHHUEDuqTOcDSrOJk4GVoxvcSvAC3xHMibQ4fkqj4PPs/YPjsJLCgI/mPvA8mEKf2tCA4w04I4aPZOMgMSQjMBs4KD6ZkYxbKh+RLBmDisa/nmRjMnFBzxtSs066VK/atz1mp8CFU4fldz1gGfFN6JozxiDrOM+2X3ljtRECsl0Rg9/tHJGm/T9yGtSJeqVryyZwGYAz/eU1m1bJRx8T6Ad6TSGHAAWG8wMV1P7DaG1zR5zMyOu58pLuRaC2Mki/gwqKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(1800799009)(451199024)(66556008)(2616005)(6506007)(6486002)(53546011)(6512007)(478600001)(71200400001)(41300700001)(2906002)(76116006)(26005)(64756008)(66946007)(66446008)(316002)(54906003)(38070700009)(8936002)(91956017)(4326008)(5660300002)(8676002)(83380400001)(66476007)(6916009)(33656002)(38100700002)(36756003)(122000001)(86362001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A35F6866B6C0D544965B8709AE9BA106@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6395
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f038d828-c55b-4a85-8cc5-08dbe1382f6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8GB1o/x3FiCI8DsMlO5a12WKymRvLGbOuVzSz/0PGFJTe8WA4tYJbCMJpBCMJx7tlS1d/7xhJWWOhkXj3d/7DVPKSIGoZaxYMGacuICQv/lMHsYDm45ofEGkAEe3308xIuSDBbZzahV+Libe3/1lIngtSuv/55KRxbGczVaYm+yW61hfFkwJrGMGWJHVRHuj2zTo3D+Yo8BQsKImgTqg+srnGPsAW/Fjw0AmeZuIIH6Di9P+kPDHQYoKql9vySsoVc2DFX+sWbiq6IKttHatbTEWG3GCO1irGYBwctouWyWJwn3IPqWYqCbiFqQBn/wEKHtBAOC0HBhpaaozMQP9p+7kvkSRlzQ0wnNlmcm4d/Tf8MWP0CLK8XwVBZX+OjnDQbB0OvjDg2JbZ1rKXLNEXylIT0lF0dw7SBcQkBOpcdogGhwEsTphI0S/+3btrT21wvahioC8/cD1UREMuMke48XoOQb1ArHzEavQgyTK8DxWkbUTEs/PSOBJ97byylIY3fns8fDa/tIg/cWOBAcaS+wuGMpbvJwYpz6qrMOFAXhIow+iA1p2/UpPndY2ZXi8LtOUSSOynwnppiaRQwrvi9kG4cEgzxL1tShn3P94RPtRIVtaOvK6irjXqZSisMHY2aPAHegc6VMDoau/XoezUFrulgX7V7/kxcEwlRg4+BqL5sFClHkog0TzkhG4rsE5dWuTFw6ouCgAwhTv/8f65pc9SdiHplqoUb9LTpP/vukO9NeuTRMhCbF7Mx0LiTzoKxM5GWRWyPhJeExrqJ7yFHHDYFUUdYe7chZJnR2sdO7hiXVUTL5t0Q2Umcn5oEEq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(5660300002)(8936002)(8676002)(6862004)(4326008)(6486002)(478600001)(2906002)(41300700001)(40460700003)(316002)(40480700001)(54906003)(70206006)(70586007)(53546011)(36756003)(36860700001)(86362001)(26005)(336012)(107886003)(2616005)(356005)(47076005)(81166007)(33656002)(6506007)(82740400003)(83380400001)(6512007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 15:26:18.6904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7850ccf6-ba26-4843-4bde-08dbe138389e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6474

Hi Michal,

> On 9 Nov 2023, at 11:11, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> On 09/11/2023 10:06, Luca Fancellu wrote:
>>=20
>>=20
>> Currently the dom0less feature code is mostly inside domain_build.c
>> and setup.c, it is a feature that may not be useful to everyone so
>> put the code in a different compilation module in order to make it
>> easier to disable the feature in the future.
>>=20
>> Move gic_interrupt_t in domain_build.h to use it with the function
>> declaration, move its comment above the declaration.
>>=20
>> The following functions are now visible externally from domain_build
>> because they are used also from the dom0less-build module:
>> - get_allocation_size
>> - set_interrupt
>> - domain_fdt_begin_node
>> - make_memory_node
>> - make_resv_memory_node
> This one, despite the name, is strictly related to shmem. Shouldn't we mo=
ve it to static-shmem?

Yes you are right, good catch!

>=20
>> - make_hypervisor_node
>> - make_psci_node
>> - make_cpus_node
>> - make_timer_node
>> - handle_device_interrupts
>> - construct_domain
>> - process_shm
>> - allocate_bank_memory
> What about static event channels? Does it make sense to leave it unguarde=
d? Reading the docs,
> it looks like at least one domU needs to be present (dom0-domU or domU-do=
mU). Hovever, looking at the code it should
> be possible for a loopback. That said, I don't really find it useful give=
n that loopback does not really need this feature.

I think you could be right, but maybe it ought to be on a module on its own=
? Like static-evtch.c? I would like to ear the opinions
of the other maintainer on that, since it might be controversial as you exp=
lained above.

>=20
>>=20
>> The functions allocate_static_memory and assign_static_memory_11
>> are now externally visible, so put their declarations into
>> domain_build.h and move the #else and stub definition in the header
>> as well.
>>=20
>> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
>> externally visible.
>>=20
>> The function allocate_bank_memory is used only by dom0less code
>> at the moment, but it's been decided to leave it in domain_build.c
>> in case that in the future the dom0 code can use it.
>>=20
>> Where spotted, fix code style issues.
>>=20
>> No functional change is intended.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes from v2:
>> - move allocate_bank_memory back in domain_build.c, remove header
>>   from dom0less-build.c.
> I can see you removed the copyright from .c but .h still has it. This als=
o
> applies to other newly introduced files that were subject only to code mo=
vement.

Yes I forgot about it, I will remove it in the next push

>=20
> ~Michal


