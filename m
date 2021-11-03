Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D991F4444D0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221038.382546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIQb-0002Ts-AH; Wed, 03 Nov 2021 15:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221038.382546; Wed, 03 Nov 2021 15:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIQb-0002Rr-6e; Wed, 03 Nov 2021 15:43:53 +0000
Received: by outflank-mailman (input) for mailman id 221038;
 Wed, 03 Nov 2021 15:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PtR=PW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1miIQY-0002RV-V1
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:43:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d68707b0-3cbc-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 16:43:49 +0100 (CET)
Received: from AM6P195CA0089.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::30)
 by PAXPR08MB7280.eurprd08.prod.outlook.com (2603:10a6:102:217::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 15:43:42 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::bb) by AM6P195CA0089.outlook.office365.com
 (2603:10a6:209:86::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 15:43:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 15:43:42 +0000
Received: ("Tessian outbound 7129402754f2:v108");
 Wed, 03 Nov 2021 15:43:41 +0000
Received: from e361ca6cae1a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CB5917E-BA25-46AB-985C-D76C46919852.1; 
 Wed, 03 Nov 2021 15:43:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e361ca6cae1a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 15:43:01 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4826.eurprd08.prod.outlook.com (2603:10a6:101:24::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 15:42:59 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 15:42:59 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Wed, 3 Nov 2021 15:42:59 +0000
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
X-Inumbo-ID: d68707b0-3cbc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSlSmSSblTPi+tfYZj0Am4Gsf8rDmpZ/VAokZOsO/CI=;
 b=r8Q0RU//4ldefaCIM/MevxFuDcXat6v8ES9U4TYLZNWAMjYASojXnogdYaC2sT4fSCxnqKnTBffQak3O/O5z6NjNZlVHdl8McwhpqX+2ZfQYvhJg5zHWrCUr+nuVJd61ZffuJ8av3P7ecqJJDRnw2qWcI2lmLoJWLSYjGgRD5ps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 990b842447e9c7da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd2isLQyKOpO2LYlEBHXsho8Vw6+uKFsUFjIwYrVa4Oz1y2KxpnS6jiTyCMNREW05IE+IwpqknXCw8xTE1qw8Cfc//ThjDQ9zyrSFDxLd7U+Y6mjH0PZ48PhtwycvrqtH9HOiXo4a0Ojs+mTDjgM37mr0ZlKx627HpXAEpjt0gFre8WXhp+on7WWSl3i+lpymyaZsuXjy7QXKCfsh1ycb2S2tQJI68QdwH93aBRjGgiA/ZJSyQwAXikis03HdTDWOiNZTOkQSohvR+F+9hdrq1uLF73TUGw1KT551363HAi+U6zDFU3RS6+1JSIkASA9vA1cRUH305J+9Jc0/1Hh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSlSmSSblTPi+tfYZj0Am4Gsf8rDmpZ/VAokZOsO/CI=;
 b=RfE0nFkTRV0FNIorhTHxpPtcQ4VxiOqv8O1KqnXuyn565Ze6htbtlt0fcsFv7vDnP+stA/aw3rTownTWbNG750/1zHdjZg4q4hXh9h2+7w+Y2u3eQUV1MTVeXz8tw3CtKUjyE/cEP9OhHwrG1hNMepujMfjnIWv062H6Umy3PyQaBrMPOitu8UdBt0RqGjPpl1YxkGnFUP71gCq4vjRH0hmP1Io3Cjo2lKX57osngq6hWCHt60x08dnf4Fqu0INLFzVtp5Oh2RNUeoSf9USRJm4gzuOSQ0D+eWt6Gjj6omE7kSmNpQzOUWUNZhKuGhIAtj5P4MHcASMdFJfxohSoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSlSmSSblTPi+tfYZj0Am4Gsf8rDmpZ/VAokZOsO/CI=;
 b=r8Q0RU//4ldefaCIM/MevxFuDcXat6v8ES9U4TYLZNWAMjYASojXnogdYaC2sT4fSCxnqKnTBffQak3O/O5z6NjNZlVHdl8McwhpqX+2ZfQYvhJg5zHWrCUr+nuVJd61ZffuJ8av3P7ecqJJDRnw2qWcI2lmLoJWLSYjGgRD5ps=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
Date: Wed, 3 Nov 2021 15:42:52 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C340B76D-4DC4-4473-81A4-967C2FB7E3D4@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
 <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
 <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
 <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
 <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d481d32-68d7-4eff-ceeb-08d99ee0b682
X-MS-TrafficTypeDiagnostic: PR2PR08MB4826:|PAXPR08MB7280:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7280DE3B05AFBDCB2BBA3AA0E48C9@PAXPR08MB7280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uaOI+gLSrDQ4rhUGak1JDZW0PBCF4cq6KeTAEOsSvuXc1SCBRPYJ+2a20B1nQlGSCkQugLEhsIGJxI6YygaZHVSbWiW3i6DJCttFvaXbFXfZ2qnTGnJUPUkOUt1Azfi4uNLCZsnzFABxwRnFBeLLSWwdhGqozpvXZxZN6fpe11h+xI9Tlj7IJf8+Ynmati4HgsFZ7TjruNB/dDVBqdMozgQaG9BQM0QJqOhO/ZTw4PgS94pmZyAkFbViB/5qGs1nE0Rx9iIiowIxY/QEbRhcKGPJrkVS3OasGy2kXKg0pOWsUGHOFF9m0j7wiQHSsj4wYYmRy9530uxuSSKKxlnUNuvT7aTQdv7TS20lb5Cu1QeB8cF8Nh7O3AGt45EdvJCjecvFUdF9G9FVYNeo0qg2e4V493rGwNVMPzv3N/BTLuQAxysRvLejE77qVJoCxrJetlpnqeV5PNPavL56mBtm75y1ZMyquPeBHRSTV8SY5Jw8cnyCWphTcM7EMNVMv1eDbenIlpKBtN7rinFWqpl4lbzhGnazVxXVaJfwf/d3Z1u+Pmk2dUY+B5aDTk0zKksSCjdxzcxiBUBSbQhLs+kbakCu3wHQaMGqyszk743Em/yJoz70xpyUVE+ZC33eR8VNFRJyf2JGyRut/bj24cjikuHSoobLS4NjkeM+Hi8i5zK0lUMbLq/6w7avz8Lb1MdJYjJhWHSvDwtyO1A/vxnuGQHXaF1JvV5RlHu0EnyjyzDBtcbXPAUA9txXArVKcv7u
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(8676002)(5660300002)(66556008)(66946007)(83380400001)(66476007)(316002)(26005)(33656002)(54906003)(6916009)(36756003)(86362001)(4326008)(186003)(6512007)(2616005)(8936002)(44832011)(956004)(38350700002)(2906002)(53546011)(6506007)(6666004)(52116002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4826
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f860a409-3a4c-470d-a77c-08d99ee09d19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mjXkvU0WvksDl7Ww5Z/xiza2NP5Ura6k/5bPbdDOKQQUQgQifsWVx9S4jZ/wjN6xFgGrfP1XCeRPf/KRGyaz7xLkFJiTLwZXK8vaQASl9pyQF0+fFbE5j3sEp6maC6lfRHfpF9vFBYRMVBvXI9ygxqE/ISp1nTdSRAmAvr1sJFm6UlgHfTOIM1VJQfph6+XAmNl1e6uWgvgyTdk6IJeTBWk0SNY5/Wl9h/eA/s7Uzq5NmwhIEosH3DRSyr1Ccoh+TGC2ln5lOnFbOZIgADrZK0eVEISq/JwiKKjgsb9Wav7CDebOd6Vms47z/mZcO/UH378yNjGK1E/KDOg1iWP9DkQCT4mBaQeIhChGRsbvS/16uyuU+Sl1+xzOJ7mRGRZZ3BnylTd6hUjyNY8hREAa2AUdjLpqmYeKnVbOR5EY5++Q0ZVpARuelTRItiLisNSburNe6bRAZbTXyFC8KccxkgA9m7r/+loI6OqZn1J49lSHWNmBfWGcLKQKyNGOsOq86hLuoMywVLzwShY2kWTVf+YPRMf69NpCecqEio6z/NBQdQHZqfvCwSXEqVBCKgsiKDr+FOocZkWtFXsZAOO6KXslgHT1pw8ZcgntpCgXGkZ6wVh0M4R9/fKhjeJc0t7OEEhd+OjkAfIbx7x9SFtb/N99nKOSHEn39S1k5zeZuOjMov3gubWSrYgeigY8K+RT6QW/aUT4iGbgDyr159wbCQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(47076005)(336012)(956004)(44832011)(2616005)(8676002)(26005)(33656002)(70206006)(70586007)(6666004)(186003)(82310400003)(36756003)(83380400001)(54906003)(316002)(81166007)(6512007)(86362001)(356005)(6486002)(53546011)(6862004)(5660300002)(6506007)(36860700001)(4326008)(2906002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:43:42.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d481d32-68d7-4eff-ceeb-08d99ee0b682
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7280



> On 3 Nov 2021, at 15:30, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.11.2021 16:16, Luca Fancellu wrote:
>>=20
>>=20
>>> On 3 Nov 2021, at 14:30, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 03.11.2021 15:09, Luca Fancellu wrote:
>>>>> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 03.11.2021 11:20, Luca Fancellu wrote:
>>>>>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214f=
d9b882
>>>>>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine usi=
ng EDK2.
>>>>>>>>>>=20
>>>>>>>>>> The problem comes from the function get_parent_handle(...) that =
inside
>>>>>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the l=
ast
>>>>>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>>>>=20
>>>>>>>>> According to my reading the UEFI spec doesn't (explicitly) allow =
for
>>>>>>>>> this to be NULL. Could you clarify why this is the case? What oth=
er
>>>>>>>>> information may end up being invalid / absent? Is e.g. read_secti=
on()
>>>>>>>>> safe to use?
>>>>>>>>=20
>>>>>>>> My test on an arm machine running Grub2 on top of EDK2 showed that
>>>>>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was fai=
ling and stopping
>>>>>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called =
with the
>>>>>>>> loaded_image->DeviceHandle argument NULL and the call was returnin=
g
>>>>>>>> a EFI_INVALID_PARAMETER.
>>>>>>>> So the parent handle can=E2=80=99t be requested and the filesystem=
 can=E2=80=99t be used,
>>>>>>>> but any other code that doesn=E2=80=99t use the handle provided by=
 get_parent_handle(=E2=80=A6)
>>>>>>>> can be used without problem like read_section(...).
>>>>>>>=20
>>>>>>> I understand this. My question was for the reason of ->DeviceHandle
>>>>>>> being NULL. IOW I'm wondering whether we're actually talking about =
a
>>>>>>> firmware or GrUB bug, in which case your change is a workaround for
>>>>>>> that rather than (primarily) a fix for the earlier Xen change.
>>>>>>=20
>>>>>> The issue was found only when using EDK2+Grub2, no issue when bootin=
g
>>>>>> directly from EDK2.
>>>>>> This is a fix for the regression, because without the EFI changes, G=
rub2 was
>>>>>> booting successfully Xen. Using grub2 to boot Xen on arm is a very c=
ommon
>>>>>> solution so not supporting this anymore could lead to lots of people=
 having
>>>>>> issues if they update to Xen 4.16.
>>>>>=20
>>>>> I'm not objecting to addressing the issue. But the description needs
>>>>> to make clear where the origin of the problem lies, and afaict that's
>>>>> not the earlier Xen change. That one merely uncovered what, according
>>>>> to your reply, might then be a GrUB bug. Unless, as said earlier, I
>>>>> merely haven't been able to spot provisions in the spec for the field
>>>>> in question to be NULL.
>>>>=20
>>>> Maybe I can rephrase to be more specific from:
>>>>=20
>>>> The problem comes from the function get_parent_handle(...) that inside
>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>> is NULL, making Xen stop the UEFI boot.
>>>>=20
>>>> To:
>>>>=20
>>>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandl=
e,
>>>> that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_ha=
ndle(=E2=80=A6),
>>>> causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.
>>>>=20
>>>> Do you think it can be ok like this?
>>>=20
>>> Much better, yes, but I wonder what "returning" refers to. You want to
>>> describe the origin of the NULL handle as precisely as possible. And
>>> considering this turns out as a workaround, in a suitable place you
>>> will also want to add a code comment, such that a later reader won't
>>> decide this is all dead code and can be done in a simpler way.
>>=20
>> Ok I can write the issue from the beginning to be sure:
>>=20
>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle
>> inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
>> handle is used later by efi_bs->HandleProtocol(=E2=80=A6) inside get_par=
ent_handle(=E2=80=A6)
>> when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL interface,
>> causing Xen to stop the boot because of an EFI_INVALID_PARAMETER error.
>>=20
>> Regarding the comment, I can rephrase this comment:
>> /*
>> * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
>> * to have access to the filesystem.
>> */
>>=20
>> To be:
>>=20
>> /*
>> * If DeviceHandle is NULL, the firmware offering the UEFI services might=
 not be
>> * compliant to the standard and we can't use the SIMPLE_FILE_SYSTEM_PROT=
OCOL
>> * to have access to the filesystem. However the system can boot if and o=
nly if it doesn=E2=80=99t
>> * require access to the filesystem. (e.g. Xen image has everything built=
 in or the
>> * bootloader did previously load every needed binary in memory)
>> */
>>=20
>> What do you think?
>=20
> Largely okay, albeit you don't mention GrUB at all (which isn't really pa=
rt
> of the firmware, but which looks to be the culprit) and it gets a little
> too verbose. Provided the facts have been verified, how about
>=20
>    /*
>     * GrUB has been observed to supply a NULL DeviceHandle. We can't use
>     * that to gain access to the filesystem. However the system can still
>     * boot if it doesn=E2=80=99t require access to the filesystem.
>     */

Ok yes this is better, I will do the changes to the commit message and the
comment for the v2, I=E2=80=99ll wait Stefano reply to see if I have to inc=
lude also
his suggestion.

Thank you.

>=20
> (and it's up to you whether you include your further "e.g. ..." then, but
> if you do I think the parenthesized part belong before the final full
> stop, and the last "in" would want to be "into")? It's still dubious to m=
e
> how they can get away with such a NULL handle (and why that happens only
> on Arm), but I guess it would go too far to try to understand the
> background.
>=20
> Jan


