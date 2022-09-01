Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C615A8A02
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 02:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396131.636149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTYPH-0002Ti-6Y; Thu, 01 Sep 2022 00:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396131.636149; Thu, 01 Sep 2022 00:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTYPH-0002Re-1g; Thu, 01 Sep 2022 00:50:07 +0000
Received: by outflank-mailman (input) for mailman id 396131;
 Thu, 01 Sep 2022 00:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjVP=ZE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTYPF-00022m-5c
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 00:50:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02a012b5-2990-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 02:50:01 +0200 (CEST)
Received: from DB6PR07CA0074.eurprd07.prod.outlook.com (2603:10a6:6:2b::12) by
 AS8PR08MB6647.eurprd08.prod.outlook.com (2603:10a6:20b:38e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 00:50:00 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::1b) by DB6PR07CA0074.outlook.office365.com
 (2603:10a6:6:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Thu, 1 Sep 2022 00:50:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 00:49:59 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 01 Sep 2022 00:49:59 +0000
Received: from a8ca1eae88da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D69792EE-278E-40B3-B285-ECDDC0329704.1; 
 Thu, 01 Sep 2022 00:49:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8ca1eae88da.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 00:49:48 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by GVXPR08MB7702.eurprd08.prod.outlook.com (2603:10a6:150:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 00:49:46 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::a809:872b:d8c7:5aa2]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::a809:872b:d8c7:5aa2%3]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 00:49:46 +0000
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
X-Inumbo-ID: 02a012b5-2990-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iDGlN40hriIz/ezX+FbsCtw+ZGm3b2S3xF+6slT7cpU5YLnmda5J+i+ZdmHPZTuX4q38mdhwWCrhMj2HOB3tRzx1dEzF9sLxq52jdcPXx0RAnxid9wXAMNm1EgGw+Hf1zYzXpFwlndap4drONvBV4zf89Pk+elRusMxeWBWvhCeRANmu1jGnU/an0npxoHW7xrwoBp5zHfVxjJa/0Qa9tzAxvr1RIfwfDKeS/z4am0BmrpHh68Q7CeTC8zZMhvRJSSGVYhZypSTL9f+lgQ4LouBT5NqVk+pVj2NCpRF1dfyn3/MWneIUDuT/YUiI/Y796x1bksIENCW0mkygXffGEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOmcfg2WB89T/2XD5I94nVy4clbXGlsYiw7qjYX7GvA=;
 b=cORyBXRM+hVUrDCS9sj9HBNDCqxd7F4+KusV3Ui91XhLAzh8wU4Y4il2TnZ3A0ZOr2huy7/KRb0/dfm4v3nJ8tOuVYeoUDnN+Gv5FJJ0JXxlq1lGuZLwvB8Xo+4s6S7n7EvSwq5Wd3jXqhVMSIrn1jGdXP91FYR7lG/c5/owwmE/ZqQyQQfNYOPLniid9Gn7YxFa/b+JzXj0YbPU7Gg/I7lpqPAr3l9B+aNp67MszROmoiS5WOp2Es/xYv7o3lcQynkFVOnz+6BOUg4u9VJ64vo70FwyGbMs4N1G7mE8BPHmFYU2lBcjURwA3KzYjPiEask+mdMOwy0FYargC0wfTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOmcfg2WB89T/2XD5I94nVy4clbXGlsYiw7qjYX7GvA=;
 b=MmDjEyXANKVMchyEypaP6AxNoiDCigzOUN/b3uTZ3WoAYg+hbfY+SN/T4hRJoysk2h94RGyr4S0rnXurb7zUWyjBXWJkXs49AfA6qPGzd8x0GMqd7GYOCOkWNjGpDlf+dW8cpNrxrLPyp5pqc/0TT5SNIACMwHK8c6nQ52AzZXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDNg44pY1W+QEFIuWCqqHXS54OMsnn81eeulwjTwgqV7ltNwnTEzJvK+dN5WzhES7KLnIxNV6JhgvUt/uxbDT08hsY3k66yshmEzobl/uZnarf3F5tr4y3l+9bcLRmw4ZwB50m4dAAviBSBpwfnPAGXPbf0Ti+vrpuDnrRS3l0GCfQw5jmSCcnrwQrQfjdapBsyV7ETIW/Vnk+H50Dwbr41yOqqbXm5Qm/SWQ7LeMf6PHr5Wa1mheKFrTUhI5eQuh2Vq22Y30sQ3Y7jg0LSGEUpNhtOuGSzcwGjUjbESNZb0kMpqMM5fVxIcmm/vzbbfDAbT6K2NsK0ucFh+AZCqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOmcfg2WB89T/2XD5I94nVy4clbXGlsYiw7qjYX7GvA=;
 b=eKI2hADDueQYcWmjeWM5QOIrH9KX2uzKMht52pvj2TeSpoaoNxdEjdKJE5z5qQ5bT+0hH4SacYSZ3AMtX8FSNu+F2+/9zE6vj8H2DGPZPvBidnLmTq8LmewiGuBjMOeWxcprKlJLqtStM8Q/TvH7UyEKalpMuNtT5XRQPYBqqOfS+LA2ATkedlkeA4aulSsuugjGatyS8sr1j6OiHFjS3nBfPxawEYAJAzZf4Xp0CVPWFayGSvveIwzcGsOST643OpRNw97aVE5XK2N2gq81je/Y79z4Zyde/DhgDy1yGj83XtUkq2oIsbFhMOEDCOopBnLSR0dPN8amW/fuyPTfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOmcfg2WB89T/2XD5I94nVy4clbXGlsYiw7qjYX7GvA=;
 b=MmDjEyXANKVMchyEypaP6AxNoiDCigzOUN/b3uTZ3WoAYg+hbfY+SN/T4hRJoysk2h94RGyr4S0rnXurb7zUWyjBXWJkXs49AfA6qPGzd8x0GMqd7GYOCOkWNjGpDlf+dW8cpNrxrLPyp5pqc/0TT5SNIACMwHK8c6nQ52AzZXY=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugTfbCAM/WyEil7pMplK0r3q3GqcQAgABmBoCAAKwSgIAAgPtwgAFuhYCAAB5nAA==
Date: Thu, 1 Sep 2022 00:49:46 +0000
Message-ID:
 <GV2PR08MB8001A9F842418D5AFE034243927B9@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208301013500.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB7991AA505E621A7B6E8B906192789@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208311548070.2375071@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208311548070.2375071@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AB03E5CCFF36ED48AC32048EFCC90B1B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 42556220-ce62-4609-a90b-08da8bb3e5b8
x-ms-traffictypediagnostic:
	GVXPR08MB7702:EE_|DBAEUR03FT059:EE_|AS8PR08MB6647:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QBOrX/P9ELC7E0TVBrDHFJbOqGC08NgxQ0EUQMs5v/rszf+a5PmRBWZ0dwAF2OQ+JA1EBJoJEk8aZyC1DizKRZFuc+Nt9wTw/FsaavmDLixjtzTuWh1UOnuVd8BdyjVSvUQZrXNnqWv/XqkCVBzAL3YR8KBi+pCABTrL+3VkeK421J/ngLocFE/c74Wwp+VTbSbkNMWPkQBukNKTkZCQ5bzTp097cmRLjSz+hbfrXw98uSYa6yJklWsP2izxqg0BwTIx3HFynsqwopf4JfY9QUACreA7I1I+KBBH6ADKYGcr42ftbHlyXEZ5vYRhw9wzKhw8IsVmWGnucq9juybSVIAojsiEVwaRj5Pzo3wcEwKPgdxJhwrhKpgKp0uXQpzv+53s9fhk5mSyc7i+0s7yRSQ6NFvApzQo8tS7/8sksN7zsABNRs6OUNk/lj+t07bP3lqX88HJihEhTKQegDsmkjRW8udkPTI16zeJQUznW4DffF/xC3Y3vNG7Nhpw3AMW9axhxdDMqLE5JgJA6vx9UMUrjIG1O5oXN83ygLH9ppNrCKlvA4kmKjYXknCMnPySmtZKqqBZyx5KUDUm6Z9wyI+N6FZaeeamTghW8A/w0tL7uC01v6bptZ9Ad6vL2XksrxxHd/Qzwu4myt6gjLUgpMq2ZbK6cbZGBa8pDU6pslrm7NZKzktaJvt8yZ5UWpXrBlcMyqw0vE16gwJ4tvcAL2F1qzqdIfsCB+do1gFILlrCea9DV/ne7ygPwoo1cQ8tdra0OLfszwjL3afgvBPgRg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(186003)(33656002)(71200400001)(6916009)(316002)(9686003)(26005)(7696005)(83380400001)(6506007)(2906002)(38070700005)(66446008)(5660300002)(8936002)(66476007)(478600001)(54906003)(8676002)(52536014)(122000001)(55016003)(41300700001)(86362001)(38100700002)(66946007)(4326008)(76116006)(64756008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7702
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2a2633a-f1cf-4509-1911-08da8bb3ddf7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GugJ7t+42f35R3O19r/x2OUfBdgD957ObWiNGw3ysHPD06yj2oGNmMtaUuB5wBZ+Hv+ZeulA6DhaWR7kFnShs/7qdu61frctJRtfZTeJax0FutOzgCwkJlRFAu3b+WXXpU823iRqL4UJ2nnFCPjHMQJLwG9WWtiYtNOl6duLpYaYnqiLJxKIXQtNPsRAy7L8LVvnrNQLtuRqgqHxdeenXKwpezKkc2qpo0TRB22LxQB1HyWffTvIUTEdqMliQC8jwZWHKg+sAxanuEDp8ks9SRa/GxARbDXRz2kZndpBCeG/+Op3LTdf9BljGhBW+Y83WVj2YAGywwbNm3WBlh0oMzkyoF8h06zQ+J1XO/zql7AaTnisyNtLEsocvcYTVvUbu2u+WmVQMC/H73zcrEPugd9rJrWg6wDKCovDnvAY0QJHxVZdiHTRVF1i+/1q83MfQuxIXhMeUjSahW5oCMRie51hiztLqvMb0y+5kAB7M6ZM7KDyuOLgNC1tqM1+N7nK2mQ9bwR7TG8bG50FJoef/8elz4FvaL3ricoHt2oRXH9qvDD2Wqsw9fYJAT6asElDmenwsnq2mcNI1YVRIVL2iqZrvYVqgBFsvFOlQi8hXbqsQP5rRHkPFsPITL8mXBw4+jt5svbErg2tj0SzKf2BODS4Pv6eimWIpnANFZjvQ+pqCTXPJpx7ACFsgu2C2ybcGryJm37As3emCo2kEjnWWk1ca2alBQSQ12OD6YXwaqNHUX5/F3FbWImVPIwH1/cSMMspcR++gjbj4Ga4f0m0oA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(40470700004)(46966006)(6862004)(41300700001)(5660300002)(8936002)(52536014)(33656002)(40460700003)(26005)(9686003)(107886003)(82740400003)(2906002)(6506007)(7696005)(86362001)(55016003)(36860700001)(40480700001)(82310400005)(186003)(336012)(47076005)(81166007)(356005)(83380400001)(54906003)(478600001)(4326008)(70206006)(316002)(8676002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 00:49:59.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42556220-ce62-4609-a90b-08da8bb3e5b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6647

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> > > But also it looks like that on arm32 we have specific requirements fo=
r
> > > Xen heap:
> > >
> > >      *  - must be 32 MiB aligned
> > >      *  - must not include Xen itself or the boot modules
> > >      *  - must be at most 1GB or 1/32 the total RAM in the system if =
less
> > >      *  - must be at least 32M
> >
> > ...here, with the "1/32 the total RAM" now being "1/32 of the total res=
erved
> > heap region", since heap_pages is now reserved_heap_pages.
>=20
> I see. I didn't realize the full implications of the memory being used
> for both xenheap and domheap on arm32. In that case, I would simply do
> the following:
>=20
>=20
>     heap_pages =3D !reserved_heap ? ram_pages : reserved_heap_pages;
>=20
>     if ( opt_xenheap_megabytes )
>         xenheap_pages =3D opt_xenheap_megabytes << (20-PAGE_SHIFT);
>     else
>     {
>         xenheap_pages =3D (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
>         xenheap_pages =3D max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
>         xenheap_pages =3D min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
>     }
>=20
>     if ( reserved_heap )
>         e =3D reserved_heap_end;
>     else
>     {
>         do
>         {
>             e =3D consider_modules(ram_start, ram_end,
>                                  pfn_to_paddr(xenheap_pages),
>                                  32<<20, 0);
>=20
>             if ( e )
>                 break;
>=20
>             xenheap_pages >>=3D 1;
>         } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
> PAGE_SHIFT) );
>     }
>=20
>     if ( ! e ||
>          ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
>         panic("Not enough space for xenheap\n");
>=20
>     domheap_pages =3D heap_pages - xenheap_pages;

Thanks very much for your time and patience. I will follow this way - with
the comment also updated of course (I didn't realize the comment needs to
be changed until yesterday when I sent the reply to your last comment.)

Kind regards,
Henry



