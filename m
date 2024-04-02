Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CE894C9F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700015.1092551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYX4-0008Ou-Kt; Tue, 02 Apr 2024 07:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700015.1092551; Tue, 02 Apr 2024 07:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYX4-0008Mk-H7; Tue, 02 Apr 2024 07:26:10 +0000
Received: by outflank-mailman (input) for mailman id 700015;
 Tue, 02 Apr 2024 07:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64iE=LH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rrYX2-0008MS-SW
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:26:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 440374fb-f0c2-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 09:26:05 +0200 (CEST)
Received: from DU7P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::8) by
 AS8PR08MB9552.eurprd08.prod.outlook.com (2603:10a6:20b:61b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 07:26:02 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::fa) by DU7P195CA0013.outlook.office365.com
 (2603:10a6:10:54d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 07:26:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.44) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22 via
 Frontend Transport; Tue, 2 Apr 2024 07:26:02 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300");
 Tue, 02 Apr 2024 07:26:02 +0000
Received: from 43dae0d61d56.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE367D52-CCF8-46B1-A704-1113E6DBC35D.1; 
 Tue, 02 Apr 2024 07:25:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43dae0d61d56.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Apr 2024 07:25:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB9744.eurprd08.prod.outlook.com (2603:10a6:20b:614::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 07:25:54 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 07:25:54 +0000
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
X-Inumbo-ID: 440374fb-f0c2-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m1hOPUegJsJTmGnR9dgoun6jNfNh7zX6i1O3eipE+TghrtddQIaA6n1VFc5JvtPaJLAkagKklWRXKRaBaYxHeoUt/4jYpSaznzRumwOzGsF8qalX/AbK6pTPmz6mMjeTS+XJEtnGDUOFzytAatZn5+y5YlpYWW/F5wAoJgD1VnSJl2k6nc+5SPVVgf0Qv6nuqcveofGMmcO59MPZw7I1YOjOLzRVnFX2+QYRyqjGE0vBL1Y3SOIY4Z6dn8tbocwOFlF0/7ZwMP1zjtH0zUFmRxvaMebb6ikfT3hLihPivqPU3qMtwf4+QxZn9MDaK5KVt3wDRzXsgyyPIs/xY5w7mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ptpqj4SPJHm9E9/gMaEyHTmgbUb3oIYsccF4bAMdS0=;
 b=h1UU1hm1nosWOQIfcBxapr4mYmdiDNql05jvjyFdN2vWeybiSM+08+qaRq2NHpWjjWegkc8F+Z0ouM3i4pMaq+PcGJHyuHqPpgd6txeVLKNu/MlqOqwgYcZd8wvieIoVhUaTL+K68KJjxo+tkKzSgkc4iGfMEg42pmsvwEjnDCzTVpU/anlWyqb110hy185jFIKkrZryVyPQ62L2CwUuP59pD1yvYdt+FJgFVejKCNbPDKXMz9QA91Jq6bLPakTlmulj3yCZ/1N1IPwluvt9w/pyr4MMtL7pnmp1ptCeHtLE99dIKhI1LJ1fEXqrMLHSZqs9tn0ZgbGAqbIMBem5+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ptpqj4SPJHm9E9/gMaEyHTmgbUb3oIYsccF4bAMdS0=;
 b=JKLVleO/RNiZwpX2QMgTN+hf8Cugj0IL/OexLT3K/8SVPeWIfjUekpkT6wL3xXsbNaPDxFcgvwUBRHeGqH7TW+SiJ4FdUXMeA2M8gCGwOqyqgxn67mYMgK6qSBaco13YLjxc10tNqeA0ZS2IKiZUrOiYYZC5o1jE5bnEbFRHOyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca3d8ca3b95e5999
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KriUs9lTflc8Rn+5wv1BufaTwtSjMuuO0qtEKWGa6gDAjG1bmASJ67SZR2gfKTNPcumhbTHa1o+bN0OQLqODHNe3vAxgkOfLwvsSIp232uPEh4V7P+FdgHDpRyaYDNrmEbMrmugUKboiCeD2wqTdoeMheFFJVTDrxncK513e2ooe4YP3DznAD5x2rzj3GAx1bmMtTMzH8VH6arW+OjiXypLR0e5z1Vi8NV/JhP97WNWDAlNxiUngrdqfzbrkSF308HJoczJLsuQVr56ezdtWpBfiif3ljQyMhO7tQ+gK5bPKKWuBn+rhR1+SLEL/f25HK08Exh4ftD7L9oMzo0IbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ptpqj4SPJHm9E9/gMaEyHTmgbUb3oIYsccF4bAMdS0=;
 b=MD+2/CIkC7i96I4g6mrNqLzbPk0L7KvIZkm8vCHBmKf5V9DDCCAVbLpUkGyfrlpNXAhdh4kM0bfBPqzZOr02eIfjy1xF88Djt9C+ddN8Sfq8jQ3BDEgvZJm2lFJdCBgUpDha7YhfM64iVxvjzI5zEyPrG6kl5Pboj8DMq5ybPq6kTvnca1mTCNd7mbUP4XF9opXH57Dli4iqKEFSMh8NSgTXLANpwqiMIIaQ3chEBYFLm/b4QTquczhBAdxwrA2pbshAPD6zjXi4SK7HSDDVaYs0Jp2Nn3CAmBPGQclv+uXLpjd3qjdU6hIBeau/i5nNdHIjMSU1dthBOlWrlRkRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ptpqj4SPJHm9E9/gMaEyHTmgbUb3oIYsccF4bAMdS0=;
 b=JKLVleO/RNiZwpX2QMgTN+hf8Cugj0IL/OexLT3K/8SVPeWIfjUekpkT6wL3xXsbNaPDxFcgvwUBRHeGqH7TW+SiJ4FdUXMeA2M8gCGwOqyqgxn67mYMgK6qSBaco13YLjxc10tNqeA0ZS2IKiZUrOiYYZC5o1jE5bnEbFRHOyU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 3/6] xen/arm: ffa: separate memory sharing routines
Thread-Topic: [XEN PATCH 3/6] xen/arm: ffa: separate memory sharing routines
Thread-Index: AQHafphXShQMyqELBEGnpkE0sEGolbFLm16AgAHad4CAByrsAA==
Date: Tue, 2 Apr 2024 07:25:54 +0000
Message-ID: <6B13FCBA-E23A-4188-A2E9-7C198D45210C@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-4-jens.wiklander@linaro.org>
 <F5023C5E-4563-4643-865B-601B022F7AC8@arm.com>
 <e43bee20-3307-4646-ac1b-a794e8211b4b@xen.org>
In-Reply-To: <e43bee20-3307-4646-ac1b-a794e8211b4b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB9744:EE_|DU6PEPF0000A7E4:EE_|AS8PR08MB9552:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kOMVx4jFnhkG0XNNhWF8g4x563ZyKmJ48M1kUJDdJwlPBNehpU7kkTbQaZlJ8iHv/iP8fEjzFCIiTnM1DfcV/fz3LIYNX/BukxKU8N5sat/bDIr4hjURq4gddpG3knwbJHfaMcqMskB/sBFJejthDAK+dyZ0/VZ+fEUruax0jF7Ugn1/kkFnNNLi0iCHd+DAPdAk67gjoi1whNKKWy5rogdJteQJpYtGhAI+ReCPbJzMDxJCUnSyvou/EymE1nbQtR9IBGVNE+yZCmQLgS13GEYH2uKE5ZEzYfS+mADs6nKs36buQ4C/yq5xUGa+y0f0mJClMnqGTBv3CXxI6VG/qefx5WcM5Gwng/1JVl+1niEHNFheRUmL/sHHRMF/jRfep62r/UeoWJQStv3eySq0X7gAxb97TtzjNdBiK+A8lb7O2Dri56NDWLhRqwDvsun11fVXJXEQOOFk3YTsG6MlkIb4yOqm62iJSqm0OQcnOnGwO8tRFV0iuQk1L/YpBUR+DUl82YMogYUikW7CnUIDkEtbwwQ6LXaShBZ0hh6xDq3irJwWzoOGi+xU7kzmRl2oINe9acZ5jM3LYio+CitNf7BgKS7NOMQbMy8fNTJgN6BXZv7699+dVuXv+iwIhuZ988Jbkqjo7xx0fi+0NARdLfSC73Fcsx6NaR9pXcf0UZM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D6B45366E1807409CB6CC2EF8DC1658@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9744
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9b8c7c0-88aa-4d85-b413-08dc52e6269c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tOaXSnjEyZojmjvgx3vougdGC6DTSCr9xuV3cHwpxKnflZrL37r5MgwBK9RiAGAKJLQtHC6xhFFeczc6LbuNWreAhjqFNbeHNI1ZA71mJoZpiMBpJCfk63UWJjoCytVD2NWZRaAQDZL7pPqI0UsKl1c7CvmWwxYiQRzsIfeM/nG9YR8HlTkQzTudBkCv9cZgeEiCNDB9vSxDhIMpxI9GLNG0ClvntHN53U9Tx3pH1C9DGDDQ/lIvhelFHEW+pxANjgC7SJkuL4kAV/vMt7HSWwQPY+vGTKFmbPjh3pwaN55O2QSGDxOwbBWAmJkio9+EHBSGVALyPtUx1sFpc8D5zq/YcO2a/J8Yq9nj7JKdThBezExpEtBRnmsorf3De1OZ32K3I4sp9qEORGknbGRk5kTh7wCXqo+vtC9bQ61WZX9Bc1biQUjW89ZG8GKthX9O8CEEv4OQjzhuN8bk9MIfnU2BP35vDfvZGotTtxLWlrnEV8nNFtp7VVbJHVi/U0jXW+jtq3FwUAjmyPPzgNwmPunqKFtGA+TkrcijVG0PDD2kIK983BE0gjpK102QY/BMO11/ciz7d7mevDn/CNJtSwODEtpjDNE/QSaC9HhY+O9H5IW/z+WQiEyuXRyPd2Ik3pRu7uc+0hJ0b8gSvOqnWpCmvEtNAlviuJnfVtZutue5l/4SOBYhwey2MCmq3IAUROXWHUdwyrzNU7ZEoLY2UdAf/C4m/qnZ/XBt17gAnz/23nvN0Ok3A2rbUBW69e/9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 07:26:02.3371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b8c7c0-88aa-4d85-b413-08dc52e6269c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9552

Hi Julien,

> On 28 Mar 2024, at 18:58, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 27/03/2024 13:40, Bertrand Marquis wrote:
>> Hi Jens,
>>> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> Move memory sharing routines into a separate file for easier navigation
>>> in the source code.
>>>=20
>>> Add ffa_shm_domain_destroy() to isolate the ffa_shm things in
>>> ffa_domain_teardown_continue().
>>>=20
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> With the copyright date mentioned after fixed (which can be done on comm=
it):
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com
>=20
> I have fixed and committed the series. However, it wasn't trivial to find=
 the comment in your reply. In the future, can you try to trim your reply?

Thanks a lot and very sorry for that, I will remember to trim next time.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


