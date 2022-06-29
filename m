Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D256021D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 16:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357891.586758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6YP5-0001px-4U; Wed, 29 Jun 2022 14:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357891.586758; Wed, 29 Jun 2022 14:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6YP5-0001nH-0Z; Wed, 29 Jun 2022 14:10:51 +0000
Received: by outflank-mailman (input) for mailman id 357891;
 Wed, 29 Jun 2022 14:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiI7=XE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6YP2-0001mM-Mn
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 14:10:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 461c17cc-f7b5-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 16:10:48 +0200 (CEST)
Received: from DB9PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::34) by PAXPR08MB7394.eurprd08.prod.outlook.com
 (2603:10a6:102:2bc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 14:10:45 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::a5) by DB9PR01CA0029.outlook.office365.com
 (2603:10a6:10:1d8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 14:10:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 14:10:44 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Wed, 29 Jun 2022 14:10:44 +0000
Received: from 5dd2a8c47862.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 550DCC43-EDF1-46BC-B5DA-FEE3ACA28835.1; 
 Wed, 29 Jun 2022 14:10:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5dd2a8c47862.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 14:10:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 14:10:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 14:10:30 +0000
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
X-Inumbo-ID: 461c17cc-f7b5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F5RUAaUarZ7yrnNs52O45ant0jRFbVwc5zcocZl8Cb/X0Ycp2rurd3lls1pO5AY/5ohHPDzv19f4NRIix7+lLHmEsf1ujOOGvBzkiAM4FE4zDIMpkMn4fjt+CECkiVSDoyzgNmefq71UOYn7UsovhdCi4hpeZnRbpG7ofrVfxxfVFc2mZoSmgbgYhMNaHSRuJm3HKI7+FrxsLLtmDDCdY11JYljXbAWD/WjInLRiF/ykKIdyhl4isEI0FWBV8BGU4PryMbjgfrA4XvJKgS7mMUigO40gwQMqomaaeDOmDy8dpuBWyD+zS+p0fNJ4/8q7LYax0rKiAlpyyHxKYC8TZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud/+5UlDKigZrJ+APK41c0mg/Zd9qlvEZ0mAhSJ3m5k=;
 b=Gym/TCSp7s6ML9BvvYfTAG0VsqZQOKMllL5TGh9B4F9ptd1x7nVEC6kEkAnR2qVCMYcxnUhIMkBwHEi9Xdm7hDjrqvk/DJqRXRLx2WxrhQIK1iJQatQN4sbxdEwVHe42iZ3n4FNaZJULRYQqjuACGh2N3CsuD8fUSTmsI+gFi+SAUoX51ETsLCVpA7wxWa85oCDS/vfiWrNPmJNmK8Php1YQNsl8ljspOVb2/DTidGcnFO+5HGVOB3FpACrnPVn+bdmx9j+WunuH9teukqmKSpN7AqxuT2EwwsiianfzGcdbM2zCIijuQmn8vRs359L4GP1hszSdNMBNrgiDzaNfTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud/+5UlDKigZrJ+APK41c0mg/Zd9qlvEZ0mAhSJ3m5k=;
 b=fM03jjBgLk5j8ZJtgOyYquf1CX7dWjCesaX25ucaK2jwoi08SMiC0Phq5994l3raJ+4VHuOOitsMfPZYZ3jxhqYv0OBaw83exDv864plUK9D07CAdegI1r2ht/FnNLFXCAGsqnzZvTJtcfblPB0Lq60wzNc0ZQxvbG3Zpt4MtLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f4128e47955d2d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZsn7nkYl7a8oy3Cseclrzo/YAwG52TeijlFAq1nh6UNNtc5BcmgL7Ha/k2qqtHRcRd/ZUEgPPMZxYVn4677n6GiFPo8KxBUYzko5Gt9U3dTqW1BqMh4uBAdxH+U1faJJ6LVuAIuUVArHGuo+pBoQ7ORwi6ZAHrmmHog7Icb4C3nR7YVtoO1G+InjKGXsYS40d4KpCjejoXX+j3ie+dPcFT+CkC4zjKv/TIGkyzod2Y5tgox+c3SBV6UbHrzVNA+g78e72hbIBYCDXxqHhjbswShir0bfseiG7L0+cBjtCIS5wOWQpt/XZ84XYDkSsOTRYI72XvUmKM0t/qpBdvELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud/+5UlDKigZrJ+APK41c0mg/Zd9qlvEZ0mAhSJ3m5k=;
 b=afwLNcG8GNdwbeDrdpB+86nooJ7mNoPNrrOxerivJ9DfLowYj2Kj+ZrhSxCvRNp6j16bMuuaUkWM/Lc0zyS55nJPg84n5cREIKDB0US6CdHAh3gUfVln/rs3dk1RQ9CxqoH7oFdj5r9BSDjBveH2oFqnqoEIYTty2pd3HExJJO66kn73hjzJCVsJ/f30mjEEH0HTagTJSIOXfv7iyRh9OCrp9X3QeHgiuOYtcPFm/BlyGTgCFiKMBX05YXsU7K2qmDxoyVLXNkghtyUJpIwa/MA6KEGD7S8YQiMThfoaWIscT9Co6hCL9oaOeCkgOoWbHlIKEXtyxQ52XaqU8UUv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud/+5UlDKigZrJ+APK41c0mg/Zd9qlvEZ0mAhSJ3m5k=;
 b=fM03jjBgLk5j8ZJtgOyYquf1CX7dWjCesaX25ucaK2jwoi08SMiC0Phq5994l3raJ+4VHuOOitsMfPZYZ3jxhqYv0OBaw83exDv864plUK9D07CAdegI1r2ht/FnNLFXCAGsqnzZvTJtcfblPB0Lq60wzNc0ZQxvbG3Zpt4MtLA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: xenia <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Topic: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Index: AQHYiwEFKAxihkpP+kCxp/TNi89h5q1l/I6AgAAZcwCAAAIrgIAAVcuA
Date: Wed, 29 Jun 2022 14:10:30 +0000
Message-ID: <E0AD2430-78DB-454B-9D76-EB2E24E80E1F@arm.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
 <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
 <1b28f8b2-2153-61f6-515f-b2ed880f84b6@gmail.com>
 <D8C0B798-C736-45CC-A723-1535131F1323@arm.com>
In-Reply-To: <D8C0B798-C736-45CC-A723-1535131F1323@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 072e8266-a702-4b8a-3875-08da59d92821
x-ms-traffictypediagnostic:
	AS8PR08MB6808:EE_|DBAEUR03FT007:EE_|PAXPR08MB7394:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vO2GD/pGj7E4YycpN18byXiuCpTrlGl8VJ3vA0eJNXOHfjlKhlUMFa6A3X+VHsipPhtIY4IooiHJ82TYpVP1CdyAAaD3Nc19yDwup6PLCR4n+HrsGY68KCzccuEAlIRBPVc/kaReN8JgI2WPgKmSAuNsaYa99xot6De9/THfvUid31KfxTDFzgaEz/9ViAxeCJtMbwBqZcYuKRuWHqbvaomte418sFRh/WAn+4e5DnJLH0SseeRiKqHaKegUS20JfT/8pO7jM54HwznYNh5tKIetrvEGEpnS92NgKqMTiQvcPnIOrpN/ykYbOcnXrVSAyQ8p8Zwdg2wBUOlhRFvpIr1sPyQvydG59IIPsZ86YdlRF0VbB4ugkqAYqLnKvYdLAEbuHz6uOKETzhwFWPKyKsQR474JzrL3v3SnvKRjJzIMiA/uI7JmXT4iOdyJ5fnDq1cCpWtPQQh8UyttwfqCnlXdmTz/xPYwZsmgG+V9RbNsS20jrq6BpefLTJvoWfm64tdkoUWakw46xM4iFmMnHf7sE+ckJC51dHmnItM4JwpHgCqLFhWtgIZtPkzgIaXKbQsjF24TsyUuIMinYoOGMI0T2VChqJiOJQWHrD9zqx5h69uo3Hz1+K2DKkH5O8W+Y9q9HZWe5HGRk4AeMECbTAwrtqgReCgaUI8O4mzAuG8TyI3MvsISepEEHmnQ+Vpab7UGCjzwop7IPdV5h7AqlcsyQ5ryDBA1Xq8pddYyQI7Fg7QfZNYJEmT6//oAap2WEO3Nn1Erdoo99WOWfYsxqYOd/WqYphhkdYVfok6H9ViSBEJxjPpUA/4D66v0ugxIaA8V9LXFi2Z7ptVsAMG6gA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(2616005)(66476007)(54906003)(2906002)(122000001)(316002)(38100700002)(186003)(76116006)(8936002)(5660300002)(66946007)(66556008)(83380400001)(64756008)(6916009)(6506007)(38070700005)(53546011)(66446008)(4326008)(41300700001)(8676002)(478600001)(71200400001)(91956017)(6486002)(26005)(33656002)(36756003)(86362001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E5C4AB19BD7934883A79462AC368A79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcd66b13-53cf-4d97-ca8f-08da59d91ff3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fGUKz1bovpIY7d0I+fSgOX+KK+v0o5rAgaR/MBVRbu/8KG9z0yHKJh/2ORc7g1QqHnG2Qz3vQa/bOv7I+i5uyYNFcYlDFei+JfS854pq+GL63qoeLyQqMcLyeW4dJksm0I5szyCZfV5+A9QrKPRzyFNVXqtnQHnX5isW7AvPzDrXG16hHpdTyhGK2ly5kjZJLNjokHBPbBfEFw60RPbvXFZO9dOoK+erWp2QbGPdZbmLZL7OZIiu6fJ54S0d2wsgVURt/yKQWxhsor+uIaXHRSNllR/wbsdRvQGtjJMsjKVm9cwGoZHZaYfCuwqIfOkCnvt10ufSMK4ahO5buHF6wJdHkWDWgi2TjQ2wINXPz9x4wRgCx3qbJG2vGhrVs0DI36deEhs2qykJgNZrvOUXyLHPVVVrFiZrxck5QGNZSvsC1aCQbvOhL9e2v14CSkA7DWjx3YjKFqVYMqwPWSKi2jjNeRZE6qKJiwmxDJvJ2aKAf1NOJN9Y3NGxVhzmYx9ROT8t2HESd1xQgDxABOHAtYuRdkviRMdzHdp6BlWWc1oh45ncX4fI4kBz63ku88Q0iO7zTbR/R7ILUp5ZmKl0CNEz/KI5FMdE9EFIuCp0rBh5wMufj+UvOpdx10H2qg5zbTU9P4IzHNRkVdsVaoYbCwHYhAEd/sva955Ox5FbzdE2hZ7MY1TTkFHD21LD0TGKNQi0sApDIbWDfFg8esy0gABK6pEAIiyBWHyYrX4vRdbiUUOpm0KTkoyFUM+v4wKkshLgBVJN701QdxoVX+ZMByo92bu5JS5+hhN2l8cP/8/Bq5myWXsTZxz24TM2LFUWkmVH5SmxREAZvEoISJNvgeRqzM3BN3bzpp44EjMhsPo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(40470700004)(46966006)(36756003)(33656002)(82310400005)(40480700001)(70206006)(40460700003)(8936002)(478600001)(6862004)(316002)(5660300002)(2906002)(86362001)(4326008)(6486002)(2616005)(54906003)(36860700001)(47076005)(70586007)(83380400001)(186003)(53546011)(107886003)(6506007)(336012)(8676002)(81166007)(41300700001)(82740400003)(6512007)(26005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 14:10:44.2231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072e8266-a702-4b8a-3875-08da59d92821
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7394

Hi,

In fact the patch was committed before we started this discussion as Rahul =
R-b was enough.
But I would still be interested to have other maintainers view on this.

> On 29 Jun 2022, at 10:03, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Xenia,
>=20
>> On 29 Jun 2022, at 09:55, xenia <burzalodowa@gmail.com> wrote:
>>=20
>> Hi Bertrand,
>>=20
>> On 6/29/22 10:24, Bertrand Marquis wrote:
>>> Hi Xenia,
>>>=20
>>>> On 28 Jun 2022, at 16:08, Xenia Ragiadakou <burzalodowa@gmail.com> wro=
te:
>>>>=20
>>>> The expression 1 << 31 produces undefined behaviour because the type o=
f integer
>>>> constant 1 is (signed) int and the result of shifting 1 by 31 bits is =
not
>>>> representable in the (signed) int type.
>>>> Change the type of 1 to unsigned int by adding the U suffix.
>>>>=20
>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>> ---
>>>> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
>>>> For GBPA_UPDATE I will submit a patch.
>>>>=20
>>>> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passt=
hrough/arm/smmu-v3.c
>>>> index 1e857f915a..f2562acc38 100644
>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>> @@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct=
 device *dev,
>>>> #define CR2_E2H				(1 << 0)
>>>>=20
>>>> #define ARM_SMMU_GBPA			0x44
>>>> -#define GBPA_UPDATE			(1 << 31)
>>>> +#define GBPA_UPDATE			(1U << 31)
>>>> #define GBPA_ABORT			(1 << 20)
>>>>=20
>>>> #define ARM_SMMU_IRQ_CTRL		0x50
>>>> @@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct=
 device *dev,
>>>>=20
>>>> #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
>>>> #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
>>> Could also make sense to fix those 2 to be coherent.
>> According to the spec, the maximum value that max_n_shift can take is 19=
.
>> Hence, 1 << (llq)->max_n_shift cannot produce undefined behavior.
>=20
> I agree with that but my preference would be to not rely on deep analysis=
 on the code for those kind of cases and use 1U whenever possible.
>=20
> What other maintainers think on this ?
>=20
>>=20
>> Personally, I have no problem to submit another patch that adds U/UL suf=
fixes to all shifted integer constants in the file :) but ...
>> It seems that this driver has been ported from linux and this file still=
 uses linux coding style, probably because deviations will reduce its maint=
ainability.
>> Adding a U suffix to those two might be considered an unjustified deviat=
ion.
>=20
> At this stage the SMMU code is starting to deviate a lot from Linux so it=
 will not be possible to update it easily to sync with latest linux code.
> And the decision should be are we fixing it or should we fully skip this =
file saying that it is coming from linux and should not be fixed.
> We started to have a discussion during the FuSa meeting on this but we ne=
ed to come up with a conclusion per file.
>=20
> On this one I would say keeping it with linux code style and near from th=
e linux one is not needed.
> Rahul, Julien, Stefano: what do you think here ?
>=20
> Cheers
> Bertrand

Cheers
Bertrand


