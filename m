Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D7C6082FD
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 02:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428048.677805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om2ik-00085T-9V; Sat, 22 Oct 2022 00:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428048.677805; Sat, 22 Oct 2022 00:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om2ik-00083W-6T; Sat, 22 Oct 2022 00:50:38 +0000
Received: by outflank-mailman (input) for mailman id 428048;
 Sat, 22 Oct 2022 00:50:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wiZN=2X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1om2ii-00083Q-Ut
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 00:50:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00041.outbound.protection.outlook.com [40.107.0.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8925c28e-51a3-11ed-91b5-6bf2151ebd3b;
 Sat, 22 Oct 2022 02:50:34 +0200 (CEST)
Received: from AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14)
 by PAXPR08MB7395.eurprd08.prod.outlook.com (2603:10a6:102:2bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Sat, 22 Oct
 2022 00:50:32 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::6e) by AM6P193CA0037.outlook.office365.com
 (2603:10a6:209:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Sat, 22 Oct 2022 00:50:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Sat, 22 Oct 2022 00:50:31 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Sat, 22 Oct 2022 00:50:31 +0000
Received: from 3d2b69b1863a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86CD84AE-B35F-4D78-AA0E-A1B383D78F3B.1; 
 Sat, 22 Oct 2022 00:50:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d2b69b1863a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 22 Oct 2022 00:50:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7713.eurprd08.prod.outlook.com (2603:10a6:10:3bf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36; Sat, 22 Oct
 2022 00:50:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Sat, 22 Oct 2022
 00:50:21 +0000
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
X-Inumbo-ID: 8925c28e-51a3-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HqofmzV/7Oi4kavfo6tGjfhsAId1YaPEyrQipv9vqzg3lTfPkLoPhUt5t0cCy39w26p77cBFnrAGBq4+fmdycv4zSS7gPYdS5ZASW8LIIFli5kxT7L0JorzB4XseQ8nF+j2le4xHizOhRZgCL0sSiS7MHT6sx9fOJA9TJPMCd6gYRbyLw+4ETM5UnHZ8Mu2LMC0ATOWvLtd5Pq/eMKfXhuNAon+h4/rptZnZy+MHtKqXjsXYOD/N95Qa00WI/wnCztOsfvgUIiQ/Z8k9Snf/+A8jY/RYbpUlnisFxYwLHFkd/X8HMVZkGA50nu29QgP/5FdEQ/Glq5Fx+AmT8lYynw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTOHKlBuV9kI5cFgDUwzJGcibkdLXMyp3fOv54mXaDc=;
 b=jGXRFpuM4awAKSzvSotOvgDirKEPVFl5qJgCC/FzkOXfBfP2YRApayP/11gLXXZxZ/2x3k7OD0f7nqlMGLXoaHJkATaCagHpws5K5mTQpWV3DLE8zx96BWkQ3BshABgJHqL+FJRMhfEZWA9CLFrMiuwIqY7Q4orbL7ewA1+cvfqYfUqPMagTtxrH7RuMEP06hfYRrTlZHXy37G4+rW0BrpdEHHiCtf2bQ7folp5FrVKqlBDPtRqA3XrRxZnUXhGnOagZzVgN9h3A6ypd7W5khss1yXBuP8krYOKxQ1exO6mzLyycYxVb5pDp3JHR+6wOWgGgehBtB5yl/W7zXcXn4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTOHKlBuV9kI5cFgDUwzJGcibkdLXMyp3fOv54mXaDc=;
 b=aBmB7meiIiCnWomefqvdojtk0C6vwPw4kLIPVEVHvQYD8PwSokeEyfY68XRll5Pqrp6S1JG0QB/EbVM2tf+NclmkzITfvCKZssT4kO8c1ObA3xEE+oXfn+GhWYqtOzL6RmF7a5dzAvXvqH7Jso+xgeILGe7RA1j4985yBMRUKFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOpl/Kz4P21D4lxyp4+bnZUYPPqHJGxR83WaOXwNNR7QWObt2Ia0Rs8n7iQNP6KKcGvB5A/G9IZi6MntCKgFkehXdey7l4Y/+f8FOVmz9MGCYUb1NTFX1EFknpdERVXY2FwPD42r1rhQNnRL5eBy/hrUT3Bg3TbeyviRbtst+jg7qlnSOW1OzvacRcWcuXV0473AX0O5F9C3yBo4pRj/sndbJsNrINKrQ1tXEmAXO+JhLvwgGgMKCrfdVJd+rLy2iLkichSAc9qGx0YL3Am1Nfg/PiJ8k1nxN5fglkbePxr2WFtUFoqzzzMtU0LKhuz8s9NazL4DPVR+dAgelMa7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTOHKlBuV9kI5cFgDUwzJGcibkdLXMyp3fOv54mXaDc=;
 b=mKnmk/mnKISjyBy/qZevjFe5fV8lbEWqnWypQ4MlQHmbhzAeoGRNR/7SkU7M0oejQi6Gvp3jDihfXn4ZYWugDFNhF2Sh4DihIzyjM+3U98tnbTQGGFkvFz2unrfNfRf/xx8VaYAXC14TU7zCdSGAzImitB632w+M+UFSmDcNrzFA5b2IU6EKAMiT1gj8Dlsa59K/Fl2T3zZobnbVEJi3q6g5ump0BQhT5F3E9pVB3oNSrjvFxKVO8Im4E0gYH60LJ5Opp8py+kZo2FTFBKBhGgcLMkez1XzkYgwMInHBpIvjlDSHd4I9tUTZZRC5QtSCh3g35m4ZTE3Y4ipPN/dDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTOHKlBuV9kI5cFgDUwzJGcibkdLXMyp3fOv54mXaDc=;
 b=aBmB7meiIiCnWomefqvdojtk0C6vwPw4kLIPVEVHvQYD8PwSokeEyfY68XRll5Pqrp6S1JG0QB/EbVM2tf+NclmkzITfvCKZssT4kO8c1ObA3xEE+oXfn+GhWYqtOzL6RmF7a5dzAvXvqH7Jso+xgeILGe7RA1j4985yBMRUKFw=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr
	<olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Topic: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Index:
 AQHYmuuJ09LC1x/2uEWs942YY/fNVK2FNeCAgABJdQCAAALGgICT+/QAgAAA3ZCAAAXcAIAApa8w
Date: Sat, 22 Oct 2022 00:50:21 +0000
Message-ID:
 <AS8PR08MB7991E3C3897AF89E969F6412922C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com> <87ilntgzpj.fsf@epam.com>
 <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
 <e9120354-e72e-2774-c382-45ab0cb76220@gmail.com>
 <AS8PR08MB7991C3933F253BE49BA61B76922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <0F295AC7-1D2C-4F5D-A421-9440CEB2B5FA@arm.com>
In-Reply-To: <0F295AC7-1D2C-4F5D-A421-9440CEB2B5FA@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B4821A212E9F5F44AA979614AFF0F333.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7713:EE_|AM7EUR03FT025:EE_|PAXPR08MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4c10e2-36b4-453a-bd97-08dab3c76c09
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nVqy5XJBvcIRbsGKBLgd1Zl5wG57pnkeFG1yPGYy9+092K1jv/r0fk6H3BZIqa7VWxXjhkur4miqxK+2t2sy7fly2igbKsKnkVeW+rpCGStGVFyioZUPpr4vIcrrp97pzc96QW9QLGu72Y0gGyoAsOcUrfQhnHd/6LnR6mYMCnomDDGx9O4vkadpjID4WtmzuL9itLTs6PD31STRNMHrwrXBIHF6s38r8bynjvUh5odWaNdujw2nx0bS2/7SM9LcavUaQKMb/2d4FkbryfFOiwi5egbjrixWA8m4k1soIpjapoXDmyTRZWkU8RQpa83scGrmKWtEnPt9C2wxBamuWlgYC/E6HchC/N8b6uwBQRXjmYc11jYGQy9PIJHFh0ZqfCysap6j1lFCd1g6gHUZLwHP1DRJKRZLvxe+Ylud+EkXz7bG4CXZ6PlunSJ1eN64467a7f5EQG4QlzmU4/0KSrz+JyafOTQdvo3mzweO43fAXWm7n9tVkXGe3GgLb3ZbQ8s8DmWppzcUrj6PHKCRd6D+lthpKyydLta/wZAFgsuXnS9ZcfMEqz1oUtZj/sN5wyTU4frqA2/iPedD/cvcASepFDHHNnlCl7vHm/CdHT5iUnZd3CWye0seXlwIRDSsRzUgu31MsxpjCtVMLLG08DOTer3vipooMRjpO0i/SknSTZfcvUcvsGAfrkNXpLViUE1+wBuSb5QDd0FpHDdXUOco9VZe1uROECAJZcG31GU316w6WRSxbFBLGWO/mUMA+JlNdk3Ofqp7s1kETNYxVA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(122000001)(53546011)(6506007)(66946007)(76116006)(66476007)(7696005)(66556008)(316002)(66446008)(8676002)(64756008)(4326008)(110136005)(54906003)(33656002)(71200400001)(2906002)(41300700001)(186003)(55016003)(83380400001)(9686003)(26005)(86362001)(52536014)(5660300002)(8936002)(38100700002)(38070700005)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7713
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	361d385a-f216-4f8c-9350-08dab3c765b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8dVIqKgSp38pW+1FebRrCLlpQ6rhuUtTT11h3VFu5vgIPWRMZh97Hkf7jCTnTwRkEmEkRrteu8AH+owLDwo/r+v0B9K0U6l1vrecI5eTcv+mHZwOHga1pm1OADgA7aHvVvLbz8yEgv5nkEYuQmUMsfMlaFIUeQW8eR9JwEsBTH2MpHXltIP36Vcx7hIvBiWoxZ0nOlSm7HzgSZktW6S6BXkso+gVOAOJsQaZw1WcZaG0dhQbA8NIC9ua7sNDIEVApm59yb4sUb1qRObPvq1QUV0fKn2QGk0Nf/Ob2iu1dy8eRpHXd5aSQZwSWlYE/XljGSm03p4EI1sShJ753zPawQhZdrvKnmkPz/jmC+Fdk657QsLYhYH5JhInChgmV9sq6pKa8BN6/yxiV8K/x34x4pvC3gL5H/Y7b9u9rcNUH1gNkiG9F5ztgfgDu10VnPGmFdyb76zyt7TfuCzTrQMEs5Ix7U6z1X/wVTkigjr1zAKdaP2GwJh314YIejy1ur+ytUIx9i76pgs8b4UoTxttbpBOXFIbgKFXwOso1uFVDfvyx6+W4YVrfiWL6w738uccpHJrJfLIT1h9PzaExlh6CHocjD2rVkf1ffe5J5muLUq3fnRW/M+igamSGLu5MvqACcY+uQBh2oEC2UcLxX/D/zEcbNUo0Yn3vUJiempYfxSoXJdEaVkNtX2L9Cce7IMNZ++yxC3CYCIfUKl08DnGr1OpUmJAlssOOh8CVRj8riolRzMX6th5/eJN/B9g/E2oQBVk8CZZtUOrtnrc75+3ag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(26005)(52536014)(81166007)(2906002)(7696005)(9686003)(356005)(336012)(8936002)(82310400005)(53546011)(36860700001)(6506007)(83380400001)(47076005)(82740400003)(5660300002)(41300700001)(55016003)(186003)(40480700001)(478600001)(54906003)(33656002)(107886003)(316002)(70586007)(70206006)(40460700003)(8676002)(86362001)(4326008)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 00:50:31.8163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4c10e2-36b4-453a-bd97-08dab3c76c09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7395

Hi Bertrand,

> -----Original Message-----
> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
>=20
> Hi,
>=20
> > On 21 Oct 2022, at 15:40, Henry Wang <Henry.Wang@arm.com> wrote:
> >
> > (+ Arm maintainers)
> >
> > Hi Oleksandr,
> >
> >> -----Original Message-----
> >> From: Oleksandr <olekstysh@gmail.com>
> >> Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on A=
RM
> >> Hello all.
> >> On 19.07.22 13:40, Jan Beulich wrote:
> >>> On 19.07.2022 12:32, Volodymyr Babchuk wrote:
> >>>> Jan Beulich <jbeulich@suse.com> writes:
> >>>>
> >>>>> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
> >>>>>> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call=
 to
> >>>>>> iounmap(), but not added corresponding include.
> >>>>>>
> >>>>>> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
> >>>>> I don't think there's any active issue with the "missing" include:
> >>>>> That's only a problem once Arm has vPCI code enabled? In which
> >>>>> case I don't think a Fixes: tag is warranted.
> >>>> Fair enough. May I ask committer to drop this tag?
> >>> I had taken respective note already, in case I end up committing this=
.
> >>> But this is the last patch of the series, so I can only guess whether
> >>> it might be okay to go in ahead of the other three patches.
> >>>
> >>> Jan
> >>
> >>
> >> I am wondering, where this patch could be 4.17 material?
> >>
> >> The patch series seem to get stuck, but the current patch just adds a
> >> missing include to fix a build on Arm, so it is completely independent=
.
> >> I agree, there is no issue with the current code base as vPCI is
> >> disabled on Arm, so nothing to fix right now. But as PCI
> >> passthrough/vPCI on Arm is in the development stage, the developers
> >> enable that support in their builds. I think the risk is rather low th=
an
> >> high.
> >
> > It seems reasonable to me, but I am curious about what Arm maintainers
> > and PCI maintainers think. From the history discussion in this thread I
> > think it is pretty safe to include this in 4.17. Thanks for the ping.
>=20
> I think this can safely go in for 4.17.
>=20
> Cheers
> Bertrand

Thanks for the feedback :) Feel free to add my:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> >
> > Kind regards,
> > Henry
> >
> >
> >>
> >>
> >>
> >> --
> >> Regards,
> >>
> >> Oleksandr Tyshchenko
>=20


