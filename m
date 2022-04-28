Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C96513089
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 12:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316386.535298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0wm-0008UL-Ju; Thu, 28 Apr 2022 10:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316386.535298; Thu, 28 Apr 2022 10:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0wm-0008RZ-Gu; Thu, 28 Apr 2022 10:00:28 +0000
Received: by outflank-mailman (input) for mailman id 316386;
 Thu, 28 Apr 2022 10:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJsv=VG=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nk0wk-0008RT-MA
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 10:00:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 060e6e32-c6da-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 12:00:25 +0200 (CEST)
Received: from AS9PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:20b:46c::16)
 by HE1PR0801MB1995.eurprd08.prod.outlook.com (2603:10a6:3:52::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Thu, 28 Apr
 2022 10:00:14 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::37) by AS9PR07CA0003.outlook.office365.com
 (2603:10a6:20b:46c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Thu, 28 Apr 2022 10:00:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 10:00:13 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 28 Apr 2022 10:00:13 +0000
Received: from 8b20d8ed092f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38C27C0B-6F4F-47F6-848C-DEE44EB704DB.1; 
 Thu, 28 Apr 2022 10:00:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b20d8ed092f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Apr 2022 10:00:07 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM7PR08MB5335.eurprd08.prod.outlook.com
 (2603:10a6:20b:101::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 10:00:05 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 10:00:05 +0000
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
X-Inumbo-ID: 060e6e32-c6da-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O/coY/XWyR1R71Ak1ErV4HhhBvn/wRHmtMks3+AIg8t/EQBk94DgEmLAGZZwfMNXgxCb8TKvQBMeoTWHFabcBKTV9MLEx5gZX8B9IK5sp9VoDeIVimKVSkPLIIdEReVGc6lrnZIcCmxz0s7xC0ftLO2479cLwqLyZKQCFMyE0O8L+yV6cgtR2nMweah9gh5AttXaZnl5hF7xGqPg+kYA3kKBypUZbXhp+uJwnSi6zLlZON5dXa+kbbaJ8krz180IGCTfBpqC5toElWjVriX5tgME/NWFY78uSd3M4MnTpHPYnhjQrUO9gOXfJ8fNCaeBaLje3OFy4I8603EVbJPmdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q28z8uYe4B+DUst1RH+487OG7SWT8BA/xjb2pd1xLvs=;
 b=QoZfKJMQ+6RBhG5hlyxX4nUrL8W1l0XQTneBGITgbskJ7BzCT/mXdRidQGFkQdEEAyDsjMxP8eepO6TjZ/PxmNJLclfBxP22ESf/cxBbt+7UfLsNiieVb0x3xrk35h5BPoMW6kmoAo7/Dmh/d6XiNErK+8xh0MprHhoCX8uxyHj1AwQ0SeEU53RPwDzidPqUh+7hitOgkpIUmiE9FN3RAIoKkimvlTmKLfnazATnIpfFWMU3ww5OomVjCy8YDXNVKK7rfAaxMwyeebuoJtWDaTBvCr1W7OrCk1y8pnr/E7aVJDufnoXQrg7iPNT3bzjHaaCUV1qMxYtpDRmvPGxYrw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q28z8uYe4B+DUst1RH+487OG7SWT8BA/xjb2pd1xLvs=;
 b=ySkMGvHUxDRNCjQPMS8KPCesZJfbvjFhqOQQkqWf8M3koKdFijodH3ZLwOXOkm4lzFEDYmG25gP9/AW5GT4mVsKzebP8TrNS2Ohc1D02L+me9CezaVlArI4LEzABSUDanoql9seRy3wwq/Kw+Hl46RwGeHnIWhiFk4DQAJq/Xdc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c6e87385e4174da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAkTW5dDGWYPlIuqAdKVkXXsaCzjVFWuzQEvqSiFS7ArzfCa+rG/cHhYuxqnY7kcJE4yZrkq8aNvCCY6e1IWeS8TWtnzKfXNMGos4LORQVKH/nfWLHRy0Oqmcka5pRdiLhLi5MVUwygJlh7gcVczoCbxpCb07mbgIB8Z4yWCcbqq0fZx8TC/A/+WHvusVpFUAsPmgujCZO3FM1R8gOUfl6EJrFwFSIq44U28yCiOdgV/1zEeJrEsJ/hFq7rgV9BtYxL/GmLqUenXWxJgpwdtpDP+r4oguerVkVmS6lWRkf3OzGSrqEnzY65L8idnIxTl8g037+UXzetOmqyzxhkHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q28z8uYe4B+DUst1RH+487OG7SWT8BA/xjb2pd1xLvs=;
 b=PFH84WHrTaU3s5WH5dTa4oUeqiV5vgKXunV/V/rdYCPa3lczNqYiWzsf2arLuwzD3s6fxymBi2qg/GflIP61GB+KN/3MxvsqZT5dcYH8pg9MgNmPqDH8O3qp6uIqe2ovgkgRb9YpUYgJLwF4RGI1tI7WdEGHax5lmXK3es0RdsBQe85OCm07sjOCPwAQw1vcOY/iBvbgXHyoYJCjcaj2Q/Ed85efaeVVDoT75xgCvEqP2HeyUk6tHGe6NYjcdHsieStceM9hDTXhk4hNr0ahUdab9q4IG126HG/zj5wKxTu6rD978g6oG3CYERHaudjCiYWWjWETg8fU8+EnqpRVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q28z8uYe4B+DUst1RH+487OG7SWT8BA/xjb2pd1xLvs=;
 b=ySkMGvHUxDRNCjQPMS8KPCesZJfbvjFhqOQQkqWf8M3koKdFijodH3ZLwOXOkm4lzFEDYmG25gP9/AW5GT4mVsKzebP8TrNS2Ohc1D02L+me9CezaVlArI4LEzABSUDanoql9seRy3wwq/Kw+Hl46RwGeHnIWhiFk4DQAJq/Xdc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Topic: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Index: AQHYWlHsf41jIOfeQ0mX6M++noloAq0EDIIAgAEMUAA=
Date: Thu, 28 Apr 2022 10:00:05 +0000
Message-ID: <73BA5CB5-8B01-41BF-B967-15886554C230@arm.com>
References:
 <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
 <a2bba079-0a26-8648-6f39-93148dbd5107@xen.org>
In-Reply-To: <a2bba079-0a26-8648-6f39-93148dbd5107@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 199d60cc-7513-4eaa-4073-08da28fde3ca
x-ms-traffictypediagnostic:
	AM7PR08MB5335:EE_|AM5EUR03FT057:EE_|HE1PR0801MB1995:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1995A69DC364EB6C46E51EDBFCFD9@HE1PR0801MB1995.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W5j1Cj/yHzz/dRgLRvhQqJWHxilpby/wi76+66l+txtJKVVO7IP1DdJH/7uP5oDabrysRzbScq/5JUuzzB/EGoakbW0G68arSgcuHuedcwQGhcm/CbzNj7+LX7lqdcAbdzhjSYhaaLE3ofBtWwQpzjNkeIHZ6f9bY//pMjIWw9X+ByqEGI7V3BlBBanueSKUG8WwkDeBBwjtlg2uSspRqnHZfPvUG3ErhJBJ3hCzcIsOX24SNNnUKNKhAK+obeNiYJ5n59BPIi0NsXtrVptmOY5nO3MAaHMiYhtp3c+eUHOz2W6rp8pKVHAZ3ka/0Ej7hiNK/Nl2wPfyVuA3UI6DqN8qt5xwhZK6KCBvtKnSKo/3AyW8gs01wEtrAyis3wP/zG6172Ldiy/M8AXr1ka5JG2XTVpcZ7txBpPn1DQGjkegY23S8K2VN5kQXStVq6qfKYPfso7LtqXG451owuzW3QcLwjkNcmzpCCm+J4EWmmklTVDyWGZ/cjjcyMhpw27ZioE15ybmVYjdsoZd1oDg1kpRSRk4xF6vwwG1yKI4KwSeVbyN8/ON49bfOlowcwKICLGD+Dok5vuUOi6faEDiif09zKJubSyEoVN8Q36asgxqb0+/WZYD+FudK+qlQvp5dS0CJ9V4bu/n+6s5l5m3VvSVBT21mu2zJ2ANww0O4bJeQvsFNDwO8GuGbFr5YWQAPpLBrGunIf5EjIi74Teurb4KKEo1ukgdBNBc+ltwirwRXjFVZvCoGozJpi16iWo2DT5gQ+9GpyPVyH8ezCxgx1NWLIuC0XfK8XCal4g0Hh4Rj5G0jOaeiPjzmT/JLJss
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(6916009)(8676002)(5660300002)(66476007)(86362001)(66446008)(966005)(6486002)(2906002)(66556008)(36756003)(2616005)(83380400001)(122000001)(26005)(6512007)(186003)(54906003)(33656002)(316002)(6506007)(53546011)(71200400001)(508600001)(91956017)(66946007)(38070700005)(76116006)(8936002)(4326008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB6FC66C4AD900439B45DC7C520FF8C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f3de6ae-5f00-466a-d9e0-08da28fdde89
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQgvk0NXs7AgSGKGNUTaU71DSweqqwDkFqSVK8omTlx4Cu0mGFoBptz+WUEcjIX9KaUC+oex6eI+vREJ0TgskdwlEwpzKt0flKQ/gcH0JpnCNjD3jyTz27a65LVRYA30/DmaoD0nzX1ukawWqCfLfI8QHRr6H9YWITUtNthUAZR+Qb3rw68IAatx5JLgK/7sbYRdvuwfxziwGAtnDge3vQVhcGLVSugfxRGGDX+SqZzt51EmqIqCxQg9+tDGlS9W21nFW8OIvKbLpvhLQ/Vv7+YPk22ZQKsf3xm2FbWw4Onu1QFNG+vS1/H3rvymV2s3bv+tbbIR0piQeYVphg0C2E7plIhE1v6N/QOqt7L05WuzioZpb3bRwtS6iAeeaASH+d6ebLeM3+Zc6fnyPuhGvTzF5fMKA4ARDAbJCdPlU+hvxywJX02yOzwf+SWMuq/BQlJsfQysrqS8AsL7+DV2+OFgnENRwUi5EPYps8WgBEVFwZhGApRrVpLeybGzq8bUKRuK9PyWIkAm+GLU3ILZtn3aAUdOl0W5oLRLgLs7fpTaIr9jcR2db2VPi+l4Pn3sB70rxNdA9NY2OMbdS/IZOEJBU2+kltEQ33F0PalunqBn68rGjJLfuhtXo0KKS1j1g8vqwpklrZIOkTaDY2INyH56QTqifH0pWsA/D0DhEH41bo2rejf8vRm+P8tCdVsC9dpGT96mFjXZEy72mue1pL5h7f7E+pu1Q60+MuozJH3F0Dtlw07+jBmDOzW+al9T
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(47076005)(186003)(82310400005)(336012)(2616005)(36860700001)(83380400001)(107886003)(6506007)(53546011)(86362001)(316002)(54906003)(6512007)(40460700003)(26005)(70586007)(33656002)(356005)(6486002)(4326008)(8676002)(6862004)(2906002)(8936002)(70206006)(966005)(81166007)(508600001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:00:13.9227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199d60cc-7513-4eaa-4073-08da28fde3ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1995

Hi Julien,

> On 27 Apr 2022, at 6:59 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 27/04/2022 17:14, Rahul Singh wrote:
>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
>=20
> Looking at the spec (ARM IHI 0069H), I can't find a command error named M=
APC_LPI_OFF. Is it something specific to your HW?

I found the issue on HW that implements GIC-600 and GIC-600 TRM specify the=
 MAPC_LPI_OFF its command error.

https://developer.arm.com/documentation/100336/0106/introduction/about-the-=
gic-600
{Table 3-15 ITS command and translation errors, records 13+ page 3-89}

>=20
>> not enabled before mapping the collection table using MAPC command.
>> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collection
>> table.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/gic-v3.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 3c472ed768..8fb0014b16 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>> /* If the host has any ITSes, enable LPIs now. */
>> if ( gicv3_its_host_has_its() )
>> {
>> + if ( !gicv3_enable_lpis() )
>> + return -EBUSY;
>> ret =3D gicv3_its_setup_collection(smp_processor_id());
>> if ( ret )
>> return ret;
>> - if ( !gicv3_enable_lpis() )
>> - return -EBUSY;
>=20
> AFAICT, Linux is using the same ordering as your are proposing. It seems =
to have been introduced from the start, so it is not clear why we chose thi=
s approach.

Yes I also confirmed that before sending the patch for review. I think this=
 is okay if we enable the enable LPIs before mapping the collection table.
>=20
> However, given this works on some HW, can you clarify whether this is man=
dated by the spec or this is a bug in your HW?


Regards,
Rahul
 =

