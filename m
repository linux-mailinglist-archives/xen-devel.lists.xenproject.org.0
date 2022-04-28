Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4185513680
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 16:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316574.535515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4sD-0000JQ-VD; Thu, 28 Apr 2022 14:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316574.535515; Thu, 28 Apr 2022 14:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4sD-0000Fe-RN; Thu, 28 Apr 2022 14:12:01 +0000
Received: by outflank-mailman (input) for mailman id 316574;
 Thu, 28 Apr 2022 14:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJsv=VG=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nk4sC-0000FY-0b
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 14:12:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29abb170-c6fd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 16:11:58 +0200 (CEST)
Received: from AS9PR06CA0723.eurprd06.prod.outlook.com (2603:10a6:20b:487::6)
 by AM0PR08MB5025.eurprd08.prod.outlook.com (2603:10a6:208:15e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 14:11:54 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::14) by AS9PR06CA0723.outlook.office365.com
 (2603:10a6:20b:487::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18 via Frontend
 Transport; Thu, 28 Apr 2022 14:11:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 14:11:53 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Thu, 28 Apr 2022 14:11:53 +0000
Received: from f025c8e05fc3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2482549-1089-40CE-9699-240DFC9E130D.1; 
 Thu, 28 Apr 2022 14:11:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f025c8e05fc3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Apr 2022 14:11:47 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM5PR0802MB2451.eurprd08.prod.outlook.com
 (2603:10a6:203:9d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 14:11:44 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 14:11:44 +0000
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
X-Inumbo-ID: 29abb170-c6fd-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ebl/vFDBlQVmoc4HnV+1tuKBMsVpUHh28hZz/1U1QBh0cswPv2cHUIKeD4oIZMGYiXtLZsSZ9ngMqJqd8eQ+o6Ba7YSExjkvvXQY4Dh9sbjjBLCoSl07Ca5hXl6vnDK6Rwf0wEM34bo8XumokDIUnvnr4xGt3MkcIR9i9Y5M1y1GhAMQIscchjjLm4z/iP65j+KZBw3Vxf9UwBA8UgVB8JZ+x3560mTlK5A+zgKJtc7o3NoSf5Bzn1243V68p6+rEAEkQTq768YuSBcUkyHCWcii8z2yLAOL9pY1zIkBFA+HcY3sVAPup77U9E9OLC66YVLe75WkgoMMItrKB1/SKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77OWjqVdYfLEVpwINV7v8sHTg257aks75YpSleBQXNY=;
 b=R/y7QNnWVyA+QxLCTb+0PpOjxTd21xG9ofW5QapyC2TBJBFAaGOs90ZBG6/+wD3dn1mest9KBBGke5bgHsrzL5NfiyU/o3UrIYkbJxREmQbR9sWGM2pdbbqa1PEv7aiGXtv7rX2/CDm3IXwEyXEd1cy/G9K4k1ay/dsiJaFKWw+EazawdU9tZyK9sj8vneAnYmsabqgmYspP8o4STegPbyDFrRd4r/Thrax1FMHid9IRG0M0M8SHiRxiOdB9xuOzgaTxQnZGMaEiAEry/l54JPZytup8B4Ks+LALtCd6OoQ1YYX0skRzZPkWFymsJhZwftGaRA1mQllhdXf3yOb40w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77OWjqVdYfLEVpwINV7v8sHTg257aks75YpSleBQXNY=;
 b=DK95kwJYgjjgguuP586vJHjuDxB64OoUqqFci/zuBUPkICJQJmVEQ2wqpPYMe3uPgpfs6/24szDG2EcG42gN2yIHW2InQ9U1DooTSWfG6FIxHyOriF/y5SK+IuDJU5sDVc9d8ICOVwC0nUQr7vlXa7dA5N/+gEzFSbCxdI7AjL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc7d2eb5cba73a0a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nT3hc6IW/grXr5ZVMtum5qK1dGQAwlD0mzLXmIfUvsfs3gGsQuy9GU1AGMVv6N5NXQ1XvHwBzHu7oPyj3sSUAQ8fTGhB22+wc9po/m0xCK0D6glXM+GCtlAm+jwgu4HPDTLikfOdL6RFqIfv2qgnVkl1XlICiHpsF1/MGlrG9VYwQkrvDRiHX38q479+MrJboUlpV11GsRcm9Bx+IYRURomJeKVIdxEGXPodoBC/4RUhVZutRvTGZwE1qxkV8xZ01wNLsYWWP73C1vTO1k+TKuX5LlA2pmOsloDj5Gt/ACFUbY26qYcqShyOd+DIy5lYCC5KiH9biYYZ4CJMObhPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77OWjqVdYfLEVpwINV7v8sHTg257aks75YpSleBQXNY=;
 b=JHKmMH2jOUQ2KXywFRMzpPj/Ax2NihMkPcRSmraqLjs8YxAyACB0PZxPTePRFE1ZdDVqVzh8x/Q6tCp/gpjiuCf3wGsSgLeyd8MVGwvCouabhYFDkiBUxS0iqiRXDC7Z9pPM6+OgPUCX0YJQqjPMfu502ofVj1qFTJLrqHGOipGSfNt23/GGsB/Fbr3vMp36BrGrg4Mtk9gIte/HEa1FvEjF/mnS2R6naHZwC2Vtpz3ndMFRWub3RwwxTnx0h9Qvbi8rl/AojpeTxHpPzfwuRa5RNlP3T6w8D6Eq8XwDPcxJf9WAy2IoFricZggCQY35bGN/+857haE7UjJgI18X8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77OWjqVdYfLEVpwINV7v8sHTg257aks75YpSleBQXNY=;
 b=DK95kwJYgjjgguuP586vJHjuDxB64OoUqqFci/zuBUPkICJQJmVEQ2wqpPYMe3uPgpfs6/24szDG2EcG42gN2yIHW2InQ9U1DooTSWfG6FIxHyOriF/y5SK+IuDJU5sDVc9d8ICOVwC0nUQr7vlXa7dA5N/+gEzFSbCxdI7AjL8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Topic: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Index: AQHYWlHsf41jIOfeQ0mX6M++noloAq0EDIIAgAEMUACAADIdgIAAFDQA
Date: Thu, 28 Apr 2022 14:11:44 +0000
Message-ID: <92ECC32D-DA6E-4DC8-B0E2-8EC758471C4B@arm.com>
References:
 <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
 <a2bba079-0a26-8648-6f39-93148dbd5107@xen.org>
 <73BA5CB5-8B01-41BF-B967-15886554C230@arm.com>
 <fd2492da-0980-2dd4-f8d8-e2b86e9444ef@xen.org>
In-Reply-To: <fd2492da-0980-2dd4-f8d8-e2b86e9444ef@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ec501664-cdcf-479a-b000-08da29210bde
x-ms-traffictypediagnostic:
	AM5PR0802MB2451:EE_|VE1EUR03FT041:EE_|AM0PR08MB5025:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB50255E15ACCF42BE3A88913EFCFD9@AM0PR08MB5025.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HdIvHvkLEKicXbUldg5ZyT6BqAf1RogJ7gREyJelfKddjdxAoPRVHcbeqwQsNlYOyaVCuFYKOI661YIhpb6Vu70R7JkiaMZooKY3LWroAM8SqT3Uutzp1EcxwqRl1ETuZ/RgJ6KUarl5LcoDfaqE69TcOAbLbVXTLbKIbFa9rHSaidMYMkDTThVl2ICX50P/CfvwrEnJo+NTJGh2sfPLipO5ZkTfvOu3ogzYVEvj2ZWm5+vxR8AB+08XHGc1TKtIb7gZB/3VSCj4TdzaBvMGztid1JefqBVO0Kyw4F8wfZ8bk6wQZdqxlLQsY8eESis67X5PdaU/ltJARK5z99oaucdxj539LY5gdat8iFEtvn88t4uJ1kYC/ZweX9fjA2+eGJkvYAjycaoVCDHsiqEICX0ISJUrQqO/g1uzn66+rpVEflNgoA2U9B3goS7tnaZd6ApyVmvWvreMiYA2rYrS+oyuovdJH++TjBKjU5jIhZOAr8fPxHn9NQ/N6jJX1zkUvOYIhT7esX4GK8jirrTPTy4TN8F3zGkYziW+EpybRVjl3pqkxoccfQFYMAyHEmmgWTwFXNSyawV85kl7d2JFVf6PO1iOvgGkXSMNdcQwAWNhfogHqpJNV5KbxCx2thogsdjA76Ak+zDZiZ4AH4EAsF9CZVu4SbguQuMl2B6k1M3LqxBPwBRf4Vrf723dCGf3kYB4sOvoaPHnPDNjnp6K9vVk8PjOJa7vogQBCNYsRjeDa6D4LB5vyffwebYx5LpscGfTc8R2kasqL+9oOt9lntiJY0Ns/t/n55WMW/olTyeXNFJS8SxvRsJaZ3rGq8/Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(2906002)(6916009)(86362001)(66476007)(66556008)(66446008)(5660300002)(6486002)(966005)(6512007)(36756003)(83380400001)(2616005)(8676002)(26005)(186003)(122000001)(54906003)(33656002)(316002)(6506007)(53546011)(71200400001)(91956017)(66946007)(38070700005)(76116006)(508600001)(8936002)(4326008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2DC7E70CF076E64F89F9465E8EE1B4E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2451
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f990983-d3fa-4293-8268-08da29210686
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pNcK5fU57l0rdDAYd3HbmOT1NdbYJVXkIkeWiLiFTImzXr4EoAJ5a1u0WEfxisT1F/9npqX9EkpqAxhlbp0wx0B5j1IImP2YJpjIgwaHAdWUNHml4JRZfBGwqOOJ9Wv0Ccb64oruadYtsO22oR55x9L0PVb8ml0VEJq7v7qkM+R53pSM5ZHkiGhhKGIJqAvxfO7+Rtda4Uv9fcOJ458fOU/fgc/NSZYUJ/ky4NxtJVqu1Vz+bN6pWiqOiGd5rGdfWdmeAOVHEz99+8AUByAzMCSQfLsXTJ/+ylnmUvSVp3fJPGwIutGOdFBzSXAGTwzrfSJVmfzAsF0ZqfllW52RxAkdVHHF21ZJvq4i+QWlzFnAgPYyxIYKHmKbTsZT+Nf+vc5Sl+YEQAi1B6Q4Y+j30ZwkoG/0C5xEgrNb+CizkHaF7ELD7+g332FSLykfv94rGzsRkx5uRKRRKUDQ4M3uR+m7Ql3aSZ0CqCUJx/zvRcGHJ7kWnVtQ8Er1+Wswu7WMJ+4MqhPxJpb00ko9v5d8FMs47ENpouJ3rQFfbvQnX8M7F78CNaXkFrrCbEYB1OzJ79hdwndj2sulfrZPxbMXDSlJaDx9w7Zaoc6VEdJ0cCFto6TfJKbHsAiqhDFVjzXbRwC0FVTDmL3hp38ZsQhHB2JyEYBPRmysXcFRKVlup/OymqNK8rrE2kphU7k21dCu3izZTQqH6BUtBtet26SV1+OAaZXnQenihHKgShMbzt+puiu+iiqKwsO1MXdbcF7I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(53546011)(33656002)(966005)(81166007)(36756003)(82310400005)(2906002)(5660300002)(70586007)(54906003)(70206006)(316002)(6486002)(508600001)(8676002)(86362001)(36860700001)(83380400001)(26005)(6512007)(6506007)(356005)(8936002)(6862004)(40460700003)(4326008)(186003)(336012)(47076005)(107886003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 14:11:53.5061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec501664-cdcf-479a-b000-08da29210bde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5025

Hi Julien,

> On 28 Apr 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 28/04/2022 11:00, Rahul Singh wrote:
>> Hi Julien,
>>> On 27 Apr 2022, at 6:59 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Rahul,
>>>=20
>>> On 27/04/2022 17:14, Rahul Singh wrote:
>>>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
>>>=20
>>> Looking at the spec (ARM IHI 0069H), I can't find a command error named=
 MAPC_LPI_OFF. Is it something specific to your HW?
>> I found the issue on HW that implements GIC-600 and GIC-600 TRM specify =
the MAPC_LPI_OFF its command error.
>> https://developer.arm.com/documentation/100336/0106/introduction/about-t=
he-gic-600
>> {Table 3-15 ITS command and translation errors, records 13+ page 3-89}
>=20
> Please provide a pointer to the spec in the commit message. This would he=
lp the reviewer to know where MAPC_LPI_OFF come from.
Ok.
>=20
>>>=20
>>>> not enabled before mapping the collection table using MAPC command.
>>>> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collecti=
on
>>>> table.
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> ---
>>>> xen/arch/arm/gic-v3.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index 3c472ed768..8fb0014b16 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>>>> /* If the host has any ITSes, enable LPIs now. */
>>>> if ( gicv3_its_host_has_its() )
>>>> {
>>>> + if ( !gicv3_enable_lpis() )
>>>> + return -EBUSY;
>>>> ret =3D gicv3_its_setup_collection(smp_processor_id());
>>>> if ( ret )
>>>> return ret;
>>>> - if ( !gicv3_enable_lpis() )
>>>> - return -EBUSY;
>>>=20
>>> AFAICT, Linux is using the same ordering as your are proposing. It seem=
s to have been introduced from the start, so it is not clear why we chose t=
his approach.
>> Yes I also confirmed that before sending the patch for review. I think t=
his is okay if we enable the enable LPIs before mapping the collection tabl=
e.
>=20
> In general, I expect change touching the GICv3 code based on the specific=
ation rather than "we think this is okay". This reduce the risk to make mod=
ification that could break other platforms (we can't possibly test all of t=
hem).
>=20
> Reading through the spec, the definition of GICR.EnableLPIs contains the =
following:
>=20
> "
> 0b0 LPI support is disabled. Any doorbell interrupt generated as a result=
 of a write to a virtual LPI register must be discarded, and any ITS transl=
ation requests or commands involving LPIs in this Redistributor are ignored=
.
>=20
> 0b1 LPI support is enabled.
> "
>=20
> So your change is correct. But the commit message needs to be updated wit=
h more details on which GIC HW the issue was seen and why your proposal is =
correct (i.e. quoting the spec).

Ok. I will modify the commit msg as below.Please let me know if it is okay.

arm/its: enable LPIs before mapping the collection table

When Xen boots on the platform that implements the GIC 600, ITS
MAPC_LPI_OFF uncorrectable command error issue is oberved.

As per the GIC-600 TRM (Revision: r1p6) MAPC_LPI_OFF command error can
be reported if the ITS MAPC command has tried to map a collection to a core
that does not have LPIs enabled.

To fix this issue, enable the LPIs using GICR_CTLR.EnableLPIs before
mapping the collection table.

Regards,
Rahul=

