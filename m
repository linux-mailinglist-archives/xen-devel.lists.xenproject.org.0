Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB114F7995
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300503.512611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNSe-0001el-9E; Thu, 07 Apr 2022 08:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300503.512611; Thu, 07 Apr 2022 08:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNSe-0001cz-6B; Thu, 07 Apr 2022 08:25:48 +0000
Received: by outflank-mailman (input) for mailman id 300503;
 Thu, 07 Apr 2022 08:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WyQK=UR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncNSc-0001cq-M4
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:25:46 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51ae8211-b64c-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 10:25:45 +0200 (CEST)
Received: from AS8P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::8)
 by VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:25:41 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::93) by AS8P250CA0003.outlook.office365.com
 (2603:10a6:20b:330::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Thu, 7 Apr 2022 08:25:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Thu, 7 Apr 2022 08:25:40 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 07 Apr 2022 08:25:40 +0000
Received: from f6342b574644.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FED5E74-749B-4C8C-B41F-5ADC526EB92A.1; 
 Thu, 07 Apr 2022 08:25:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6342b574644.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Apr 2022 08:25:29 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB3011.eurprd08.prod.outlook.com (2603:10a6:208:64::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:25:27 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:25:26 +0000
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
X-Inumbo-ID: 51ae8211-b64c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBfftMvijzxMFWX18I6SGsfEneQUU14yaAzJ8zmWfns=;
 b=GwOzeHG9nvdf0gQ2s6l2F2BQh9AArO/8eUQnn+GHe36HttFhATL98DdnQkf/oXHohsqilJGl2EE3EfbXFsS1sV6cs0+kkTOiUVDDKsLLCFdVd2kbUqdeGAxB/6ff41RR7ZU0tUNuITAgsCDuwUp21GJDCIS9rt25yPzeHQg4BFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a09748658cc7ad8b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpKnxRVvcuhCK8D76qHQmdjtzQnRgXS1l2ogTUJCVhc91yqrWGN0szkSTxvybWEDd224jrGq57YFKUQJfd4RP+7I8DSmoqOOnXmpEmMsk6d4wpXODepx4se3tNjTaCBIoIzKzSBLPm/SFPAdW5FSVCU9ljR3JMdAPM8I+B0TN+ZaLCuzgi30nucw82kZVnpWRd+LDwLxAOS4nMQ5UyZ7OIvuXGJKAUIzpVPAnJLxGzV9GCltK/nqBzFNfhssRLBLxSr3723WR2xh33Bza+VR8u3iC02oITkJngaS4NBi26ywNARHusQM2MlQqNc7Z3kiq11uj2f0+I1yL0QGySSk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBfftMvijzxMFWX18I6SGsfEneQUU14yaAzJ8zmWfns=;
 b=OI5UiCOnxYNaJLKw/6ezNzbOam4lLOnwRDLj2zYsKJrYxAlfhy1SEIkMwylf52bHOb0KV3jfthziMEQTX72udn+psI1Z3KRYEr6ufl95+B/eQywCezAblezCHL+MmzepnKObCZGSDYFfrpsRRw4iXGqgcFsDB4W21sffpTJM8Vok6mwHE5XnbJ/a41odSl5F3fbDmsVjkrYS5ieCS7vPjZLZ8irXUMRDTQl8odnajQzmxPscQcXm5F/xn4Tj+9pfHZwpb4DwRIPWWj9Fd8o+ttR0ILfwErnYA0tm3j2APZhLaJge29O6190W85QVRSSAluOB/3XPn5sxTN/d57F0gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBfftMvijzxMFWX18I6SGsfEneQUU14yaAzJ8zmWfns=;
 b=GwOzeHG9nvdf0gQ2s6l2F2BQh9AArO/8eUQnn+GHe36HttFhATL98DdnQkf/oXHohsqilJGl2EE3EfbXFsS1sV6cs0+kkTOiUVDDKsLLCFdVd2kbUqdeGAxB/6ff41RR7ZU0tUNuITAgsCDuwUp21GJDCIS9rt25yPzeHQg4BFo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Dario
 Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 2/6] xen/sched: create public function for cpupools
 creation
Thread-Topic: [PATCH v5 2/6] xen/sched: create public function for cpupools
 creation
Thread-Index: AQHYSMtc+gOWASCxzkqv6vdg7Z4J9Kzj+f2AgAAme4A=
Date: Thu, 7 Apr 2022 08:25:26 +0000
Message-ID: <E9AE3F33-F828-49FE-9270-559A268FCFD8@arm.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-3-luca.fancellu@arm.com>
 <9e776738-7e54-27ad-0a41-dc5cf8669510@suse.com>
In-Reply-To: <9e776738-7e54-27ad-0a41-dc5cf8669510@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c2422e45-a3df-4cce-4592-08da187033a9
x-ms-traffictypediagnostic:
	AM0PR08MB3011:EE_|VE1EUR03FT034:EE_|VE1PR08MB5807:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5807D7425324CEC43DE93783E4E69@VE1PR08MB5807.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FXZsJzZJQLAstSgAtI11EjvY0I8Ok3vGlR0veMTSCLnEW6CAWLbueSCPsxQdgLSy7HiD0P4ob9prX8k1fnS+ijtOI9d2D3TniSR4TKvNjuth0w6N6aoi+1GTdk1CWNc6kC+qywSCVQFxu5F4gi3qAK8VRq5vnAaFnvBMp3yzf1dG2Xf3yZWQn790zziHmX+Sv1LyU3pdBI3Y6KYyGxyRP2BwfEkXubNRPtpqC3K1VXw7b45kuKD7N4SM074fpXOLFVY4VJhzJRAWh2YBd+twCx7j+5+lUP0i+ddy+9DGGI3lz1GEOP+p3P5v9wuB5LkVzI4Gog65c0Gw2EpwIXEccXrFHVfBKxv3jSPP9FU8Pf3Gd8Rtyjspt++QXQ0yHoxK48FQex0+yGWTn0OMBaS7pvp0B3mwfMsVPyY4MmwX8OQuSbM43x7fd7IqsBej2qtThiu3p7AXLSs3hzV9oOTXHEm1n+uDiPhw7d0YGPAVxYVgr5X/pwuEbpN/coo98Lp0yGmMvbQt2wf3zP2zn1rVU9XdW0ix01z7znqrznmPl8zXEzRD98vZm/qVkg53NeobqS04BCirCASTYzocqWvku2qYAGjCwfhHC4Jj5Gi4B4NUykEGvqCfvhJFgpjddMlAez39u/rcxx1npHa+uZ3uB5xTkjuFW1F/doZQSB+gb5t79IoHWoNTUngSxa9ryNr/k7DOLVqlmeg4X+8xJfFRTW403c0pOCW/G0/jfGgtD3CLLA65xooWDYr8QjOu3fWw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(4744005)(316002)(53546011)(2906002)(38070700005)(54906003)(8936002)(6916009)(5660300002)(2616005)(6512007)(38100700002)(66446008)(83380400001)(4326008)(66476007)(8676002)(64756008)(86362001)(33656002)(76116006)(66946007)(508600001)(91956017)(26005)(6486002)(186003)(122000001)(71200400001)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <066082DCCC534444B3EF841315173112@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3011
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61636500-e6cc-450f-200d-08da18702b40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Zu5Bj7KrhEI7RCVHrxnvfqhbs9nUK+0rD1oDVLcUcme010URdyu05Et5Q8Tg3A/m9N0GYiVsM/bYbq1PQQqEQonYcwCuGiQttiLBb25Gh9AjaYNlZmSqREpyf4H5nRNUyzZlcdwesdrtoB88oEv3bzbUoj7IZfuyBp3w6tBzggic8OC6tts5U1S5iRfxvDYkIWKDH1HG0Ikzgnjf4K8X9nFsWs4yPisoOIQRb+qFPT6uR1CQRtLH5Ou/SfRp2e+TExus+7MWq7mly/ssZeofps5WMva/gRyN710Esmds/JvUE/CeKs3VHzUk0LFOpZjCQ2V7T4StGmfQp7abCxZddGG3P87u7WRgK2jhDFnEeyIrKKT6AF1VKdxB7rE4mRf4RPUY022M0qa957ysUHgWc14wILLtD8EnCGMRHOMGBBI0583F9hGf3AiOgxqku+F69rJWTu5jSZE3oZSP7DocrK0Cm//L9CRbpWkxrugeC0sTs3Dx1Y4HRuNrDQP+2Gw2GdGPIqRgRk+kiGvCpm5VY/HFV9EIhfs6BwfaJdbAUSCoxMvAtfnSTyAA2FemwI6n92bBQfwum5rQmUYZoEnR9uo/VpXGv1JCpmb7AlxARb72ptQRR0PaiKgKa7adfuu3nCLG4pKLNN7wCGKbAAKbGfz2JHyiInaKtVMCUHN9sn27uQdKBP3J9OIPNBG/Bju
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(6862004)(86362001)(8676002)(70206006)(70586007)(2906002)(4744005)(81166007)(5660300002)(8936002)(356005)(336012)(83380400001)(40460700003)(54906003)(36860700001)(2616005)(6506007)(508600001)(6512007)(53546011)(26005)(186003)(47076005)(6486002)(316002)(36756003)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:25:40.7544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2422e45-a3df-4cce-4592-08da187033a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5807



> On 7 Apr 2022, at 07:07, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 05.04.22 10:57, Luca Fancellu wrote:
>> Create new public function to create cpupools, can take as parameter
>> the scheduler id or a negative value that means the default Xen
>> scheduler will be used.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes in v5:
>> - no changes
>> Changes in v4:
>> - no changes
>> Changes in v3:
>> - Fixed comment (Andrew)
>> Changes in v2:
>> - cpupool_create_pool doesn't check anymore for pool id uniqueness
>> before calling cpupool_create. Modified commit message accordingly
>=20
> I gave you my "Reviewed-by:" in V2 already.
>=20

Oh ok, I thought I had to drop it because of the change, I will retain it i=
n next
serie.

Cheers,
Luca

>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


