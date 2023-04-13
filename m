Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07266E0D10
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520655.808480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvSo-0002tO-0a; Thu, 13 Apr 2023 11:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520655.808480; Thu, 13 Apr 2023 11:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvSn-0002sI-Sq; Thu, 13 Apr 2023 11:50:05 +0000
Received: by outflank-mailman (input) for mailman id 520655;
 Thu, 13 Apr 2023 11:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmvSn-0002nV-41
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:50:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 536c908c-d9f1-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 13:50:03 +0200 (CEST)
Received: from DUZPR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::20) by AS8PR08MB8733.eurprd08.prod.outlook.com
 (2603:10a6:20b:565::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:49:57 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::b9) by DUZPR01CA0078.outlook.office365.com
 (2603:10a6:10:46a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Thu, 13 Apr 2023 11:49:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 11:49:57 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 13 Apr 2023 11:49:57 +0000
Received: from fe975fe53355.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA495623-D270-40D6-8A34-9D226E5F055C.1; 
 Thu, 13 Apr 2023 11:49:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe975fe53355.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:49:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9387.eurprd08.prod.outlook.com (2603:10a6:20b:5aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.42; Thu, 13 Apr
 2023 11:49:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:49:44 +0000
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
X-Inumbo-ID: 536c908c-d9f1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KENF3SNCqPm8wKQyaXsksLT5Ho8kPPZq6WXd2priraM=;
 b=zVTsnV6uWLmr6km9bMLi3bO8BMY6XkYuP3s3M1EGTbhG9yHwkU4LipazsElv9lTYtP6fCJoZYo7SHDMIT1wD+2ye41txPc1qC8GCtM3y9LUR5wiQVWu2Cwnc0oPQ+ac7w5w7LpcQZiU/sT9U+b3Gk5wMpaRg72Cu17nYKrJBuAY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edmPGFuwO9J+KypHiLoVG0aVPJkRodKolRfHjb2GanqC3b6MeZspAHe1ah17XLayVnjfJIQtNYPC4wPSt4vgXGMZc3Np+1/WXe0sws6AnELVzGw8GhTeqFYg/b5traqFo+vKzgb3UCKRwNv4B/9EemH2iyNUnnJizey057W5W6myX/GBmSlNVrNwEKISOMa+1GPE5MtqprHn3SRSf3kIkpnQ7s9yzXTY8O3KQ7AexfQPylx3xcwT1RYqcmjqXyQbDzbil+ayL4DNgWUTY3EYoJADT2ksIjCB9fyjeNltYLpSMyX/geG+1RqMauNPVjt/7XadpKBPRUHZsGqkEmnvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KENF3SNCqPm8wKQyaXsksLT5Ho8kPPZq6WXd2priraM=;
 b=DcSjNa1ULkTMOtL5Y7r2zqfcUpuwyAn6kQZYf95a9eye51MUSETnpazEBY5ckEXTIOr3YtsnuxxvcXgi1JLV8qZ+NGMTmLyP4Gf9aiswQ9nsIUJL7Dq499uhKhWpEMWrPCfaIhCagw/vEKLDjnl+nJMfuuCfu/wGRF29lGz8BNDpUU55HYo0ytf3aaEmJ7N2kGN/pIIdjNXkFsbQDL5fuk+A0QeRhNUfgzkqyeiCuGpC/KS2BxybI3LcX0Zed6EVsAnhszdJk2eJQDW1Rbp1B+GF6M6JG/44ECgt+B33D99jvhtD40NhViSzEEMRVrB3cuoBDaZdrrLuHuhXwGncjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KENF3SNCqPm8wKQyaXsksLT5Ho8kPPZq6WXd2priraM=;
 b=zVTsnV6uWLmr6km9bMLi3bO8BMY6XkYuP3s3M1EGTbhG9yHwkU4LipazsElv9lTYtP6fCJoZYo7SHDMIT1wD+2ye41txPc1qC8GCtM3y9LUR5wiQVWu2Cwnc0oPQ+ac7w5w7LpcQZiU/sT9U+b3Gk5wMpaRg72Cu17nYKrJBuAY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 16/22] xen/arm: ffa: add ABI structs for sharing
 memory
Thread-Topic: [XEN PATCH v8 16/22] xen/arm: ffa: add ABI structs for sharing
 memory
Thread-Index: AQHZbdfWFMmwO7dS/0GyxucHcZRHm68pIDaw
Date: Thu, 13 Apr 2023 11:49:44 +0000
Message-ID:
 <AS8PR08MB79910752526D506B3BA881EA92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-17-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-17-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BC511DC5E2FDEE4F8677F399D504E0F2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9387:EE_|DBAEUR03FT026:EE_|AS8PR08MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db85b56-7abb-412b-cfe3-08db3c153454
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vUe7HQ0w6R8lutg1HQ4KUtOc2ZVBc33mMrjsmSFI8ZobYzMaQ2R9pj79zBRfhcfAV60Fe/ansOdbmcXJcjarssDVLy7O+1mxpwPk/B8cNHIKd7hYHUd+6NbQZFTgL7f1xTmYng0NrO4gwQRAufe8BrKUYKltmGQM3B0zF829b/VgzMD3tc6eNDyl0Wrnk1TiSIYtc4A00ZQIrE6ykuAS0Gurh6VaLKc412/4K17zFYr7ecszbbfSkXKDCzhf9cflysqvf8IjU47CQVGqxw9C64RLW76x9uBmDuWEhd6aKPKbqcMgzBctxptbIfHjuGSQ5KMpaWQDPtU07K1Rdwi83adpmUX9o2sCkvJPhdgW6EDStBBS3UNW93UoERs4mFvYMg4pi1l8NvgxMDbtiMpWYurEnVoRmT7vgnTjevUqgvhmNxRH4RHsxFvwoFrH4C9nbX1vfWr7R98YLJqabFKxR3wWjWezuhue4rsg87deYxHYo5wnpC4EvhOSBo4/h5I75kUGsgihjMXhk3VRBq76UDE+ZPzPwdd/SLFRyJqOpfAjwL70oMqyOuG4v4JtoYWsHeVCsyTqqy5QtvKx2+mIJP+QufnqqXsXK9OGtUJzAC3SyeLuK44NamHS/oojIhLD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(86362001)(186003)(33656002)(6506007)(9686003)(26005)(38070700005)(2906002)(4744005)(71200400001)(7696005)(83380400001)(5660300002)(8936002)(478600001)(4326008)(55016003)(54906003)(52536014)(316002)(110136005)(64756008)(66446008)(66476007)(66556008)(66946007)(8676002)(38100700002)(76116006)(122000001)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9387
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa84e76b-c697-4f61-9724-08db3c152cb1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZdkISEIfWy3B7DIL24Maa4gYurqAZAhu9ntM94M7FjkAb/F1O0M4DBlCrR2rWiJadjBnzJ1wZSAK8GKhAbL1+zzibpsoQKJQantcx/HzjTAZpcGwe9K/P/VauGAKGAs9jp9wTsr8mxF0mWyx4iaqUlGNhF49nvQSPxzqUyqqRj2fp26+cUx/Q412i3/89qmH0KGimj7jBztqNbDre5JGaznMffe4vLnTffrKf4brbRi1/4XSqvVutrizPtCPxpyFWMfAoKYx5wubro5g/wYR2/rYfgdKALq4pJEe+zCjeh/YuORDjOmFXbklDxGeZNeuYpplG9Ax5UZcA70zf41JdMQeXQ2o9VVUsZP/rGS1qv3EtNOvRb5KaxdoNepeshY1qelHKRApaAOubr3pk1wmDvnrcjZh7E3F64lD8nRPXCjEfk81PBgtanMxQNAdQJixHlA+p066zsQT3EIqR14eI/6WEYwnDYYMsJqLQr4u1yOKl+lQSgtk0JvnGRhXZ/Bc9IuFMQgChYWKf0Ew0eVREY3kcnaaR6gS4FAxQ+0WEMmwRLpAe1mgrTFQ74eqqAk7bvu97vRq9pRXjainT0bxVbTrmwHbl44GfS3cmg+yq0EYwSqPDgrX9Ck4gcgQ2hjhlaXMW4A8n/oSmtwokUA2YeCsSKDOAqgObNc0L5dLFk6zVOKfo1TPJ2Q+P/B9mEVhCVEkWh0UYENMKElnV8FLcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(41300700001)(70206006)(70586007)(110136005)(478600001)(54906003)(7696005)(316002)(4326008)(2906002)(4744005)(40460700003)(36860700001)(83380400001)(82740400003)(55016003)(186003)(26005)(8676002)(8936002)(5660300002)(52536014)(47076005)(82310400005)(86362001)(33656002)(336012)(9686003)(6506007)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:49:57.2854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db85b56-7abb-412b-cfe3-08db3c153454
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8733

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 16/22] xen/arm: ffa: add ABI structs for sharing
> memory
>=20
> Adds the ABI structs used by function FFA_MEM_SHARE and friends for
> sharing memory.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

