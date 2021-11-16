Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9E452D01
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 09:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226205.390825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtxx-0001Kt-LB; Tue, 16 Nov 2021 08:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226205.390825; Tue, 16 Nov 2021 08:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtxx-0001IB-Ha; Tue, 16 Nov 2021 08:37:21 +0000
Received: by outflank-mailman (input) for mailman id 226205;
 Tue, 16 Nov 2021 08:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogMK=QD=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mmtxv-0001I5-K3
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 08:37:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 673fc09b-46b8-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 09:37:16 +0100 (CET)
Received: from DU2PR04CA0297.eurprd04.prod.outlook.com (2603:10a6:10:28c::32)
 by AM0PR08MB3508.eurprd08.prod.outlook.com (2603:10a6:208:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 08:37:14 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::42) by DU2PR04CA0297.outlook.office365.com
 (2603:10a6:10:28c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Tue, 16 Nov 2021 08:37:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 08:37:13 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Tue, 16 Nov 2021 08:37:13 +0000
Received: from 4afc61761474.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C7BA7549-B45A-4D8E-A97E-6F25D90DC152.1; 
 Tue, 16 Nov 2021 08:37:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4afc61761474.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 08:37:02 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6126.eurprd08.prod.outlook.com (2603:10a6:102:ea::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 08:37:00 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.015; Tue, 16 Nov 2021
 08:37:00 +0000
Received: from smtpclient.apple (217.140.106.53) by
 LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1aa::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.17 via Frontend Transport; Tue, 16 Nov 2021 08:37:00 +0000
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
X-Inumbo-ID: 673fc09b-46b8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxsdjH3NFxHT7NWiAQAjoIjnC7yeAsItOP6mJN4SgaI=;
 b=yluRB+QNbgKNd4M3LnsDV5y94q7/IkTw5ayFPed0nW52v/6kYYp/Xy9yUPPD8MgVi1bL8uOSFxhWP+8eMg5hD5qFG86zcYlqE+1eWGbj/Lixobk/+fKndt1YvpqrMzEouQzJtf6pErcDSglXjEMmu9fnlzbwHI6NM8n3ZB0yXtU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c18f76fd473b0974
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGkfrjSXXm9eYfk2xdm/DVOj4wnxJySKunz/18u+6mC03Es9t3AJMHCCYykn29c3pt5ILW7K6KlLx8fZ7JvE3mS/BSRtrOZbrHrFJlwZDHAv86VF1mRZKmKZ3e9hi3mchI3KnwsPzid6CHV+OGD66V/rhe//+UHrDi/TZmvgSZxub+Ivk/mrjuqRfEbCOt3/vhzUB+THlcke7KzPO1vyMAOwMWHzB1wwTqmJrEvFV8qG0UdEHA0+eR3KEM8W3Ngvwuf35mTgySsVlWSSR8fyfymfFwBzrxdEfgl4zLb/M41e2X1hOIRflR1yiR9TBMgOrmihm5BBekFwHvRR6Fd/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxsdjH3NFxHT7NWiAQAjoIjnC7yeAsItOP6mJN4SgaI=;
 b=J0sWd15Nnss1rLA9I7vhdjeIELR9QBpJ6W7/FM9wEeHbGSqpW0q5llQUaeWomZHjDXkzch+u+wwOYUU2PFwQYmxVCzmAyG7o5I+aX581ZGXJCwpjpeMc2yJyELRHvdyNMqznpI4PKrhScCBEhpY3TzS4CbNwCaaxDWzSWCBgAlwutS9ubTrMVckrdRscnGq+IMOkt7jeKHJo13DEuzVn7vgAA/szdomBD/gIrb5O8Y5uLHZF34tFzE0Lb5IV1oMEKVMJBgWOIxAzk8nMwmvxqDxnQD8WP8B5oCLakdViUUrOH+baKvGrmYzT/H47JYk/uePJ12VPku+d1Vq/2hfTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxsdjH3NFxHT7NWiAQAjoIjnC7yeAsItOP6mJN4SgaI=;
 b=yluRB+QNbgKNd4M3LnsDV5y94q7/IkTw5ayFPed0nW52v/6kYYp/Xy9yUPPD8MgVi1bL8uOSFxhWP+8eMg5hD5qFG86zcYlqE+1eWGbj/Lixobk/+fKndt1YvpqrMzEouQzJtf6pErcDSglXjEMmu9fnlzbwHI6NM8n3ZB0yXtU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2111151359360.1412361@ubuntu-linux-20-04-desktop>
Date: Tue, 16 Nov 2021 08:36:57 +0000
Cc: Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1606F25D-53BF-4350-B065-B1FAB525F6A1@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
 <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
 <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
 <725F3F68-A1CE-42FB-9C8A-0700CDD02E8E@arm.com>
 <a07ff375-b910-0d73-e957-15ba9d2535fe@xen.org>
 <alpine.DEB.2.22.394.2111151359360.1412361@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::9) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31810703-9724-40ea-a08b-08d9a8dc4a22
X-MS-TrafficTypeDiagnostic: PA4PR08MB6126:|AM0PR08MB3508:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB35085388C4E23FDDA1F36AA1E4999@AM0PR08MB3508.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zuFGhG6v13Km9197P2OlWu9MxmmBjpBjzSP+b7KJ+bn0IpEcRuZgXokzsra5pXjA3f7z65Dc4xxmdetSWko501lf220657SusPzBjUiJo7VPf4gA9bJwg3TQZkEBLNDxMr0EfguLsiYql+rFzH2aDrXYRg++JBdOehhe57m8ErKX8dPKx5Tt3VVK0AhMJYiRPCG9+axnURADQdhmny1Ixs1m6OMPrKkS8MYxpI8+xxHlgZyILEu5MM+BuME5GhHWXmc368CHzKd/mh8yl0Xredciu/CUR5KPF6SOkk/AdjrV13z01n1R8EFlZR3lP1DeKChT3AAx4lq+J9uBqr0tP/OtGL/Cm6DibqFi+hAl3mR/5GMlCQl9sJCfKTmvS9eQOPisdV0jRgdd3Td/xalsP0KT7M87//bo6TGHlOWKHp13gywPEIduW/1zfYL9kUtTqlRbf3wqTldnfjRNRNbcuyXvG5+eFEBFlb8j+HbIxBjJ1Z0984sDReBQxi2a0AUD4xqGMAGveopb9BfcHUkbycRZCf+d3B+r38FCNUrMh4isb8FubHdvx2AI/UoQUVn8XklEm6wKrCw7HaG/LiDWmZNB4EEAYxONP46YoVJdQarUsZBNQ+1Qn/xq6diHv7JzXIbDuGg6RKmSsmm515kExVXEgVSqhYKPEr7R7Z8B8+Ca2VozsvvMzQX3GdNQquUHC7ulO45T/MAK3fN8hzLXaciommH5QdSr1kp/P2c4w+k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(54906003)(66946007)(66476007)(110136005)(508600001)(53546011)(956004)(6506007)(83380400001)(2906002)(5660300002)(4326008)(2616005)(6666004)(33656002)(44832011)(52116002)(316002)(6512007)(38350700002)(8676002)(8936002)(36756003)(86362001)(26005)(38100700002)(186003)(6486002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6126
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b8b2768-d0ba-49dc-2a6b-08d9a8dc4200
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0McIYpi8o+8ccIkpMY7Y9BfGiRnVhiQa0luHfbPIT8v/VSEgofIxbUlH8e8Ll+duZcGd6noxZdHF72FxONUAj6kTdHudAm3YCaceYK6ox7UBg6WCc/rDlfD0xRR8MdaoisQyEhXa+7QA7IXCE51d4c39aifS7vWbUFHxd+8atM4xZ5V0WZ8KNo3V9byYsccSHh3ofTkVlpi+fPFzv5aGU5gseP/euDHBQDepHlJCNy2XPsleUYI4XnWKxIMgwDFEe7j6xD1Gtx6D2TQE1Meky1G4O+8vH2A2zldzfRKsoyPLfaM7k4d29cTmL0O1y8PPwtmpxy9Okgb42eStpNfNEITyl3ia9cb98Jv5T+gC/sJYaYpgjevqEEig6e396yhrLCFSTgn8tPkDVly+IISTCiXor3eLKuTu3C/tL/SPQtH6SJRlH1WprhW7vfLLNWKAMoD9AXi0d8AzO3M4I2kuxrkkNr68XuuIFtBI8fC82b8TDOTrHBvReGLANho1TmAz6nu+/qTHWZJYugsbFKyAd8jZ9sPt54dei6LExUR35sGMwLKwHATW7FmMW4gOFZwqLHabI8bg+/o7WCOkE58aaUP8unnq/vv9QtVNpOtP48EpQeWxhy9gQy3Dvjl6dbch85dyoyEVRy2Dp3x3cKsQdgkNJIUbyTEeHVW1uBRz6wIQNEo7m66l81DQRXs3nOJHUMwOU2PCW2Q/Cvzbk0s7Dw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(4326008)(70586007)(70206006)(508600001)(2906002)(86362001)(316002)(54906003)(110136005)(5660300002)(8676002)(6486002)(8936002)(33656002)(36756003)(36860700001)(82310400003)(83380400001)(47076005)(81166007)(44832011)(53546011)(2616005)(956004)(356005)(6506007)(186003)(26005)(336012)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:37:13.9620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31810703-9724-40ea-a08b-08d9a8dc4a22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3508



> On 15 Nov 2021, at 22:00, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> +Ian
>=20
> On Mon, 15 Nov 2021, Julien Grall wrote:
>> Hi Luca,
>>=20
>> On 10/11/2021 14:02, Luca Fancellu wrote:
>>>=20
>>>=20
>>>> On 10 Nov 2021, at 13:36, Julien Grall <julien@xen.org> wrote:
>>>>=20
>>>> Hi Luca,
>>>>=20
>>>> On 10/11/2021 13:05, Luca Fancellu wrote:
>>>>> I thought having the EFI_FILE_HANDLE global in efi-boot.h was a =E2=
=80=9Cno go=E2=80=9D,
>>>>> but if it=E2=80=99s not then instead of
>>>>> calling get_parent_handle in efi_check_dt_boot (that is the main issu=
e
>>>>> with EDK2+Grub2), we can do
>>>>> something like this:
>>>>=20
>>>> fs_dir_handle is only used by callees of efi_check_boot_dt_boot(). So =
the
>>>> global variable is not an option for me because the risk is not worth =
it
>>>> (it is easy to misuse a global variable).
>>>>=20
>>>> Instead, I think fs_dir_handle should be an argument of
>>>> allocate_module_file() and propagated up to the first call in
>>>> efi_check_dt_boot().
>>>>=20
>>>=20
>>> Yes you are right, changing the interface of handle_dom0less_domain_nod=
e,
>>> handle_module_node, allocate_module_file to host also an argument
>>> EFI_FILE_HANDLE *dir_handle
>>> avoids the use of the global, then the handle is requested in
>>> allocate_module_file only once and closed in efi_check_dt_boot only if =
it=E2=80=99s
>>> not null.
>>=20
>> That would indeed be better. I'd like this patch to be merged in 4.16. W=
ould
>> you be able to send a new version in the next couple of days?
>=20
> I'd love that too; adding Ian so that he is aware.

Hi, yes I will prepare it and push very soon.

Cheers,

Luca



