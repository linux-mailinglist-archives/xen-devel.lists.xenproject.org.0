Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178C351B79C
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 07:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321434.542433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmUPQ-000881-PE; Thu, 05 May 2022 05:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321434.542433; Thu, 05 May 2022 05:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmUPQ-00084W-M6; Thu, 05 May 2022 05:52:16 +0000
Received: by outflank-mailman (input) for mailman id 321434;
 Thu, 05 May 2022 05:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCF=VN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmUPO-00084Q-LM
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 05:52:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8292974a-cc37-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 07:52:13 +0200 (CEST)
Received: from AM6P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::33)
 by AM6PR08MB3735.eurprd08.prod.outlook.com (2603:10a6:20b:81::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 05:52:10 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::4) by AM6P192CA0020.outlook.office365.com
 (2603:10a6:209:83::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 05:52:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 05:52:09 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Thu, 05 May 2022 05:52:09 +0000
Received: from 9072cbe7cc29.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F1CE75D-7CB7-469F-884C-5C286AEC0D00.1; 
 Thu, 05 May 2022 05:51:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9072cbe7cc29.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 05:51:59 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 05:51:54 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 05:51:54 +0000
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
X-Inumbo-ID: 8292974a-cc37-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SulS33LZtyKfpIrRkieYc6vMscbWcr/VlX6Rntamyuqd+htQ66GRXmYq1kOfICskc8I7oGW55Aphkn8IQkRgAojU2rgSzJ2/NemiDKGRcQa/hNTWw1/Q4cyfrimr1tAaF8AOgt7AzQr1bbg8+npppGbg2Ll98SzlvXyVNwxys3Rmxap+7SlYVl9P01CYmS43578NIjgrhOQsCnfchMx5vMtgvL804THu0VA+fIPMWTuF6On/olEqZR1lQKKSzNQhJTsGGthL0pjskspDSaq0/jreZ/PBHzR1Lm9xjJntR0K3/DRw6XL/p1jTaGGZN+cYxN5CbA8XuJ8tl3V6eya9Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTk4w4kM8VASug7minekMuaUJ+KOdkYv7klB2qI+Y7Y=;
 b=Cft3Lm2u1FaDg1g9RXFW+oRypfszYWxubrBRNeEobGP7ITManMGA/Sc7+l9SxPYTcFc6UH39wZPCOKzpEYzNN171+Y6EZuIQSkOf/ZVyyeMhkxS1X2gkwjci/2wJeEbY7j4o/Sw3xOdM9Yo2y3T0jrQ4Nz5NWGNudmpfAnLT1HhFro6BrzXgcW7GgimPdIPhPcRe/c+fRAVz/yPPIYBlIKnP0/l0Vih1R6ivXCwz087YNvID5s1hM/txZhvEPIYBnklyXXcBFJ4TzdgJEdq/p72QTxsEUwGB183lEMyXsGqtnkrdx+JFMqeIqjEDUFenV9JvOZNgaTzWa6GQkI1BfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTk4w4kM8VASug7minekMuaUJ+KOdkYv7klB2qI+Y7Y=;
 b=zDzxFLx1/IyipBWxS4MMx8Z4gFq6cwKC7hbFbohtGo3kxSeVLhw3ovbQ85FTTFGix4XTTxKinb6MneadOLaR9f46TLpXFcXBWkXRVTXKmT98a1LjLAjLvzQxwbBXGGREMsRrAd8GUqoJvFWTCkLLo9ecSFQqeNENB4iMqFI/ipQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfPkMwizstMZwulyEDC9TmK4Oh7naJ89naLZBG9z2F+Y5+gCUJ6WS9NN1hcDe8HHa3vQF6cZMi9AeyFMvvdwjWL2tq7IBrJXzCehPSOqFUc+3x3S2kmvKdBd+hAEnEj5HgHduyL2an3Zzhr+bcg/fkjrCfCiIfnBHAq90k89kyEdRqHHYpKyMF+qN9Y4gQeH7Cyrep6YtjtHZjJkVD19GZicevOBc025hVLxvcHanF7QCZlLzA6yDGBQetOV5hAHdjd6vPoTczvU0juGsW0PATDqnMFCcde8A2gi9/rj1GLaQDIvfUV+eZAvGgPzY+2sizXkLTLW5iglcyNM97B/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTk4w4kM8VASug7minekMuaUJ+KOdkYv7klB2qI+Y7Y=;
 b=k1yvBRgmw0A+F3pTxkKbA8eCqQ5Drt2YY/+Cidk3Q3qJ6lfbM5ma8Df5wOPyT0AJJdPN8NCWA69DmYqxQpJzufVS5zkpwqe7kjk71M/EmjOZ5/VupjPwf9ElsNmvOpiXSWUGnfgp7S16L73DqX3w6J57GKy+/A9xIVWXEMYKB3kPEp4jsneOOvbmQXKbPOZ7ya+KUw/5uFC3thVQGexaQYViaMlLoPXI/kZHAol2JN9i8TC/Ss7nxlWG+p98f1Dtw0KttI/VpQHn7Xi0Rm9I6p0V0aIC6eJLZ7YX6ztwBPeEQtp7ebuh5YVLXRS7tyN1GtY81qo+xdmScji53m7wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTk4w4kM8VASug7minekMuaUJ+KOdkYv7klB2qI+Y7Y=;
 b=zDzxFLx1/IyipBWxS4MMx8Z4gFq6cwKC7hbFbohtGo3kxSeVLhw3ovbQ85FTTFGix4XTTxKinb6MneadOLaR9f46TLpXFcXBWkXRVTXKmT98a1LjLAjLvzQxwbBXGGREMsRrAd8GUqoJvFWTCkLLo9ecSFQqeNENB4iMqFI/ipQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 2/6] xen: do not merge reserved pages in
 free_heap_pages()
Thread-Topic: [PATCH v3 2/6] xen: do not merge reserved pages in
 free_heap_pages()
Thread-Index: AQHYWhkw7aZ3ZAXjYkKl+baB+o3PAa0OwdUAgAENzPA=
Date: Thu, 5 May 2022 05:51:54 +0000
Message-ID:
 <DU2PR08MB73250DCA20D835109C147004F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-3-Penny.Zheng@arm.com>
 <0ba5fb49-4cbf-916f-9d8e-4b64211fa87c@suse.com>
In-Reply-To: <0ba5fb49-4cbf-916f-9d8e-4b64211fa87c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8A4ED691C7B01A488901BD414A7CEB31.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6b661b80-fc2b-42d1-b637-08da2e5b6518
x-ms-traffictypediagnostic:
	DBBPR08MB6025:EE_|VE1EUR03FT063:EE_|AM6PR08MB3735:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3735B742CF8F534CD0B2E5CAF7C29@AM6PR08MB3735.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wdmoSHLN9E/dzJ0dJ7ivTKwsev5O25NmGRLTZ18eSNW8Op21I4A2vL9EZAGZmvzZKKsIM0ru/xc0LA6NTMEezoBl2T+wSbRM52p8tYnFYbxqwBvLKbnhIp9v1YNRb4yipetRaPwU8xeOHln9cT90LaM5Gpc8qyt2reIG7yjLP7JqThD1sSFiqEkPxgHMvfaqSZCvFOdMf0WsWUNyESTJZMim0ur1urYESCarvYguHf3w/MarX+Y6PkB+VAYisRs7IYk2n7OnmD9mmyb7AfNNSGtyB7UwQCQGhtiHTKNrHOyRprpqK+xvmdeXq55H54HnSxIuf3dCGzS8+qTjdLLa5aY42ooODmsUqGrWvbpJMPglRiiPaZwwZMMQ+oBD4ll5sVyHkzPT1HIb7Lqjb6fsQYycO3FOPnqoB79PqRzhzZl9sOpk3+fiAYLmqq5LVjd3LOKYFssgPIQvfjNwttqjEtF3STFdvdp95+gHxzgiIaAetx3/JxmXdFtzPTUpV5rjhFRQ4GuLcsUarQrK8xhEVy6DH0Nfx2NXFiWarCRS2SNY+8whemUeKfmQKsiZq9ISi2X27LW5hsvUPl7cBtYnP3tQMYh/tDznkXdF3vG5m2+oJy6NubY09Bs3Nx15v1nw697c7RUSpQ45jsYTSi5cio6NmWIOmo2LfgDFx3qoGM0DBHdDzzNOtRlSE+h1W5NQtYWThcPSXil51QyWm9eg+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(2906002)(83380400001)(508600001)(66476007)(66446008)(66556008)(64756008)(8676002)(76116006)(4326008)(186003)(316002)(4744005)(5660300002)(6506007)(33656002)(7696005)(53546011)(122000001)(86362001)(71200400001)(38070700005)(52536014)(8936002)(9686003)(110136005)(54906003)(26005)(55016003)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	016806db-8b35-489d-d502-08da2e5b5c0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	guaZD59DSFcmTj/iixdAaCyJ8zwd3Kr60aVyLzXDyVCTqtT0W+akJUA200jfb+1qAkFiTJtSpYRBBD4sjvgz4dUa2UVFrYP8RYho5o+OpooPu8RK5aAmMxRJ51SiQqeoWnTZ+CbQYdU/n+iNPmCLHShrVkYphijCXCcwxkYJ9wkh4lWeBBgtLbNVOqBHgvv4jIHGBL3BKa3rRW1gjgnPzhARVp5eX0SlaI4DoRw6EegkYKfLsq9QvHMoqohKidveDhFJyvBPJ5a5ep1j0SpNl1/2ZTM0cNAuwBb0ShuNI1v6GV3lK6fZ+JMr1g0SxXHu2SWhZEecqPC0OROraz3hswMrMUQHFqoin3rsrRDIt4Uw+FFm5m1+UEVv284o3jWIozlaWG9TxuEU+W/joz9AGqAW3K1IGeTGZ4ABWO3qqSQHayHsFvwxthFQB/L9QXvIQHq7I2u/VAzdMM71OdW4rJ0bWpx4U6KzlsFlJMCFm/Ws2BhH72+d1He4Jvrf4NiunRjBu4IysgCUJj3UdmDooO2qvUfpGz3TaTAeEILl2srnsV7k3aV5f7tSh6I0F7PsUHkWgkHuTJasHBKJEXYB+58xfqmuW3ZFVWnmEbat0zCi9BgWxtMkgnXR032XOVQxZZK1/0K+yl3HIjlSD9wStPeq6GbWLjWMx8IUKj9jcMFgtZGQWTtyaUBXi6Odn/eL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(186003)(336012)(47076005)(55016003)(53546011)(26005)(6506007)(9686003)(82310400005)(7696005)(33656002)(83380400001)(40460700003)(36860700001)(70206006)(70586007)(81166007)(4326008)(8676002)(110136005)(316002)(508600001)(356005)(54906003)(2906002)(52536014)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 05:52:09.8116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b661b80-fc2b-42d1-b637-08da2e5b6518
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3735

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgNCwgMjAyMiA5OjMw
IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdlaSBD
aGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsN
Cj4gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5s
YXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNl0geGVuOiBkbyBub3QgbWVyZ2UgcmVzZXJ2ZWQg
cGFnZXMgaW4NCj4gZnJlZV9oZWFwX3BhZ2VzKCkNCj4gDQo+IE9uIDI3LjA0LjIwMjIgMTE6Mjcs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFRoZXJlIGlzIGEgc2xpbSBjaGFuY2UgdGhhdCBmcmVl
X2hlYXBfcGFnZXMoKSBtYXkgZGVjaWRlIHRvIG1lcmdlIGENCj4gPiBjaHVuayBmcm9tIHRoZSBz
dGF0aWMgcmVnaW9uKFBHQ19yZXNlcnZlZCkgd2l0aCB0aGUgYWJvdXQtdG8tYmUtZnJlZQ0KPiBj
aHVuay4NCj4gPg0KPiA+IFNvIGluIG9yZGVyIHRvIGF2b2lkIHRoZSBhYm92ZSBzY2VuYXJpbywg
dGhpcyBjb21taXQgdXBkYXRlcw0KPiA+IGZyZWVfaGVhcF9wYWdlcygpIHRvIGNoZWNrIHdoZXRo
ZXIgdGhlIHByZWRlY2Vzc29yIGFuZC9vciBzdWNjZXNzb3INCj4gPiBoYXMgUEdDX3Jlc2VydmVk
IHNldCwgd2hlbiB0cnlpbmcgdG8gbWVyZ2UgdGhlIGFib3V0LXRvLWJlLWZyZWVkIGNodW5rDQo+
ID4gd2l0aCB0aGUgcHJlZGVjZXNzb3IgYW5kL29yIHN1Y2Nlc3Nvci4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiANCj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IEkgdGhpbmsgdGhp
cyBhbHNvIHdhbnRzIGEgU3VnZ2VzdGVkLWJ5IG9yIFJlcG9ydGVkLWJ5IChpaXJjKSBKdWxpZW4/
DQo+IA0KDQpTdXJlLCBJJ2xsIGRlZmluaXRlbHkgYWRkLWluIFN1Z2dlc3RlZC1ieTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KPiBKYW4NCg0K

