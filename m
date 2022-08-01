Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9C586B77
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 14:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378746.612118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIV0D-00083M-5W; Mon, 01 Aug 2022 12:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378746.612118; Mon, 01 Aug 2022 12:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIV0D-00080b-2O; Mon, 01 Aug 2022 12:58:33 +0000
Received: by outflank-mailman (input) for mailman id 378746;
 Mon, 01 Aug 2022 12:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEeW=YF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oIV0B-00080V-Io
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 12:58:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3efd9c7-1199-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 14:58:30 +0200 (CEST)
Received: from AM5PR0101CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::43) by PR2PR08MB4875.eurprd08.prod.outlook.com
 (2603:10a6:101:27::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 12:58:27 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::fd) by AM5PR0101CA0030.outlook.office365.com
 (2603:10a6:206:16::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Mon, 1 Aug 2022 12:58:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Mon, 1 Aug 2022 12:58:26 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 01 Aug 2022 12:58:26 +0000
Received: from d48835802bca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E7F5CDC-D91C-41DC-BEF0-45CA7C8F9AE9.1; 
 Mon, 01 Aug 2022 12:58:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d48835802bca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 01 Aug 2022 12:58:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Mon, 1 Aug
 2022 12:58:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 12:58:16 +0000
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
X-Inumbo-ID: a3efd9c7-1199-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jrAoykbWQL2CJ7q9SoGWjmH+ypvHMqERtedvWRNdDPvLCh+8X2pEMDKcf6PJd3zselXbSmmmC9aDqndxp6cf0C5o778CPvMYqt+bWXGHmIxMo26h9tPgA+ttkQJjwpOm4UnYjrYtsyvLbJfHZ+UBZQfAIsmkTf8LufS8DDgH+JyU78+w6xdi/oys6wnDnsX7SYekIjF7poPh1gQdBIrK0CH6ZbWgGdO8IvqdCOeP7Gp5cEahKTC7P8Sfn8xPaxIXBO5tbt6d8/mPGZytg0pJZzUM8aLu8rAmkuGn+ZPTLry+FFCJOl4/Jz/92akZHykIbjH+cJUG6yWMgIhsn8a8mQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrADgtZ2fochO4XMhfpZKpZWpRGewb7vb7VpV2oTO0g=;
 b=ChTpeTH9EK9S0abBX6YK0G/gQ8Ph44w0p+LXfoC7+MhBakAF5pKYVWRR1awUsbTIllSljuy15jbG7COKIBN1HDnFiVE9a+cvoafcedxV94Be+3tigr7w8wu+mQu6xPj7QVXVzWKzvav0n+Etbib3oG/U2oOterhyAa7xLOXGsq7ngOH3urxIWXucwAGNLUEi/x9BUCpwRI/Wnp7jMxnzLfcRvrSf2h7LtGmDOG1Av8IXWzjmn41zxkxKkGxMGSJubCSt7JXJHIaCWDElPy4XxOF9dTeV/8pKtHC4oF020OOC9JoQvXzT+zqEu3H0/NQL2voh3SPp5HQLnRAE/X/gKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrADgtZ2fochO4XMhfpZKpZWpRGewb7vb7VpV2oTO0g=;
 b=IPgk9IUAkw8NlSS2S3vNY0/lywedoxSTeLoQdaUaOHD37ws8YyLahKzyoLYQrj2yrvEWDGo+61ERb1de6Jb+pbQ3p5BTe8xs2poyYHa62jFso0WfReTl+xysocJOFFYmSW7idPu4bGHfaUBbeIgwOMnQXLMP+h8+9KXAZBN16QQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b96fdd1e82c49579
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1xa3D22w/gWb8pxJrvUpktIka6SCNva9BczBRJjdcrn9LfMe7tWQjbGGL+ZN70ChLZS4yXv7XOUC3gEHp6mnFbmk93cuH3UklNc/UgQNCcdgKDQhlnMFjhFnAfY/T7/hSJ5siGyH7Hq9KOEQGe+pEERRTe+kNuJ4n981Ci8zOgooIQkIVQi+wm/Yk3VnINIT5o5qjV37RG7nCVCNtVNUisu67NAx+8UB5qvvI/crz+KlsscOG70gs4AMhvs/8Uaf8btD46EWQlP18TTWUnmlXuvSkwPcNiV0PaopANHzEIYriSixGOqmlg64GYxIJ1TDget4V9YOGqrCvWm6gYu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrADgtZ2fochO4XMhfpZKpZWpRGewb7vb7VpV2oTO0g=;
 b=BEzesBzpLk5NNdapnlldLFXm2/6+TRunStjnR+KCsEM9Q/XhdB/EGQ2xCvn/jszejIc+wbBMQXrQssAbzaUEYAFagYC6RU5xg5uef0Fm33uCkgm50xzyLLHNGmyV8cXqUx1PZtDJEWnlmlOEUgppkr72ABdOlCDMoZaSzaqc92CJYe86rXDMPV6PdWONHjUh+lynE4rYSFTq7D9jDeAxydHBcGmKndB0COWtxgLDhHfNK1RJu7rvRoHt0lAIj6OwjaOEsOer17e9C+QzXMg5K6A2YuPZqBi0HcuIZ2ueJQ7bqH39v5kwSiK/eGGaFGJGcNWkpkBUgX+JMM2mmaQozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrADgtZ2fochO4XMhfpZKpZWpRGewb7vb7VpV2oTO0g=;
 b=IPgk9IUAkw8NlSS2S3vNY0/lywedoxSTeLoQdaUaOHD37ws8YyLahKzyoLYQrj2yrvEWDGo+61ERb1de6Jb+pbQ3p5BTe8xs2poyYHa62jFso0WfReTl+xysocJOFFYmSW7idPu4bGHfaUBbeIgwOMnQXLMP+h8+9KXAZBN16QQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/efi: efibind: fix MISRA C 2012 Directive 4.10
 violation
Thread-Topic: [PATCH v2] xen/efi: efibind: fix MISRA C 2012 Directive 4.10
 violation
Thread-Index: AQHYpaFICLRiRLU1NUiMmj1k5/yq/K2aAXeA
Date: Mon, 1 Aug 2022 12:58:16 +0000
Message-ID: <21C2D26C-B87D-48C7-A8A1-F29A3ABF4EB5@arm.com>
References: <20220801122118.1673349-1-burzalodowa@gmail.com>
In-Reply-To: <20220801122118.1673349-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b0943166-93cd-47cd-9b31-08da73bd8672
x-ms-traffictypediagnostic:
	VE1PR08MB5725:EE_|VE1EUR03FT025:EE_|PR2PR08MB4875:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HDeOaS81kvDDuUoMPUFaSpSmDUNctlpoomiVejBOb4NDOFE+2rCsq6M9ZqCF2rneA3CF/DKbO07ejwwjF0DfkggIGo8G43kAh9HDD8pec9Ci9zIehu7zLkM92Wn3w7pdrdKtmPz9s7AsFWpqszuO3sRh76/OslN2mB9yzKjlljXHZSGOB+x762VMon1qgXIxoYayBi6N9c+6OtDjam2HX4OR2/QSNARsTWowcP2TJv7Hj7ScSKTPVAsEMGSUh5F/LsCoSqCm/OPcefHAwGv7DoG2h9FLGBzG6JYlCJIDTQJfVuxK5UI1eenrAByrN7XYTZ69aj9XlJbR2jd9FBvATMkWSN7DmcsNUXdNWYLyofMe7RJlhkwQFstITu+6m5EXyjeifAiah+lZFxUmM0AypN1nbgCyW+6+LmhS2GBlJxHR5Jb8qiWQ+OuMNfGZWLR/g5fx6Ywfs7OlR5AHVDXjZV5j25k6JbD2Ff/YlqxFUYlWz8TFNp5ObkR5r+e7fdJNk+k391tV8Ph5cC+DFHEd/jfJNAMlwP8AElqpq8+es7wipv7zhrCW0AhoiNEbSNrNdtnFfK/6our0z8KUvG1WMNPBMX5ieFfYQRpy58GKKdGZZ3ulmgbS6NFNNS3MUbkD06WtYBxD0tjQZ70GmWVNVvTMWygWfX9sLwarKi8RJGrPsW4ZIOo6Uu4HAvQuz06O6JpCwNwhkYof2l0xnHNrqnDXAlpM91OhtSlRyk2NiL6oS0y6kAU2DQiKlBUx4yOE0Rm8XREjZVlE3CDghSElKylnq7lHTLNB4GfpChhHDRKfgDo9CY4c5acheOKxX1bA4WIRJ7hV8j6HNfWhf1pypg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(83380400001)(54906003)(478600001)(6486002)(71200400001)(2616005)(122000001)(186003)(38100700002)(41300700001)(6916009)(38070700005)(53546011)(6512007)(4744005)(5660300002)(8936002)(26005)(33656002)(6506007)(2906002)(66446008)(36756003)(8676002)(64756008)(86362001)(66476007)(66946007)(76116006)(66556008)(4326008)(91956017)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <227B1B768753DF479132EDBD76D212D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15b8f0cb-1ff7-4a91-fbd4-08da73bd8081
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GbMMUtZqrk7wLvk1eP7QIk8yL4YehUMynZGF+FV2ngvRHjSfWYQrybWg3vJtan/h6VlH/jw9uaSXs9S3OPkb9MQYO6hFkpZ5+KNP1Z+MzVfvYqWKri6MDa1i7SHsuip+szXxHHitKr87h85IMMY8WjgxopkV+AP92xUCbWmIkGdLARxW9z1Pg/PJ51nbwxwoebFhgu1LeY7B4Wscz9NpFgOVXfBWKPxaKdDH+Wr+2aa9fnT3mUX+82Z2xwEwZlHPBRcF7nBvu55Eef8rwC/13AXloderNdtEoQUrVdNjL2+BXs57Fs6f/pWSeKYWHCxy6ZpUmtVcMfbRmazigtjnDnj6EZFIQG0GdxIFxccLjF6NRR4HeCF1d54iCfelVDGupIPHxUDas3XWxekPQ1N4O1PS1CXVysYF3lQ72Y/uhavINZT7FpiSi59xLQuSJbRk/vaL46cvzbo1r6A+y2J/09d8MmQjyMkjpuc7E1Jo9tezVpP0Hk5F8oK0jaCvqmPWsuoOKLr1QRm+2s/zDy4mnShzgmpZLXnfjyMTQBNVeC+gTNS+OwK+XNFRrzwABVFkFxJOjELVAzwbu7TSlCth8/Dw4JdiE6FDAvCFPbQwSNaLYiWsorjKXCcs/pGjXwYuYc7QLspgS6084OACd7DiPLPmPtrdSZmBY2I9caQBSjbgn3SHj6WlT0P6HlSJ/eDD5vRp8uEIE2w1Gg/2+4LY8EG471tSksUJCZC2Kc3vJyxy+6imP8pSwkLbh1hbkCqG25OefrZBBSqafVfr0G59bx8Q3HuoEkPxK6RvfyZPIG5Dd7C4Cqhw6Xi3lXI3LCg2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(40470700004)(46966006)(70586007)(6486002)(33656002)(70206006)(8676002)(4326008)(47076005)(336012)(2616005)(186003)(40460700003)(6512007)(26005)(86362001)(53546011)(6506007)(2906002)(41300700001)(8936002)(6862004)(478600001)(5660300002)(4744005)(82740400003)(81166007)(82310400005)(40480700001)(316002)(356005)(36756003)(83380400001)(54906003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 12:58:26.6923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0943166-93cd-47cd-9b31-08da73bd8672
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4875

Hi Xenia,

> On 1 Aug 2022, at 13:21, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Prevent header file from being included more than once by adding ifndef g=
uard.
>=20
> In order to be close to gnu-efi code
> - for x86_64, use the same guard
> - for arm64, that there is no guard in gnu-efi, for consistency,
> use a similar format and position to the x86_64 guard
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


