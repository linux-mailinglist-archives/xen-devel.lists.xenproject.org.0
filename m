Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7859E4CB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 16:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392001.630104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQUTf-0007oT-TS; Tue, 23 Aug 2022 14:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392001.630104; Tue, 23 Aug 2022 14:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQUTf-0007mN-Qh; Tue, 23 Aug 2022 14:01:59 +0000
Received: by outflank-mailman (input) for mailman id 392001;
 Tue, 23 Aug 2022 14:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQUTd-0007mH-Es
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 14:01:57 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50040.outbound.protection.outlook.com [40.107.5.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 254bba3a-22ec-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 16:01:55 +0200 (CEST)
Received: from AM6PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:20b:6e::46)
 by AS4PR08MB7456.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 14:01:53 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::58) by AM6PR02CA0033.outlook.office365.com
 (2603:10a6:20b:6e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Tue, 23 Aug 2022 14:01:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 14:01:52 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 23 Aug 2022 14:01:52 +0000
Received: from 675bcbc7f142.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44DEF103-6304-446C-9958-79CB5B25FD91.1; 
 Tue, 23 Aug 2022 14:01:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 675bcbc7f142.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 14:01:40 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB7069.eurprd08.prod.outlook.com (2603:10a6:20b:413::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 14:01:38 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 14:01:36 +0000
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
X-Inumbo-ID: 254bba3a-22ec-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WoLonNWFIs8Noend2qLvzFHpbRzm2y11HLmBE4+kxfHCdU9XZRX16fUlaWLhxmCPdeP52JlKc+vnKhgvZl+VkjKNcipMz0ItjRbBll6lDrjDnPhmKrWQrK4DQUtyUrnJVn+Yi0WyFJukZJ3jgkuCfOxfcYccjQ8VDdxDNX8BVkTRwYNHI00hceYWdggLTvJ+Tv/fiY99UJtbxTzqf/6UEYEX4f48GWQPsWvnL+xk/MZmcwA3lmbhCM8NzVVufiu+jnYrDQjdhVaujAvrB7JtpxVg8A5SwMYexD0Qh6xSmrqLyeDG077mZHLIXaHGwFoVZCllcxHIVnXxnpAyJZiaVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+ej1yBQCJVyJGLwgRjRJFHvX7WbtAvkJdVtj8uSI6U=;
 b=dSYQkNyfnXgNMqPTEIWXfnGFG+uDuhAnA9S+yvcL7tR9vqMOtO3CrCphEBTBSIuoNuxEBW0oIKSrArV8wk3kFhlmHLEeTkTPXwJVL3auI9S8J6dc9YbhsbSR78+dFsNwOcIdFPrfX8kmceJaeEVb5cf0NfkVzN27sbsQo/lQTB39y5c409l8kTVK7kLxIpGm0x2yyzHTgjVO3IPFlr4M+IheshW73Thb0QY0OouCCu+vnSbCZdpAkmabfAVl1y3F/YUAaHvBtxwAcA32z74fP0ZYEgQoJJHZpHDneAcRd6DeG7N/MkbS/ZKsrbtXG8R5CUB83fPcR8xD2QsPmgvoKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+ej1yBQCJVyJGLwgRjRJFHvX7WbtAvkJdVtj8uSI6U=;
 b=VqHBjyPU5uhIriUmC4338SICIE7HznGS3OIUXkEhO7KqnbPRch1fAQd/dHO44InhMVxpm7sSkVOMKxC/eiHU7vvuHASH6fDtm5cotWwAcpXIHNkwzmbp+jeN5Z0N1pNSJ+XqOi8Tok9XL+X72nrWHzwOTIYOBpcAW5tSAMFoIvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 566f88225bb25e02
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYYCxymk6m/j8dBB0KcYpdFoI1r0E5wiGxJtMWSnb1li3y2Pql6A+nfLallRubeQzi6qLEIdYzbtatlWTjqe/tLr9Jjz61uVsbS4vTGDs1/QPz+nkH86rGLyEDjg6sAvC8Mz5Nv+xySf7em1nCEwfUgNts7ReYAd7j1YVRD0sHgM7s2qGl66TgXh4dGXQa9S7z6Me8WKnsUbo44zlzina37HPMcT2aJ6vBhoxHlBcXrQH3H4AjYG09SW5juCd2ija75yjDfgZCi4YEYvyUBbSHQ4sdX/fzwzaxezfqxyuR4bqBdeOAACNCaOChDHccBIw4HP+GBAWj76bwrR70VhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+ej1yBQCJVyJGLwgRjRJFHvX7WbtAvkJdVtj8uSI6U=;
 b=JOLHks4if66Z+ILHfY/vDXWV7IItARjPHB/fEHve2Kaqt8QhNIv5MVtqj5eWw3Qp+7GZmsqnYwJZhEKW5UL70Jn8sMIOkK+rlk0BF2QdSgQlF+Pgs9Olcg97y7OxtQn3o2sl7wjcDldYHBNvrdI/5RsPpLwbo9sKGmWEQ9v+cUUh+AQaP5yNSwJsducGfs7rMj5DEWmjbqRDYJyl4FM8YhfkJuAGvh1423kHOt9JpSmdTh7cgLCNOv4F5Qc1QFNp4bsEZfLWjVDR9WMOoDtbN/W//4DSjTX/qWLWf403BXpVAQhChGVd9HLbF+VaXjc0PfUB+6a36bPJuuqQKSYDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+ej1yBQCJVyJGLwgRjRJFHvX7WbtAvkJdVtj8uSI6U=;
 b=VqHBjyPU5uhIriUmC4338SICIE7HznGS3OIUXkEhO7KqnbPRch1fAQd/dHO44InhMVxpm7sSkVOMKxC/eiHU7vvuHASH6fDtm5cotWwAcpXIHNkwzmbp+jeN5Z0N1pNSJ+XqOi8Tok9XL+X72nrWHzwOTIYOBpcAW5tSAMFoIvU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Topic: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Index:
 AQHYs7MVCCbVCzB/DU2JPHyjxuVOOK269JmAgAEvmICAAAk5AIAAJFMAgAAPuACAABSBgIAAFFsA
Date: Tue, 23 Aug 2022 14:01:36 +0000
Message-ID: <788C40AD-A1DA-4DD3-931E-01CCA72EA2C1@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
 <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
 <6A4EBDE0-60A0-46B9-A9BA-C689B9F8F129@arm.com>
 <fdfe8a77-34a3-252f-6aab-1850cc30c7a3@suse.com>
 <caeb00e7-6239-1d9d-ae78-008830562239@xen.org>
In-Reply-To: <caeb00e7-6239-1d9d-ae78-008830562239@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 513a33e7-ed5e-4350-eeb7-08da8510083e
x-ms-traffictypediagnostic:
	AM9PR08MB7069:EE_|VE1EUR03FT034:EE_|AS4PR08MB7456:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IB/Vi0cfupXAF6dt6EHQByD2IAj+dumF2bUsonnb5DaBQTUZAyKlbNk75tRHqVkFaSTsJ7zRBSdSy/bZR4hEhMAlvSrHvCVS0vBaDi9izcn0wm+PQYmWAX3ZDUCF5hhflU5OaDJh0UaoOraEWRJoUIYsOveCUncM0NguO5++fOqOxMzw0emkw68Yydxj0PklanYC6mXZJ7nDV1GHeveLX05UZ2sZlz+aMnICIddvTp+9IhIHleUbP/lERr7SdSBq198eepi7bBdMloK6wEtwtKweY1afFEwISqcteroKbYr0hlbEdtjiextZiFHd2k4FTLcXxfTmYyY8S8hNyRfpQdAFDzibbci9XlvOOVHvl4JUlnbJcxGUTKwNxntj0PIcNCaA97LPOXXYSxC1biyXySx4jGc7CgmxPdbCifeoL+qFPh7FwODIk8NqOUxfyHSUwfDVOKjy4BWd2+tirHNDFRYJtAwsV7adwSyDhUGM/wuT4Bn7FRsgQIB/0cKlfLlAhM5+zJPCSCu/IwThV0/PtwaS6I3g+EkU/eUubw+Z2x0D3wuoeRqkaMNugoh6B9CpNZGhFXH+5Ahf6AKy5E6F2++hCpHCqV93XzzirQaRHHAULrujUWOOtc1VBXCz1WhSTGHzy7huTDmMcXLO1BAQx+QMz4IhnbDVFLlqJm0DvR4m6NyOvkiFWQqMkcacruOI6nAY4bENNwqUDuDPOsfJkJLEvuexSPDb4Gt4sf24iglsL6leppkGfX2jTKEcNRR47gLWSCQxvhIIM30wlqAKzBkTvfBRCB5FiC/iFJdHkCA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(6506007)(54906003)(6916009)(86362001)(64756008)(4326008)(8676002)(66556008)(66446008)(6486002)(36756003)(5660300002)(8936002)(6512007)(26005)(186003)(478600001)(41300700001)(2616005)(38070700005)(2906002)(53546011)(83380400001)(71200400001)(316002)(66946007)(76116006)(91956017)(38100700002)(66476007)(33656002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F019FA9E0C2D1D4DB3CFB55BF24EFB21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7069
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	233f6a57-acd2-428d-2b85-08da850ffe69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EfdQ/j28cJFwQ8yvGUHwjJuezGvBuUN2udPREPUNlj85NXN0cKeizI5Tvz+OJRA5O6oJjRIXq5aHKM7MncU2n/VNEwPlIkgd+pyIfbBP5IhN9lbC37AFkrPrNqJjwncqqhOac2/T0N6RxWa3EZU44dCRgETPTaIGcvzXqDDPqjckfMc1KYznlJfjD/aUfXyy65fiZwIKEO3zEGVuJ3uvNBdSlshpHl9a+A8KhtTC7xHgcxxk75aBbYvufmNWj6twKOUYGfalkjHKaCsK+n0TplutnH83vyxCBhohFz8JCjx7lmySiag6b6PqK+W93bsJvPGsQcVGNqpSWNILadJVGmTLttKe0OrGNEIuBKDXHaSupKns3G9ex9hN4Jx/XGYMGXo324VsnmXwbMmzLTbc4w5jJgFwnEQWuRtmkCllhkH/PFvV+kzEoFadTbiAOY4GV/xJjxaoXNl6xNVZFozcqchhtXR+l5zfijyNIG5K7L0Apeu5bCTEOAO+n0zr11aGHH8/esPtvF9HqsjYh1ccI5tA8bTXEPAnFlRhGTdoNt0PIE2KI6ljToAyVfzsXWm/N3G9zO4NHKsPDC6znGwMGTMoJir7LzsXw/OAJuzhEDkfkrnAyQ8W2/+XWV6nAz/H4naPFJRujMKkTNZezfd4zOvVJmPtAP4K27CnKVy6LhJy2hbx9xWSPrVrV84HGoP/yl67FbKegPvo9VezuL0pABt/ffquyByYC8daVMDbh7Ol3l7cUm1Np5XqL40FXCoq+M5MIjCYMCVhKc/3p3+EPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(40470700004)(36840700001)(40480700001)(86362001)(40460700003)(356005)(33656002)(81166007)(36860700001)(82740400003)(82310400005)(6862004)(41300700001)(316002)(54906003)(8936002)(6486002)(6512007)(8676002)(70586007)(70206006)(5660300002)(186003)(36756003)(336012)(2616005)(47076005)(4326008)(53546011)(83380400001)(2906002)(6506007)(478600001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 14:01:52.9565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513a33e7-ed5e-4350-eeb7-08da8510083e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7456

Hi Julien,

> On 23 Aug 2022, at 1:48 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 23/08/2022 12:35, Jan Beulich wrote:
>> On 23.08.2022 12:39, Rahul Singh wrote:
>>> Hi Jan,
>>>=20
>>>> On 23 Aug 2022, at 9:29 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>>=20
>>>> On 23.08.2022 09:56, Julien Grall wrote:
>>>>> On 22/08/2022 14:49, Jan Beulich wrote:
>>>>>> On 19.08.2022 12:02, Rahul Singh wrote:
>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>>>>>          struct xen_domctl_createdomain d_cfg =3D {
>>>>>>>              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>>>>              .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>>>> -            .max_evtchn_port =3D -1,
>>>>>>> +            .max_evtchn_port =3D MAX_EVTCHNS_PORT,
>>>>>>>              .max_grant_frames =3D -1,
>>>>>>>              .max_maptrack_frames =3D -1,
>>>>>>>              .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_ma=
x_version),
>>>>>>> --- a/xen/include/xen/sched.h
>>>>>>> +++ b/xen/include/xen/sched.h
>>>>>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>>>>>  /* Maximum number of event channels for any ABI. */
>>>>>>>  #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_C=
HANNELS)
>>>>>>>=20
>>>>>>> +/* Maximum number of event channels supported for domUs. */
>>>>>>> +#define MAX_EVTCHNS_PORT 4096
>>>>>>=20
>>>>>> I'm afraid the variable name doesn't express its purpose, and the
>>>>>> comment also claims wider applicability than is actually the case.
>>>>>> It's also not clear whether the constant really needs to live in
>>>>>> the already heavily overloaded xen/sched.h.
>>>>>=20
>>>>> IMHO, I think the value would be better hardcoded with an explanation=
 on
>>>>> top how we chose the default value.
>>>>=20
>>>> Indeed that might be best, at least as long as no 2nd party appears.
>>>> What I was actually considering a valid reason for having a constant
>>>> in a header was the case of other arches also wanting to support
>>>> dom0less, at which point they likely ought to use the same value
>>>> without needing to duplicate any commentary or alike.
>>>=20
>>>=20
>>> If everyone is  okay I will modify the patch as below:
>> Well, I'm not an Arm maintainer, so my view might not matter, but
>> if this was a change to code I was a maintainer for, I'd object.
>> You enforce a limit here which you can't know whether it might
>> cause issues to anyone.
>=20
> I understand the theory and in general I am not in favor of restricting a=
 limit without any data. However, here, I think we have all the data necess=
ary that would justify the limit.
>=20
> In order to use event channels, a guest needs to know which PPI is used t=
o notify the guest.
>=20
> Until recently, we didn't expose the node to dom0less domUs (this was int=
roduced when adding support for PV devices). So a guest couldn't discover t=
hat event channels are used. That said, if the guest figured out the PPI (t=
he value can be guessed) then it could potentially use the event channels.
>=20
> However, for Xen on Arm, we are not supporting any guest that don't use t=
he firmware tables (e.g. device tree/ACPI). So for such use case, I don't c=
are if it breaks because they are relying on unstable information.
>=20
> What I care about is any user that follow the rules. We only started to a=
dvertise Xen via Device-Tree to dom0less domUs after 4.16. So I think this =
is fine to restrict the limit now because we haven't released 4.17 yet.
>=20
> Regarding the default limit, I think it is better to stay consistent with=
 libxl and also use 1023. If an admin wants more event channels, then we co=
uld introduce per-domain property to overwrite the default.
>=20
> It should not be too difficult to add, but I don't think this is a must.
> So I will let Rahul to decide whether he has time to add it.

I prefer that we will first finish merging the ongoing event channel series=
.
I have created the task in our backlog, Arm will handle this task in the ne=
ar future.

Regards,
Rahul


