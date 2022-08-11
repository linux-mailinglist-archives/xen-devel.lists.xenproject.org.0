Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6967E58FA06
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 11:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384350.619701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM4SV-0003DR-Uv; Thu, 11 Aug 2022 09:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384350.619701; Thu, 11 Aug 2022 09:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM4SV-0003Am-S9; Thu, 11 Aug 2022 09:26:31 +0000
Received: by outflank-mailman (input) for mailman id 384350;
 Thu, 11 Aug 2022 09:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO9K=YP=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oM4SU-0003Af-8n
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 09:26:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60087.outbound.protection.outlook.com [40.107.6.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad25c8d3-1957-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 11:26:28 +0200 (CEST)
Received: from AM6P193CA0105.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::46)
 by AM9PR08MB6690.eurprd08.prod.outlook.com (2603:10a6:20b:301::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 09:26:25 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::2b) by AM6P193CA0105.outlook.office365.com
 (2603:10a6:209:88::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Thu, 11 Aug 2022 09:26:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 09:26:23 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 11 Aug 2022 09:26:22 +0000
Received: from 8f82f790a6f3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A56ADD82-2A65-432C-9B6A-BBAB3B4466A8.1; 
 Thu, 11 Aug 2022 09:26:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f82f790a6f3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 09:26:16 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS4PR08MB8241.eurprd08.prod.outlook.com (2603:10a6:20b:51d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 09:26:13 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 09:26:13 +0000
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
X-Inumbo-ID: ad25c8d3-1957-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RfRqyAEEp8fhnzwpQ6nOrRg7yeNQR+MSIOIWigxb7t2PCkjYRhdpz6D2fnK6XhM5xZxRJ4awxZMFbOU5B7463W34qbUCLrFhHUT77JvekKkPb5MmbMLsDO/UyrsxQdRuM/sN14o6NlyGSFVNxhifLMtlWQ4EJ5pt0wxf/I3lbYzVzM6v7shswc0gSjhP26FPT4FfmVeP8UA8IISgQCXJ2j7bNVsBNuk3bBJ6dULPmxQYvrM2WPFJIah3Vl9OEhjtjMEVJFZ1G9F1AybFeR1OwqNBRcNtvtLjawsyeLY38Cw1BhYa9AR4H2PpYq9thZuxh7XVeOMr2tjIlWf1X474vQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vSIq1vrAL7EGGbL0y+nQGmTt2tz5PDTqBIvbVI6CGw=;
 b=UiaYwVKL9beiHzCgrPE7To0ncQ3n4TZxOLRnBc6Jg4/+gOjZIBbQFcSMj8gVZH+dj43zyX7W6s4Sn8bVjaomWnuIxN16juv9PingvEr59iqVYzRFJXHVoltGOqJPXSEMwjchdgDK+zZCErWr0NPNzze3jwqo57Rm3KIq/wL3MN75QeiT5W0qqxUEXxLsm8ZMiHqsrFuPFM70v6UOcByO9VrJ3Pj1LJP7WDXkZOz+X5eGLbZPifZdqCIEU4zDtQJr+kspXuan88HM3/udUL0DxGcCBOzr+faE+/Jez+TLXDX8I7uWSfEX3SXUVS5Baxo+RnQSJ+psbgSicG8zaybBZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vSIq1vrAL7EGGbL0y+nQGmTt2tz5PDTqBIvbVI6CGw=;
 b=1o1e2VTumUTnjoKsFkMmIv9DlL3WomMQKhsknG6QWE9xLy8ZM1eokR0m0Sca91JYIMQczzP+1cGtC1FQZOlRV3qI5vhGPV/FPdJ/KBxFNJqfjQUh3fdiRB1W4rCHPt2zfFrtr/ZC6d0tpLXtYhq9e2roWRXdkg7vosMlynis3D8=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1330c8ce073c1f50
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEunBA0sOLudKBmUqRLPBhyBWMvWJkUXe3HJ60Gn2gZYz26rPoJTDG1WjzekUEzO+Lfa71GBXqGNO4FDLu7X0aCzOGijdlU9rSfCH1MUAWkT7q8MNYSRpHcbajVPzpE8sL9aG54yEdReNPMc8LCJfTmBSvsuq5lSs+8JkTwsrbRncz1Z4YF1I1hjtNyUEV9Bi8+xXYseiC1qK2yMEklNigvEk7XUKOA0cI16X3vW9A8efFcBcmVoFtc8jOj1ERRQ7FCviK+qF0I+Uojd7VvTmZlEdflTFd85LaoFH1x+moUO8Ky64rUMYzeo3VBK7dk6sMe0BtRCOnce6cPrjIhgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vSIq1vrAL7EGGbL0y+nQGmTt2tz5PDTqBIvbVI6CGw=;
 b=ZDIz9ZAmB5Pzu5Uanv3ydlSRaSSFrT48SmRSteT/4SspNOfuYFsMYCY8T+DQvBZoizYC+EKcKHNPCsxsS4w28w4QMjgQLBtw2Sjw2Lt0dI3Df2p3j2pMXsLFXIL8sdFa+OjoqwASj4fl3+J0fzgWF5P6AMvmefoLgeVBzuXVeXC5BfH3BTkix27UZgRvbzjW2K/8iwU8d18QLhDk4aX0oqTXLzi3sYfLp8iwkF7ilf5Tu9nSHxLHgxSGzG1ybDjC4mvslg4Zbx/1mS+mx/01+J2HNMFvxv4e7Ul9IDZ1LngnRM1rNHFzXrPf6rIHQX02rZLgpx/zQ1HbGdmcb/u3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vSIq1vrAL7EGGbL0y+nQGmTt2tz5PDTqBIvbVI6CGw=;
 b=1o1e2VTumUTnjoKsFkMmIv9DlL3WomMQKhsknG6QWE9xLy8ZM1eokR0m0Sca91JYIMQczzP+1cGtC1FQZOlRV3qI5vhGPV/FPdJ/KBxFNJqfjQUh3fdiRB1W4rCHPt2zfFrtr/ZC6d0tpLXtYhq9e2roWRXdkg7vosMlynis3D8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] PCI: avoid bogus calls to get_pseg()
Thread-Topic: [PATCH] PCI: avoid bogus calls to get_pseg()
Thread-Index: AQHYrAfaSCwnUxIuckmqYlBEjhSF8a2oDQUAgAE7iwCAACgsgA==
Date: Thu, 11 Aug 2022 09:26:13 +0000
Message-ID: <83A75E73-084D-47F3-8133-2F40941A99C7@arm.com>
References: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
 <ab3f2c03-afa9-a109-7803-bdc23056b7bf@citrix.com>
 <6681e649-a0d6-1853-e47d-c2c9057c2cd0@suse.com>
In-Reply-To: <6681e649-a0d6-1853-e47d-c2c9057c2cd0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2fc73ec8-aedc-41a2-5c48-08da7b7b8ea6
x-ms-traffictypediagnostic:
	AS4PR08MB8241:EE_|AM5EUR03FT024:EE_|AM9PR08MB6690:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Vz1GotsIgZ/pUU9/sp0Crcjwi2xJglblhFM2oic6HnRyRHaXF/4UHA/qTBvBrSUUmjo2enA9rDe1zYKaSxdGs8BOPq+6RmZclQPFFZR+SEKfh2nHD21oxkNut+Ab4WyYJO7PRLJv3m884KOeKzn5nGsxCIWEceCaobsxBQIjX5gZ+FZTKctlE+WcT5UVEaaD8ZI8lDOg01wDQh13ST0GiFA1U/jqC/CvyXJfyqhWWntDH5bXjyrIGJCCCm5BlQ/KmFXdxA+/d9+TazwHzBwfn7FuC1zAiCPl0+KVVjAzoiWhkBT7kx0+WwHuxzx16hR3EkxEP93iKc/nSuv8D1j/fSHQ0dNc6ioSJA9oJlf/Krbq4fAkGvM8/6dyJOpZF3N0Ps4jMvEMld+/5OWi5m3NSViB28kJ3d0PdAEZx5kPvfxu1IjEvnKvB+FYNd2ezCKEDrFjpiO4V82JpTpEtW2U4Czm3JeHy+E4bqKOrf6zc3RirHDjlUqPN2avsgNBDOc/p6Md0jTWHCYx3s1pC5Fgi6Y7cA9BEIK0KM0/em1TzfOXU3Rbz4XVu/8YjspZy6QT+tZQvZcMZLDm2LCL+cTQNHwnvkAA0fCIli3XJ0yuCD/WvOn9F/7hRRh1Y+97ivTocNocq+hwCRm3GlbLfJ8HK3Z1ecAU7/3lYidxpfI9XhpkY4nUCuQq8OO5EKjystZzpSws+eswbYHbWn5Cgm/FjNioLzN5O6teQxwpQJrWW7Uop6oQizDWqDI6e2p6U/KBerRtBdf1ocA2UdOV+K7sixR3yXgjEixIkhNtwn3gMtiw+4uxGWLRInjMOP57tcPUXcBXNv+bHnfXVZt81X04hA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(6486002)(36756003)(41300700001)(478600001)(6506007)(38070700005)(33656002)(86362001)(26005)(53546011)(2616005)(6512007)(186003)(71200400001)(91956017)(66946007)(4326008)(8676002)(64756008)(54906003)(6916009)(66446008)(66556008)(66476007)(76116006)(316002)(122000001)(5660300002)(8936002)(38100700002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF2A7830B469FE40823281C004090748@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8241
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26400403-7ea6-4b32-29e3-08da7b7b88ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	adk5twwzLPmvRY8ruwxN1KnSxFP+3cWgJoHXeNWN6La0miSbIXbGO1VkfK3So8+2JzrlAgFC9mienDcoCVxwwF4cvNWWbSdYunQpf3CSVV4jtnTfj3IKfe3psZxBXp7YDm582auFVTvXSsnru+MsH+W1apZIKbMCuWsI312q8S8Qk85FoMJT7JYdkR6SpGetp2K5/z4QXsPGZhLVHSpT9rDjcKltsMXXxLhbSBEkx1ePtkmARmAKREhrjpoAKBmoKE4UcEUWdXdbTehABTNXcP9tVByEILXCTGpIddJmk5dmF66olUhnXSXFLMTIpz4Ly9a6U5avUBXr11AU+61Q9iJuo18Kzdt+MP7l5qzZm7xHRJg3x/r+lf6C6ltaC1h186SqrwOsj7ydi8T/00IO8F5htXZqq9xxOcCIxDT4uLy0Mpy4NCt4B0YTDYuizEV06u2dU2t79hBGlZH75sLZt5vHN6WKD4833+2Sj+J3iacsTJNbbZE/D9MVYD6IIWZ2G7M6j1RpoEZPFtFRcmjiBUcSro9/nAqFYj4DuK1rChSgBwPuJTReGSJoxrBazPjLDr3hev9F9vNVU+ueMGgsH6RHJyv15KSWVyKWQUq8XI8IOetAt/qVTgooYh2s2UnbhE068TNbeZlj4Db3BVCWDj02fu0tII9283rmJYB4LD5RWnJ2A0/AvxSfcZLs8fCkS6nkaOMk1EyHychvlfPeMg1d/bpHHe0qz5NHHQEuJ47vXLaLKpu0wSlr4FmUr3+IU+vexPZRdU+4fmVKONWWmfNV7PBj9wSccP8IZtnNyWxqXj2Om0AMrNPFDFNT35Q/DSew2uwW6RAlwk5GfcxS7kiqz1P0WHRTJ2D1VbeJVJ4pSQe5hM1rffFBEq7CyZT8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(40470700004)(46966006)(6862004)(8936002)(186003)(63370400001)(63350400001)(33656002)(70586007)(8676002)(70206006)(4326008)(47076005)(86362001)(478600001)(356005)(40460700003)(6486002)(81166007)(6512007)(26005)(82740400003)(82310400005)(41300700001)(2616005)(5660300002)(40480700001)(36860700001)(53546011)(2906002)(6506007)(336012)(316002)(36756003)(54906003)(45980500001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 09:26:23.0338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc73ec8-aedc-41a2-5c48-08da7b7b8ea6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6690

Hi Jan,

> On 11 Aug 2022, at 8:02 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 10.08.2022 14:13, Andrew Cooper wrote:
>> On 09/08/2022 16:50, Jan Beulich wrote:
>>> When passed -1, the function (taking a u16) will look for segment
>>> 0xffff, which might exist. If it exists, we may find (return) the wrong
>>> device.
>>>=20
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> An alternative would be to declare that both functions cannot be called
>>> with "wildcards" anymore. The last such use went away with f591755823a7
>>> ("IOMMU/PCI: don't let domain cleanup continue when device de-assignmen=
t
>>> failed") afaict.
>>=20
>> The way wildcards were used before were always bogus IMO.
>>=20
>> I suggest we take this opportunity to remove the ability to re-introduce
>> that anti-pattern.
>=20
> Okay, will do that in v2. Rahul - this means there's no point anymore
> sending a v2 of your fix, as the bug will disappear as a side effect.
> I'll add you as the reporter of that bug.

Ok. I will test the patch once you sent it..

Regards,
Rahul

