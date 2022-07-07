Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDC56A70C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363062.593392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TY2-0006v9-7h; Thu, 07 Jul 2022 15:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363062.593392; Thu, 07 Jul 2022 15:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TY2-0006se-4d; Thu, 07 Jul 2022 15:36:10 +0000
Received: by outflank-mailman (input) for mailman id 363062;
 Thu, 07 Jul 2022 15:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhzx=XM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o9TY0-0006sY-OX
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 15:36:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84761a5b-fe0a-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 17:36:07 +0200 (CEST)
Received: from AS8P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::34)
 by VI1PR08MB3854.eurprd08.prod.outlook.com (2603:10a6:803:c2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 15:36:04 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::c5) by AS8P251CA0009.outlook.office365.com
 (2603:10a6:20b:2f2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Thu, 7 Jul 2022 15:36:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 15:36:02 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Thu, 07 Jul 2022 15:36:02 +0000
Received: from 307ba5673931.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BCA4E506-74D8-436C-BA28-3F2FA7F5D87E.1; 
 Thu, 07 Jul 2022 15:35:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 307ba5673931.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 15:35:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3676.eurprd08.prod.outlook.com (2603:10a6:10:4d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 15:35:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Thu, 7 Jul 2022
 15:35:52 +0000
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
X-Inumbo-ID: 84761a5b-fe0a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L+gsgTEzSa/5yhp/VGbRNOp9L+SRlUSiXTPSXfbf4f3LrGs8pwYcfWMTi4xbrYvnvJrDGaemCUnh+Tk/OgUuXlROKbRgvg1g0o4/5Zdx51d7sMaqEKxPqRYFg84WDOCd1syiCRPFT1PXEsBEKh5tdIKycHABxx83X0KNvouVNI1mt4iyfisDlAJg/sJGoFIfth1UJcMLujFme5R/X6l7zCuP2HAYl4EiXPHip0/Glpnv2e1txlsiy09JDXpCkIzNfsSiF5NWOhXErX5uJSO2JIiRuA3L+IOSAaP/9qbBrbUas5v239RGTT9DQxlvbT/Xy02cp1koF7Ow2Xf4zKf9GQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGY+VV9hCUPZRXDBldhaSoi35/X4k/KdbHvCmaZMBHc=;
 b=VzRuACY4fNJxuwxD6KcDwQF1cMq/OdsobPBHVVoyA+mZxN8+aHW0YEjQyayiHcpVbnmUgJnGIJ+mLNVuROEMKEgSaVdwHHj3t1tFYVztpIfZT9d3RhvtO62cIQxbrzFme5UWw5fFZrIvqRIFlX+SmLej4Tx2KuaDkH6Iek9ugai6M7qM8SyvVZyoqjVnD2K7GWjvi43WimOB8IaZAE93TvbQFqBNwV/mSDV8NsJCDYnstkxd5R7AI2VTb6FHz9j+/jr8gbVrP8jicGCn5ady2trYGAYGrcSo3cSlodrJZPmap0yq1fpZzgHnZJRTqWB4rKRCc/p0brZNs5JYBZdDLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGY+VV9hCUPZRXDBldhaSoi35/X4k/KdbHvCmaZMBHc=;
 b=2pZkclLqHNDqFzrVY0TIkpqNyN2K1rhMcnoskWq1kuxWUTEzc8p/q/OaPWPOWeGwOfzdEjS4zYCbcMyxO2wt6ZuA28jMezRfnRNc0Le9vuOiapQdx9BaIv+a1OHqeSmcM8wRFm/01+/T/VcIsFhoFMRrvf4Feja7KnNntulTb3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cee0535145a4286
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBz4toH86alDcyWasL2eHOrhWYiI8KK+DYuvBFgTROf3NXhqV2js7bCzRkUVKcsoOmr2KyerojTPjoK7MQmWy4h/gKXToccUj8g7kkTopmy6VBQfck8HAtZyNaru0jVwV7CiPuBz9PbZW6Pd8DXXNJiPv86JSWaVDSxUbeg5AUp5vngkcd+twN7s1eidY7rd/wWe2JKL+CvrAjjKZJOER14SXCg4t7MrM280ytPgOWEEtKIhundCNik1Mtmpt3iUMotx7FL16K3TBa+fBUhAXMwM9NftRaw7X2AzS4eNax7+LqqCqUIEAEilcTktP0WnxLdwaKO4qtEFQj9YW3MZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGY+VV9hCUPZRXDBldhaSoi35/X4k/KdbHvCmaZMBHc=;
 b=hOJVIdzXwueZMAO+S58raZIJaQegR5zq3+1e6/j62ISmTmy5AECB0T7UaY4AqV2TuQTK5/O6uixNCNFippkO3TCIjOjWLKPbKv7GHZF+EFSQkNYLJm6t+tDPcno7oQQWv7WL5NYvV6PNt8jBG8xMYwtYIrQjxQjz7POQsPzvmn3y0+0wWaBsmwkrOeTWQeFisg3yu2b0cPXaJJX4gXLnT0OlZqHNBz6zXv7gzrX/sthFs0+8nlM2sxWn+gMSen2yKTmkpU01yHd9hNhbKGdUK+53N3XswCIefyzb5lep5nEI2xMM1Xd2H2Y/HgjpiNe+i2GswG0u0kgofr4fZzKYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGY+VV9hCUPZRXDBldhaSoi35/X4k/KdbHvCmaZMBHc=;
 b=2pZkclLqHNDqFzrVY0TIkpqNyN2K1rhMcnoskWq1kuxWUTEzc8p/q/OaPWPOWeGwOfzdEjS4zYCbcMyxO2wt6ZuA28jMezRfnRNc0Le9vuOiapQdx9BaIv+a1OHqeSmcM8wRFm/01+/T/VcIsFhoFMRrvf4Feja7KnNntulTb3c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v4] xen/arm: avoid overflow when setting vtimer in context
 switch
Thread-Topic: [PATCH v4] xen/arm: avoid overflow when setting vtimer in
 context switch
Thread-Index: AQHYkRIUbyH8VqZ9NUOQezXCQ2anPa1zC8wAgAAAigA=
Date: Thu, 7 Jul 2022 15:35:52 +0000
Message-ID: <0847A13D-967B-450D-85D4-3D644E821905@arm.com>
References: <20220706082558.1116811-1-jiamei.xie@arm.com>
 <cfb037a8-ac32-90a8-b527-d259f013e30c@xen.org>
In-Reply-To: <cfb037a8-ac32-90a8-b527-d259f013e30c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 68e62fb2-d78a-4f8a-c48a-08da602e6678
x-ms-traffictypediagnostic:
	DB7PR08MB3676:EE_|VE1EUR03FT008:EE_|VI1PR08MB3854:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zWpKaH6cFGhCHpabb//QEEEHQLc4bFnFnAyY5sXfHQDrv7UAflMAmnyaPOtx3AIf7bCveLA5QsSwS9YwHnzD2gdNgW1wlvmsOlfAaE7cNhyysEqEgyr9y6RRKTkkEssEnGA3qAaJikLP7CahG8zPtMTdCWoCwkt7VzPku/wcoQPtwMrCv8I7DZx9mX7JMreldRpHlsj0WXgPdNibfmlW9SoSu6iM1uu5pY2lFHetxsI5gpe/P309JHKcyoXl4e/3/EN04AzAcc5s9aq4POV0NqEE+BWPup/PVhIQZ+cR8qXARb34iGM8cGz08MT9/h5LuHc09nY46uhs4flX6Ru9V8t90Yg5og98cLRUOCL7hdO7zMI/gQYTkyOzeGDw8eshMHptooT9nppr7ee+lVZaR9D+RFQVghOWktw1ln4W7d7HL75IBR+oJuofG6ovSTnB0Aa/gH2uim32euR1OUnOtC6kr9c/V7c2QCThcUpzC9NL+xqB1A38KUSa7J9OuCGBS36bAxetCAkA1RBNcAOLOai1DlA5vGafw/tgm0GUfYmJqEkaZE4NEn5ObQxggOnKgAjBOSxJaayQP9BA7snopHy6W24hJMQZQqEj3N/etRvmPCI6fJccT7J/RAYERzJtGQFgtxOkbZhqz3Kj91c+qeTJfR3HmW2NJDuoleXZs+x5vvMfk+gMvxRDmetcZsGeCwgPpS/BRWQngSgKgM882gaTmgdagCAZec9/g8F1Jd3pxWLbdhd565ggwdescDEiRBNtDAJ2pTcwPX+qWlJ0ua1e0Pxtr/LWTePEReXpo7byDswsf26gG1xNFBMkE+xBWjPlQdzv29Jqp3OORHEtmALus5DCnaBVeusli2WDuWI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(5660300002)(66946007)(91956017)(83380400001)(186003)(8676002)(8936002)(66556008)(38100700002)(316002)(66446008)(6916009)(54906003)(66476007)(2906002)(53546011)(2616005)(6506007)(33656002)(26005)(6512007)(71200400001)(478600001)(6486002)(41300700001)(4326008)(36756003)(64756008)(38070700005)(86362001)(76116006)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44CC91E0230605478A2CAADD055139E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3676
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97cd2bde-d779-431a-8386-08da602e603b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ergipWglCBPoLiobrfm/nUCTw/4qpAKQuRI4dsfVEOp1M8ar1/qc0V/dRyQaTO3BI8zNLSS9UBOsQYaTb6tP/gNXXmwICxV2A7lx8Y3f7gAtSYADy9MVS1AblOK7MxQQWWW91kEbrcc817COeCg0N/EwrKI5oi7KvYA5N0kvae4RAeS0UJFpL32tfhwt0sBlmGJrrWg8QB5tt3GAIwXhbL4ZI1U1T8WmAYJjrBaRhpWCF0RUub2KhhtIinmqPrzZ1WakyVYXqdOe9pMpbB5jNBn0pBnqg/gBcaRurQY1Jh7er92xAK+672R9lcXCLP8lfkRUgHVArLdctpmF1nintWz0yWF9Y8CSdiCVJTFrXEs+T8BoqNqYi+/OXlRRlTSHbAqpI5Q/iG2EZGcG19RVOiQpivxTuwwfRLA23u2uDYKWWvI/oC7WEh/MUNcZmhNTzsXT/7R4KMapD4Yy0pqVAIRC2NC1Fgpm8Q+Z+x/9tN90UbLDa2GUtR2mo5PWdU8wIX51ctufIfbZElfjXDjAwtoy8gyxJByMljyjYahdjrZISjU9RDIeDlnF5dWOLZ6jtES1/N+ReezYUZZsa4MTcwmhW3sDQAflkoseIkFXA+CBiutC1LW/Y/oprNMbUGZ0Z1hE/7f+0jrINWV7mDVkMde0NzXwiKhevxf0G792M7jFGC9pxtiZ/cR0vsq1sC078hli0+NUuZ7lsScXWAuo1pKbxvS3195gItC8SBKS2nQYFOHeqLomhhimVpHvFtGYCk5Ffx14kYSNo9eib2/DN0wJHFnQzYQzANcZCVQxJxaz4MdQQvMFLdMOhz413z1L
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(40470700004)(316002)(81166007)(83380400001)(356005)(82740400003)(36860700001)(54906003)(40460700003)(8936002)(86362001)(6512007)(8676002)(5660300002)(6862004)(336012)(70206006)(47076005)(2616005)(26005)(6506007)(70586007)(6486002)(53546011)(4326008)(36756003)(82310400005)(40480700001)(478600001)(33656002)(186003)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:36:02.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e62fb2-d78a-4f8a-c48a-08da602e6678
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3854

Hi Julien,

> On 7 Jul 2022, at 16:33, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jiamei,
>=20
> On 06/07/2022 09:25, Jiamei Xie wrote:
>> virt_vtimer_save() will calculate the next deadline when the vCPU is
>> scheduled out. At the moment, Xen will use the following equation:
>> virt_timer.cval + virt_time_base.offset - boot_count
>> The three values are 64-bit and one (cval) is controlled by domain. In
>> theory, it would be possible that the domain has started a long time
>> after the system boot. So virt_time_base.offset - boot_count may be a
>> large numbers.
>> This means a domain may inadvertently set a cval so the result would
>> overflow. Consequently, the deadline would be set very far in the
>> future. This could result to loss of timer interrupts or the vCPU
>> getting block "forever".
>> One way to solve the problem, would be to separately
>> 1) compute when the domain was created in ns
>> 2) convert cval to ns
>> 3) Add 1 and 2 together
>> The first part of the equation never change (the value is set/known at
>> domain creation). So take the opportunity to store it in domain structur=
e.
>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
> The commit message is my own, I would like to Bertrand or Stefano to conf=
irm they are happy with it :).

I am ok with it so:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


