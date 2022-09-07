Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196A5B0512
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401706.643612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv1s-0007re-TN; Wed, 07 Sep 2022 13:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401706.643612; Wed, 07 Sep 2022 13:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv1s-0007ob-QV; Wed, 07 Sep 2022 13:23:44 +0000
Received: by outflank-mailman (input) for mailman id 401706;
 Wed, 07 Sep 2022 13:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVv1s-0007oT-4X
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:23:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b7ac57b-2eb0-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:23:43 +0200 (CEST)
Received: from AM5PR1001CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::25)
 by DB9PR08MB7867.eurprd08.prod.outlook.com (2603:10a6:10:39e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 13:23:41 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::eb) by AM5PR1001CA0012.outlook.office365.com
 (2603:10a6:206:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:23:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:23:41 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 07 Sep 2022 13:23:40 +0000
Received: from b2b45f542b33.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 305F218E-004C-480C-BD8A-3F8E5FD7FA06.1; 
 Wed, 07 Sep 2022 13:23:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2b45f542b33.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:23:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9692.eurprd08.prod.outlook.com (2603:10a6:20b:604::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 13:23:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:23:27 +0000
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
X-Inumbo-ID: 4b7ac57b-2eb0-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fzGcc0t1PrWrGJ0HsbBvFyZ3+YLkxuapu+Iun9/fLl+6eVtY/GYA65dc9Z8NmCiHXysB4+TzZbkzJ/YkSlgZEL1Exhd8cRQE/2Wd15y8QeG6OLMh5AoBjevpRLbw39ubOM1IScSVefMVijXSn5wOnGTfSDqvf1Ee+F47kAhvl3exbNDoNpDIEvCAlozpg3SNCgHuCEZ0t8PoloGgnpSItXNUysvb+sy7N7QnHEgB3dH3dNlK6ey93eG4o6tXLNUaI3ATWLlmOP4IgojnHMOt1cwq/R0AaPQ2lrAWYawGE9trFD1ifHvc9jhNPh6Z4ww2mUgcIGIHDQZES4NucYslCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC2PthZ9nIyxbUBb8wmSNNGbLyqH4j5Y9GpvsILWGI8=;
 b=JJWid93T5BUeTB0w78yxwCJYAzucr3Ql7rlda0Vzp8nY55u8xNY9Rw5Tg2J1KCfhSdr8IZo8gYrqjgqnfwMm94GCvoH+DXDRxY6X7GtrPka7CrUN4EbGIUNhJUA0aI++v3VfvDXrk4cKFF9LEjFOYtc9no3Cjkay0LfUiGCXJW5go9U8+/v1Zqd0uClhmfR2RGnJF9m4z4WWrnPLFS+DsTqxKZfhZ1uz04y8V2zyEkD41I54W2oM80kWkpVbtlbgJroVEZd77nl00hyfGBPfVETbInpXUG0e7CND4jspOvvu4LoT4SGMBlJu/lKP4LiAScCfW/hxPweUnZ4A9e1dsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC2PthZ9nIyxbUBb8wmSNNGbLyqH4j5Y9GpvsILWGI8=;
 b=BEF8FND/ZeXdNxmkUO1uQL0u+BAHy3mUYRaeXktU+8Pl+bCOPCYI1HaYLQPnBLXaqX8eoREP/XuMNPpVD7bDGy/jFlgiAl6BXcNxrW5z4cZZEGVDKh8lLDhpYZIzVCqlLC0iD8vg7vmhs/fOSG11jVWldw0qn1FekWBN2YChUEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c343102b5fef7549
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3wxVYYky6L2NoOiWbBpE8NFpyFq4pTynoCOgQ7vPjE9vZAzUCOQ5p8c7th/Bv0fy1MIDC2ga+F+MA+Whliw57sqlvU5LdbMFxLrpmrB5zXi8Owz5dKFTJps1BESqZaai6VEcLxIaCtR44FiQUSCQe0X8QlxlinVW2dRgqNRFWAoK80PaS+V+ZQiG8t2filuqLsfHfS2Yygylfz0b/P/oliV/lSfHpPCiGsEtPCy4F9LiAHPq811dY3XxDOs1tvx7MgH+++TbN8jTps/vRdyGI/1amwUaP/pY/vZU5PXc9Ych89U6nYZ5awOcV4fpUFkpYLPjD9lUNnza/7b4aglwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC2PthZ9nIyxbUBb8wmSNNGbLyqH4j5Y9GpvsILWGI8=;
 b=nz1Mq/Cb6urKiqaBw/X4UeD9Jerd0bv7uES0UOHlIQI6ysi0Nm3TGJJn+h0+sZy6xBJba4Gdk+ZJ6iCycw0brDE9tIAJwoj8BylGFrSG5aVyDWCEEKWlNfKNr5Y+LG1RClNdskrFhspsWUDU+yJCyl6886m6pDP9FuKw/5eNFjSTqFK8OFV5FU3FQ6PGccHf/I9TdEsIvHYVs97eukvk5ytSHlFZdLIN2yIzyLTR/8qJScNfy5dqQfHpSiwV2gETL5wLQ3y67IT3MslTnHZIojvdB0UICWh1jDYqMZxMuRawC54rCI2bB2kHQQ+hTA3hD6bs5T++R4Al6PZ0MsKgEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC2PthZ9nIyxbUBb8wmSNNGbLyqH4j5Y9GpvsILWGI8=;
 b=BEF8FND/ZeXdNxmkUO1uQL0u+BAHy3mUYRaeXktU+8Pl+bCOPCYI1HaYLQPnBLXaqX8eoREP/XuMNPpVD7bDGy/jFlgiAl6BXcNxrW5z4cZZEGVDKh8lLDhpYZIzVCqlLC0iD8vg7vmhs/fOSG11jVWldw0qn1FekWBN2YChUEw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYwqqLAtgrk5Z7CEC9g3vN92mek63T3yeAgAALyICAAAnBAA==
Date: Wed, 7 Sep 2022 13:23:27 +0000
Message-ID: <22E9182D-2345-4088-A9D6-76E62B110225@arm.com>
References: <cover.1662548825.git.rahul.singh@arm.com>
 <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
 <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
 <11fed186-7295-00b0-4fb9-50d08e63f364@xen.org>
In-Reply-To: <11fed186-7295-00b0-4fb9-50d08e63f364@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6a5e7cad-5dd7-445f-e495-08da90d42e5f
x-ms-traffictypediagnostic:
	AS2PR08MB9692:EE_|AM7EUR03FT052:EE_|DB9PR08MB7867:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rJxEThC95UJLl0rD61WESSdtVPOf3Eq3y2CGJ6wy0+r2XoPIN/3FYX1NyN7vqlG/W9dsb6rHlkWBgtT8xAUczES50iKergA5/+7W1v2SHVxW2X0YEUv7V/8vdqHxcWGiEP6THIJZoFi7HK9j2aMjsaLXnsvq0iBijFCe7d1hjqQwXhAkusNtTMKmdI60ICDdl434mv3+nmZovQJJaVJ/DnmThtKwZnNnbaWXw6HETwqT3rh/tA0aSCQ2HuNhxYIeXE51sAVvB7k0xtBaxsntvbPQcuQgnS2uppD2X6D6gNGqWyEL0oX5Qz3jW/PXEcI6+RYYQLb5hMuympUChoSum03jXNTyFsCBfNhP7fNuV9i7Jrm5dprNTXjkvZan1hvip4MKvsIF0ZgBdJz3UHfEOY7hFbW2nfxXV8SlSvd2oXqzFRneFKDdyZHwUKgOgrWULFp/alS0LnUFESeUHzNhH6SQzGnivDR8r3RJ1rCBlaZxvVhFm6Z04losIf4LTUMayiBSuXA+K/TyR5tSC6b25/V39HnaalHmK/HBztsmIp0l9b5vCAk+5aKlN9TCjNAQsVm1mKIQjECtHf1MtKKpx3vV9LvY05vdtA0YZo5qwjF+S2URdITbyaUw+T2h/M3wV+PBMcxUWf3NWPt9X+wzMGbM5wbWXjv4YTA9ukijxntu2Muywl3oYmVoSI2CPg+IQa8vk95WdJvcNj8c+9iZEN/haVndQyN/gmeUtVFaiHNQ3p6wj7KRIGy9pAwj9SIWv7DSl6rkWykZKCnmySzKsWsgxAwaX3be65EhdKGL+Fg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(38070700005)(4326008)(122000001)(38100700002)(91956017)(66556008)(316002)(8676002)(66946007)(66446008)(66476007)(64756008)(76116006)(6916009)(54906003)(2906002)(5660300002)(2616005)(8936002)(186003)(83380400001)(6486002)(478600001)(53546011)(6512007)(41300700001)(26005)(6506007)(71200400001)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0446FBC473231A47A65DE68EAB491092@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37c81691-bbf4-4340-8bda-08da90d42619
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I8MPpKFtFEODVVQqNGolK6xflfuLxpeAKXPN9lemjOt2IVyXjSr4GVLPzWl04kYsliooh5pcYre/dPef6SPLEBPUmfvMo2Pn9cFbJuaKwIS9989eQ2s5BdTSk+5Zf9QqaKewopSqDbmb1xE4J3iUDnuErUMf7T7HWB2E/ZV4UcMzMJ76og0JbINLoMISIhqmw8PZ7jQ7jirdqwTDSV31kDcGes1XXw4Ljbl4YTiCmSBNk3nr8KRBgbSWK2noTrZFAY8sdXYXo7YxMbakyFmVV0Qx/34TV564v33J9BXiskGF9+otsH8H0UAA2FYtI/dK1H5NNQk7Ov/sl/hOC/DfVMc15lQ5PjJQ3gqpyF1KfZGgMIo/uYUQZ5REjPxpUxLKSKrEX6C3KSV8s+1pyk2oRO5XyR/9spfP80Qg3ukN0XSiYxqdwS8leeNS8djlRktmY/BNnbTTyFiciAO7mwgFHmv2KRK7UUMiaprEL7yaNMQj0sWt1K5kIXMkDGlUFjcscfp4IvqYENaX1P9Z+5ZAqMWaL8fm1v2MIgFszQXG136CBzLbDo6co/S0UG/MagGJucpY0rVJEgC/qZOTqHCK9fVciUx2XUMpDBwE1fdtqLTaC+XMdEWjmTCB/2L8Ngj8BN7p0J6R7mqhZiFVORBGDlHaaRox/jIIg6/MCesNPQgHBaYRJjj7NMdK/RhDxDQAqZ3jEZ6SWA79GLDXVkmEszdcN3BvpdT+XFaGhhwvcmxSEukPhPlN0cXmJ3eBSSomF3xH6nIE0E8HziBl4cpQhQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(36840700001)(40470700004)(46966006)(356005)(82740400003)(81166007)(33656002)(36756003)(53546011)(186003)(2616005)(36860700001)(6512007)(26005)(41300700001)(336012)(86362001)(6506007)(47076005)(54906003)(82310400005)(316002)(70206006)(40460700003)(6486002)(83380400001)(8676002)(70586007)(478600001)(4326008)(2906002)(5660300002)(40480700001)(8936002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:23:41.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5e7cad-5dd7-445f-e495-08da90d42e5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7867

Hi,

> On 7 Sep 2022, at 13:48, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 07/09/2022 13:06, Jan Beulich wrote:
>> On 07.09.2022 13:09, Rahul Singh wrote:
>>> is_memory_hole was implemented for x86 and not for ARM when introduced.
>>> Replace is_memory_hole call to pci_check_bar as function should check
>>> if device BAR is in defined memory range. Also, add an implementation
>>> for ARM which is required for PCI passthrough.
>>>=20
>>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>>> is not overlapping with any memory region defined in the memory map.
>>>=20
>>> On ARM, pci_check_bar will go through the host bridge ranges and check
>>> if the BAR is in the range of defined ranges.
>>>=20
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Changes in v4:
>>>  - check "s <=3D e" before callback
>>>  - Add TODO comment for revisiting the function pci_check_bar() when
>>>    ACPI PCI passthrough support is added.
>>>  - Not Added the Jan Acked-by as patch is modified.
>> Hmm, I don't see any change to the parts the ack covers (x86 and common)=
,
>> so please re-instate. I'm not in the position to ack Arm changes; things
>> would be different for a Reviewed-by without scope restriction.
>=20
> I would like the question about the BAR alignment to be resolved before g=
iving my Reviewed-by/Acked-by here.

In here we have a range specified by the host controller and the bar should=
 be strictly inside that range.
Now if the controller range is not properly aligned, there is an error in t=
he device tree or ACPI table or in the firmware and we should have detected=
 that earlier.

The itself BAR should fit inside the controller range boundary.

If the BAR start and end are not properly aligned we cannot map them so thi=
s should be an error (if we have to map them).

I am not entirely sure we should try to check this here or maybe would it b=
e easier to fail if addr is not aligned or size is not aligned if we want t=
o check something.

Bertrand


>=20
> Hopefully Stefano can clarify it.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


