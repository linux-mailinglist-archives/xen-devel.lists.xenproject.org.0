Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC47CDA3B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 13:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618519.962254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4fs-0006FD-O4; Wed, 18 Oct 2023 11:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618519.962254; Wed, 18 Oct 2023 11:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4fs-0006By-LD; Wed, 18 Oct 2023 11:25:16 +0000
Received: by outflank-mailman (input) for mailman id 618519;
 Wed, 18 Oct 2023 11:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5aw=GA=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qt4fr-0006Bp-DD
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 11:25:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 007b935b-6da9-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 13:25:12 +0200 (CEST)
Received: from AS9PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:46a::17)
 by DBAPR08MB5863.eurprd08.prod.outlook.com (2603:10a6:10:1a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 11:25:09 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::99) by AS9PR04CA0057.outlook.office365.com
 (2603:10a6:20b:46a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 11:25:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 11:25:07 +0000
Received: ("Tessian outbound 80b6fe5915e6:v215");
 Wed, 18 Oct 2023 11:25:07 +0000
Received: from 09e523b324c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B933325C-806B-45F8-AF41-58A77B6C20A3.1; 
 Wed, 18 Oct 2023 11:25:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09e523b324c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Oct 2023 11:25:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9281.eurprd08.prod.outlook.com (2603:10a6:102:306::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 11:24:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 11:24:59 +0000
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
X-Inumbo-ID: 007b935b-6da9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqSPYi0GN8sUqGSKdLJs0sFiem3qvk12wDPfYZaQ3vQ=;
 b=z4vwbFWHZ3ngQ/WrcBEWNazYaMReqSVq5anBQmhhhd+cNkSJcMfbx2qG7Rj3Xp8F2Jjvzn5w6porv4SkmX05o0zK4GJZft+8R72zHnyCHnaRhtNE4YdjipAENtVPcrnwJZ5h/zHSZutnodC18cnYOMVKmr3WJD1K8JE1B0Y2T6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3052623c04e2537
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWrxeXix4TxmHEmmunc3OckjV9MuB8bgbbc3qMy5A4SN8vaoYyhfbQgYF9nYnKStpltnKDXr9drUfHgZUlaYBcw1LgJZbFHIax4YRVl2xa7vVJXTES3rWD3h9P9CQahdMl0Vw6kg4w34oO4ilqKPW8ywe7P7q+FPedjaydQMpNRcgXiwX+8iEl1Oa5mkvfKdENABpptWz/eiD8vZ9Qzili7BG8ZGMOJTbbyvUahwuTnz/dBOK+KasYSuUeB0+LogC3f9h4ESTYczgcwrF16Rg6F4i/THWF/14mC1e1CI95tJx0puEZOo65plzH5tMxHyGhep0MTXBS5DGZzWlN95/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqSPYi0GN8sUqGSKdLJs0sFiem3qvk12wDPfYZaQ3vQ=;
 b=G4iRKShxQ/sSeYd5XNQG07U0YKMuVXMks0FWoegK6OWrD4sOVm3dupF3/6Vv71Z9VrCpQCzE+BLm/5gMWuCXOo7DAk4Qs0T9Rf+wMnFSXlHHY4eU9kVgzqDQRI8/rojS4PmPqo4O/q4ZxLjyrG86ise/+eMsvoHUv4/+VPyGQcY6S+QBNgw90PrRmgXv2P/W+kvnkHExwh0y7nBzO2uggg+04MtZknZUcmU3EXWrie5FwMtgt5oOFvTp18reCHU0zAVmm7dUwdlBpum5pJuCb9N8ck4NvMS7PYM1muG0qelb0r+EO4cuvfwQDuYKMRTDilXLj0FOumDLbP6z6NHOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqSPYi0GN8sUqGSKdLJs0sFiem3qvk12wDPfYZaQ3vQ=;
 b=z4vwbFWHZ3ngQ/WrcBEWNazYaMReqSVq5anBQmhhhd+cNkSJcMfbx2qG7Rj3Xp8F2Jjvzn5w6porv4SkmX05o0zK4GJZft+8R72zHnyCHnaRhtNE4YdjipAENtVPcrnwJZ5h/zHSZutnodC18cnYOMVKmr3WJD1K8JE1B0Y2T6Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Thread-Topic: Xen 4.18 pvshim console issue (with patch)
Thread-Index: AQHaAa9cu8iUssZj1EaRHoR8glstO7BPXL0AgAAKM4CAAACmAIAAAG+A
Date: Wed, 18 Oct 2023 11:24:56 +0000
Message-ID: <420B99DE-F2EB-4DB4-9F32-A740C5886864@arm.com>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
 <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
 <d44f1543-22e7-4abe-a245-7cd0d0d585e0@citrix.com>
In-Reply-To: <d44f1543-22e7-4abe-a245-7cd0d0d585e0@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9281:EE_|AMS0EPF00000190:EE_|DBAPR08MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2962c6-314a-48fd-86b3-08dbcfcce20b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d93Z6KgMTaDOjWeAGWg4VCFSwn5kAx5bD1XRjOgISr9x3cUNcJSGLmS9mn5gILzQMlqZp1WcLCba7j9L77LJah6BHR67p3/4AfbNBHH/d/kYc7TETqbZPiJGgarwzDM4U5m3tb/Swi9a6yiNFgU6b+D97OI70/eP6MK8QClM7BdmacsLr/ifMC48pqtRFISDlLhgesvEA1EVVWkIxrc/TeVEQu2hv6p4i79oZE4mcDdGjz9XZylPaUWg+4Hy3f/JchMEwpvX4df8Sjas9bH2tCqW+nvUlWHzfjSoH/difvrc3w4rPbiGe5lssXowNmK+uTc5LfyHndQ/iKEHDvMQE2PZ3KlEQPxZo1gWncBZxILy4tondqYDxZU9T8ieaUxZL0jKTGB0/G1Bl+teCscwUTVLgEeOkaOMvk/nRNWP0ES1cq+t3E1Fb+7KT1DtAkJ7Rghz6jP2ALvmC9bUlqBFF37KxNFcDZM+ctQjHc3sEAupSJz5j/aNtPR7kYhKqahR896JFUafB/0XmQD5xdGp9SvPwrwjWeJ81Zp3ZSjD0vsFMELcytPrqKb0ospcC82IXc4rlOf01BA2td95G5BnaQq+ku3oU1Wjq/eJlW1SYHRii64fAGEUUQgpSnNpWGPSlvhH/F/wqE1NDO9LDOZ5yg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38070700005)(86362001)(36756003)(33656002)(122000001)(26005)(38100700002)(6486002)(5660300002)(76116006)(478600001)(66556008)(64756008)(66476007)(6916009)(316002)(54906003)(66946007)(66446008)(6666004)(53546011)(6512007)(6506007)(71200400001)(91956017)(2616005)(4326008)(8676002)(8936002)(83380400001)(41300700001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <517ACC285F37B243ACE93F6ABC7E5F07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9281
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70018a57-2ba8-49b5-086f-08dbcfccdb61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PxTuP/jWkfkKmQOpA2pQ54Os6Q31HFSUVFVAmnH1RUJkq92dnKQGTyQyW8elFrJ2Qe7gdSsQlvW2duITXSynCCgbbEd2Q3LvbpgQuqoa9W6SULo2ZH/Ohb6Lxxb6WtoKX/23ayDQybKfea3KJgAiQiCEZL6hO56Wy4uAtSpfY+xc8KS7ponFNXxybCJEPWkrpXnL4MGfY6rjGaqNpUxcC5BemSjTIvOKQge/vYW5s27epxRUpBhcy0gju08OyxEkBhP5MEdstPHSlZhJnki8j8FWeRUkgfKoDb82xswyAkaX/SPvUDczzkUkFcZjCPOtIfB4h3as89Gcpa/TADvcfQkYibq5uQvaoJdmoxhE5SMAez+2PBuCacpBjN3KI8ME7YuyOcAJT8Hk2TyJQN8nx5FZI9DmOd9/DBfHwUDHKa1tWg6mAHkKSEo4TlL3TryHyDoUuYXXRPqYzqxVhFJd2g5hkGF130+/XqMy7MULGvbVK2HFxah0E8JUoGnTDm7O6qJp6+wN5z+ZPFBLHcFpuUe8vlBbxAwiMi3Q4WeTCe1LdpaqfbQeIzOLdKBoL0rvDNYAabQPqb/ANV+3YqGK5/oD87Huv+ZjX/at8Tr0iCgrVoKhJjHyzOFabd9htDnDun6yPH9uQELvaz3rUv1foopxk/ZANw3+soJGojrWD1XjtkiWhAqEo+ZX/6XI9Ls0fw+a67mHtNUMNn7ZouXkRgwCd4cA/2f4GvhjhWIAkeJCb9WzmJrvf2IBp6CQ5lWa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39850400004)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(47076005)(33656002)(86362001)(40480700001)(40460700003)(70586007)(54906003)(70206006)(6512007)(316002)(81166007)(36756003)(82740400003)(356005)(83380400001)(53546011)(36860700001)(6506007)(2616005)(6666004)(26005)(336012)(8936002)(6486002)(2906002)(8676002)(478600001)(4326008)(41300700001)(5660300002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:25:07.5272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2962c6-314a-48fd-86b3-08dbcfcce20b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5863

Hi Andrew,

> On Oct 18, 2023, at 19:23, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 18/10/2023 12:20 pm, Manuel Bouyer wrote:
>> On Wed, Oct 18, 2023 at 11:44:22AM +0100, Andrew Cooper wrote:
>>> On 18/10/2023 11:38 am, Manuel Bouyer wrote:
>>>> Hello,
>>>> With Xen 4.18, a PV domain running under pvshim doesn't get console in=
put.
>>>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_d=
omid is
>>>> hardwired to 0), so console_input_domain() will never select that doma=
in
>>>> as input.
>>>>=20
>>>> The attached patch fixes it by translating 0 to the real domain id for
>>>> pvshim, but there may be a better way to do this.
>>>>=20
>>> Thankyou for the report.
>>>=20
>>> First, CC'ing Henry as 4.18 release manager.
>>>=20
>>> There have been changes in how this works recently in 4.18, notably c/s
>>> c2581c58bec96.
>> Yes, it looks like this one introduced the problem.
>> Before this, we would switch console_rx to 1 without checking if
>> domain (console_rx - 1) exists, and console_rx =3D=3D 1 is a special cas=
e
>> in __serial_rx()
>>=20
>>> However, it's not obvious whether this worked in 4.17 or not.  i.e.
>>> whether it's a regression in 4.18, or whether it's been broken since PV
>>> Shim was introduced.
>> I don't know for 4.16 or 4.17 but I can tell that it's working in 4.15
>>=20
>=20
> That commit is new in 4.18, so Henry - this is a release
> critical/blocker owing to it being a regression vs 4.17.

Noted down.

Out of curiosity, do we have maintainers for that specific driver? It would
be good to looping them in.

Kind regards,
Henry

>=20
> I'll try and put some brainpower towards it when I get some other 4.18
> work sorted.
>=20
> ~Andrew


