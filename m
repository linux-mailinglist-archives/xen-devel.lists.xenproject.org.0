Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85F403483
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 08:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181455.328569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrPt-0001WQ-E3; Wed, 08 Sep 2021 06:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181455.328569; Wed, 08 Sep 2021 06:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrPt-0001UE-Ak; Wed, 08 Sep 2021 06:50:41 +0000
Received: by outflank-mailman (input) for mailman id 181455;
 Wed, 08 Sep 2021 06:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOOR=N6=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mNrPr-0001U4-Kt
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 06:50:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 124eb228-1071-11ec-b147-12813bfff9fa;
 Wed, 08 Sep 2021 06:50:37 +0000 (UTC)
Received: from AM5PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:206:1::31)
 by VI1PR08MB4414.eurprd08.prod.outlook.com (2603:10a6:803:f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 06:50:33 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::32) by AM5PR04CA0018.outlook.office365.com
 (2603:10a6:206:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 06:50:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 06:50:32 +0000
Received: ("Tessian outbound cc1d52552731:v105");
 Wed, 08 Sep 2021 06:50:32 +0000
Received: from a7d1b221e695.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3104BFB-56FC-497E-9F9F-9471EC98E033.1; 
 Wed, 08 Sep 2021 06:50:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7d1b221e695.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 06:50:26 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6621.eurprd08.prod.outlook.com (2603:10a6:102:dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 06:50:24 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 06:50:24 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 06:50:24 +0000
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
X-Inumbo-ID: 124eb228-1071-11ec-b147-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXFdvcbYFekiJeuPsAux0l5olVsrjIqfTBNNqjHOfbo=;
 b=fix5C2bTXUIgPc5p3I+HPsrA4GOwFPO+ZNZiaiWz0Ib/YCb/OHXEGOUCBDdKCQktsbB3CR5lxo74n4cCXtYr9Jrxrp23r2ZDjZ9dk3YgNme1ch4jiQH0GAb6GYJxrEj3Tq+MQ8VsliDEvWBBompqmxqXtDy/SWwGLd8ohVneOwc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0497a7ae381cb32d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOLtCutZwnefg5y1wFxjnwKeCZxqtPZRX8/QF5fe/5Kd1gsnsHdkckU1icNMPO+N0S5D4RiY5nGukObg07vhpJXWDORF70Z8Lels7osGzYCSvr6wDlGueiuFtIEA8Y5OaeIUyFIOwOYGmuzljd5SpixZpFlGeYbRkcqsUHj+hg7R6ypg3lTxKNS9puFlqvFfUHV6tna28m1qnJxfo15MI+OfI3Z9+xXuX60c+rndtpQP+SBJjgsXTeXvVDpevJM6gL5IApQmbInUDJNZlim01t5gY+JggDyLdh6lGDU23hbLoft5nPudxq+BhcUQB50OUj6jfO2aDgEHoQIx8vMYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pXFdvcbYFekiJeuPsAux0l5olVsrjIqfTBNNqjHOfbo=;
 b=ZY6fRNACWAPRxQX4wQ13qct5b6bbZ4fnbRuRzEEkC0V6NIAk3Epvet61/t79CkE9S924ftv92xubPfDKe1OqKqnUdbTR56wQWAZ5d1Vg5wpgcNuHaJxicpiPKbUb8CZ0ftmXhHXY/gbYMn5TCzKdhagZE364kc5emrc446QAuTRjbcVWcME4I8HCsckje5aQB6VBF/xmu09CpZYwLcvd5v2NgrSNBPxEJncdqj1PXVmg3bnNvpQgBYh5ewUb0b1GD+vhR5xwmcvTNg97/F9FTyPgQveKHfB7fEsDkyQTA5SVn6GwzovUzPnF2NBLsiG3OIvyr7/XBOijmUSRUXEMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXFdvcbYFekiJeuPsAux0l5olVsrjIqfTBNNqjHOfbo=;
 b=fix5C2bTXUIgPc5p3I+HPsrA4GOwFPO+ZNZiaiWz0Ib/YCb/OHXEGOUCBDdKCQktsbB3CR5lxo74n4cCXtYr9Jrxrp23r2ZDjZ9dk3YgNme1ch4jiQH0GAb6GYJxrEj3Tq+MQ8VsliDEvWBBompqmxqXtDy/SWwGLd8ohVneOwc=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109071750262.14059@sstabellini-ThinkPad-T480s>
Date: Wed, 8 Sep 2021 07:50:13 +0100
Cc: Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D635A64-25A8-44A9-924D-2E609D0D0BEB@arm.com>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
 <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
 <1efbd9a8-232b-b267-fa8e-7f5f1af7cfed@xen.org>
 <alpine.DEB.2.21.2109071750262.14059@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0480f88d-9590-45f8-d8df-08d97294f46f
X-MS-TrafficTypeDiagnostic: PAXPR08MB6621:|VI1PR08MB4414:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4414B6124AC5165674E36306E4D49@VI1PR08MB4414.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VVTiIj9Ld3eFBUHdd80sdaijWJLmo6TWX67UpipDodKTDM4s1x6aXMINR56tk0sCMv8PjaygFWAkmXJrpfJna4Dewms2aE3C9XX8rSrG2gyFffwrP19wmtxPvmXRQ98jsq6oMhNKwX9aognpFGMWhkW0KS/fihZHScEYBwaeBPRv31KB4j7t/rogAu0HOXzdyArZvh0M9GaZjaCIxBQEF0gcK0j/0x3n81VEGi29OBM5R7Q8qUC7Qzi7aqHpqLOOgALzxNTFYvvleg4n2mCfUuC2PLyxA05HYNkEgZQLAoLBYw0MhB6KcaKnhK6j/5UY84McgP662PFBmM3g32KfHt8TnTDRz/Du0hEzptbKzEkHY+rTARTx2Kdn1yfgN4r+u+4BxRsFPyKpDZNkB52lCwn+FE4OPS58MMROFcuo2XyTiFcESa2ho6M2yWOVJ7/3ARRz9bm20a6PlcnuOI7gdXElkLqVQh6DsYWwahpMbw5QEwRB4iom7aUKupUbCp5sZNpzG4lQj385ThwoverUsHOmGtFC2wA8c+aRVj7oPBCYwhFVhxV9AcXThQ3+egGtjJP7zasl5GYXELGIXxd4p4PaeyrPNMO3V+VTXcqmAaJRBgmByk+sfg2u+5EFdHYtF6DDOq9+huvMRmbcRaCW/PcBB2rPBmgWGhmmMuPECNOIihmU2W/dQSnT0B9/veh09QmW21fMDWu9Kh9+CN39HGeyeKOewdWTb8Fy9nqiXGcySZdQTMcJH2aM0dJaQDfFCl85kQ+sjjvLAM8E88xiRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(6486002)(66556008)(66946007)(478600001)(66476007)(6506007)(8676002)(8936002)(44832011)(5660300002)(26005)(186003)(33656002)(2906002)(53546011)(4326008)(83380400001)(52116002)(6512007)(6916009)(316002)(36756003)(86362001)(956004)(2616005)(54906003)(6666004)(38100700002)(38350700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6621
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	49838ec5-12cf-41f5-d53b-08d97294ef5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yxGs9tVKGSi6SH3jcncPYjrswgX0IKJoLV2eZHfEx5soAvxJr7rAGVOCFvocNLzDdYsfdjpV3Fw7KHTw4uc7sACHEI2Ew7asC/NxtRqWVzrnMjlKb/6NX+m7KA+k0BYh8xygMJacbEoCAufrC7oEJPcfK/Y8QSVTzjoH0t/Kq0Ff2jzPn5H893R4bTgteb1IZfS20r6U1L4tWa7K/jSGtjiiPwHbvecS7t4/+CV8FZtAoPqFBWoacpKgbnSUtZ7sn6KlFGAQQLQxJXnEj3E1J502EkwMfEq7DKrKLVM64zhQuQQbm5yCCoXthKJqmzBLoBb6bvpJoVWzzvV0muwKAohjnNJ1+eHpCMGBVXaKqlKR/5/9iHIqFowrTR8AUCCDr2ZZgOsiMvdlOcy3FODOhaTM4nVFopZhcbOwVKNqkQuZTQhRoOQRY18ZiLWjRHsedolFOBOkNVhslvNFH0fLOEgFTeTQ7KmpaZcgzgWHRhG8WEAdlI1ETu0f7hLmbB4xtO4vIGKZL93uZYjGRXWdBvC6Vtn03TRyrthV3y+MSmejk0zdJAd912/TF+JGk2iwBVDsnrZ7ghzJy5XJdt27ztNwXjN2TwlQFgz5Mn0mf62UpgnI9HKer6alJmPMCOf7AqacIaGtkyv5cgjUDNR9CrCS6Cv+QDiIKjMnl4G5LYMuSdND2Sx62Eeb9f0sD1jdyCkkgZ0dQT3zFiL0O9mTKhqacpOxapzQ/t/7wcJH9cU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(186003)(6666004)(81166007)(356005)(33656002)(478600001)(83380400001)(54906003)(6862004)(956004)(86362001)(36756003)(2906002)(82310400003)(6486002)(82740400003)(336012)(44832011)(2616005)(316002)(5660300002)(26005)(6512007)(36860700001)(8676002)(47076005)(70586007)(70206006)(6506007)(8936002)(53546011)(4326008)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 06:50:32.9893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0480f88d-9590-45f8-d8df-08d97294f46f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4414



> On 8 Sep 2021, at 02:09, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 7 Sep 2021, Julien Grall wrote:
>> On 07/09/2021 12:51, Luca Fancellu wrote:
>>>> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>>=20
>>>> Hi Luca,
>>>>=20
>>>> On 07/09/2021 07:52, Luca Fancellu wrote:
>>>>> Add a design describing a proposal to improve the EFI
>>>>> configuration file, adding keywords to describe domU
>>>>> guests and allowing to start a dom0less system.
>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>> ---
>>>>>  docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++=
++
>>>>>  1 file changed, 105 insertions(+)
>>>>>  create mode 100644 docs/designs/efi-arm-dom0less.md
>>>>> diff --git a/docs/designs/efi-arm-dom0less.md
>>>>> b/docs/designs/efi-arm-dom0less.md
>>>>> new file mode 100644
>>>>> index 0000000000..8d8fa2243f
>>>>> --- /dev/null
>>>>> +++ b/docs/designs/efi-arm-dom0less.md
>>>>> @@ -0,0 +1,105 @@
>>>>> +# Xen EFI configuration file
>>>>> +
>>>>> +The current configuration file used by Xen when it is started as an =
EFI
>>>>> +application is considering only the dom0 guest and doesn't have any
>>>>> +property to describe and load in memory domU guests.
>>>>=20
>>>> From my understanding, the problem is less about properties (we alread=
y
>>>> have them in the Device-Tree) but more about where are the binaries
>>>> located in memory as we don't know in advance.
>>>=20
>>> Hi Julien,
>> Hi Luca,
>>=20
>>> I think I used the wrong word there, I meant =E2=80=9Ckeyword=E2=80=9D =
instead of =E2=80=9Cproperty=E2=80=9D
>>> because I was referring about the
>>> lack of keywords to describe a domu guest in the Xen EFI configuration =
file.
>>>=20
>>> I agree with you that on systems with static allocation, the kernel and
>>> ramdisk binaries must be at certain locations
>>> that are out of control when we use the EFI boot services, the thing we=
 can
>>> do is provide a keyword to specify the
>>> addresses and then use the CopyMem() function to relocate the kernel/ra=
mdisk
>>> in the address we want.
>>=20
>> I wasn't specifically referring to static allocation here, sorry if this
>> wasn't clear. I was pointing out that most of the information you create=
 in
>> the xen.cfg is going to be similar to what we already provide in the
>> Device-Tree.
>>=20
>> My main concern is everytime we add a new feature in Dom0less, a develop=
er
>> would need to write code for the DT and UEFI. This will increase the cod=
e size
>> and maintenance.
>>=20
>> The same can be said for the admin as if they want to switch from plain =
U-boot
>> to UEFI, they would also need to fully rewrite the bindings.
>>=20
>> AFAICT, most of the information provided in the Device-Tree are usable e=
ven
>> when using UEFI. So I would prefer if we try to re-use what's existing. =
This
>> is what my proposal below was about.
>>=20
>>>=20
>>>>=20
>>>> So I would like to propose something that build on top of the Device-T=
ree
>>>> work we did. Note this is early thoughts.
>>>>=20
>>>> The problematic nodes in the DT are:
>>>>=20
>>>>        module@0x4a000000 {
>>>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>>>            reg =3D <0x0 0x4a000000 0xffffff>;
>>>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>>>        };
>>>>=20
>>>>        module@0x4b000000 {
>>>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>>>            reg =3D <0x0 0x4b000000 0xffffff>;
>>>>        };
>>>>=20
>>>> In particular the property "reg" cannot be known in advance because th=
e
>>>> UEFI stub will be responsible to load the binaries in memory.
>>>=20
>>> Yes that=E2=80=99s true, the UEFI stub is using from the UEFI boot serv=
ice the
>>> AllocatePages function that is giving back an address out of our contro=
l,
>>> then using another function the binary is read from the disk and copied=
 at
>>> that address, finally the UEFI stub is writing the node in the device t=
ree
>>> that
>>> will be used by Xen later.
>>=20
>> I am not sure to follow. Are you saying the UEFI stub will create the do=
m0less
>> node in the DT based on the xen.cfg?
>>=20
>>>=20
>>>>=20
>>>> What we could do is providing a list of binaries to load and associate=
 a
>>>> key for each of them. Something like:
>>>>=20
>>>> binary=3D<binary> <key>
>>>> binary=3D<binary2> <key2>
>>>> ....
>>>>=20
>>>> We can then replace the property "reg" with a new property "uefi,key" =
that
>>>> will contain the name of the binary.
>>>>=20
>>>> What do you think?
>>>=20
>>> Here I=E2=80=99m lost, because I don=E2=80=99t understand what we are g=
oing to do with the
>>> name of the binary.
>>=20
>> <binaryX> would be used by the UEFI stub to load the binary in memory. E=
ach
>> binary will have a <keyX> which helps to refer them in the Device-Tree. =
To
>> give a concrete example, let say we have two dom0less domains:
>>  - DomA: 2 vCPUs, 128MB
>>  - DomB: 3 vCPUs, 512MB
>>=20
>> DomA and DomB will be using the same kernel but a different ramdisk. xen=
.cfg,
>> would look like:
>>=20
>> [global]
>> default=3Dsection1
>>=20
>> [section1]
>> options=3Dconsole=3Dvga,com1 com1=3D57600 loglvl=3Dall noreboot
>> kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>> ramdisk=3Dinitrd-3.0.31-0.4-xen
>> xsm=3D<filename>
>> dtb=3Ddevtree.dtb
>> binary=3Dvmlinuz-guest domu-kernel
>> binary=3Dramdisk-domA.img domA-ramdisk
>> binary=3Dramdisk-domB.img domB-ramdisk
>>=20
>> The chosen node in the DT would look like:
>>=20
>> chosen {
>>    domU1 {
>>        compatible =3D "xen,domain";
>>        #address-cells =3D <0x2>;
>>        #size-cells =3D <0x1>;
>>        memory =3D <0 0x8000000>;
>>        cpus =3D <2>;
>>=20
>>        module@1 {
>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>            uefi,binary =3D "domu-kernel";
>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>        };
>>=20
>>        module@2 {
>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>            uefi,binary =3D "domA-ramdisk";
>>        };
>>    };
>>=20
>>    domU2 {
>>        compatible =3D "xen,domain";
>>        #address-cells =3D <0x3>;
>>        #size-cells =3D <0x1>;
>>        memory =3D <0 0x20000000>;
>>        cpus =3D <3>;
>>=20
>>        module@1 {
>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>            uefi,binary =3D "domu-kernel";
>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>        };
>>=20
>>        module@2 {
>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>            uefi,binary =3D "domA-ramdisk";
>>        };
>>    };
>> };
>>=20
>> With this approach, the change is quite minimal to move between an class=
ic
>> U-boot boot and EFI boot.
>=20
> Great idea! I think it is good to try to reuse Device Tree, and using it
> as configuration is well aligned with other projects too (e.g.  Zephyr).
>=20
>=20
> There are a few options for the bindings. These are some ideas.
>=20
> If we are just going to specify a filename and a reference with the
> "binary" key=3Dvalue pair, then we could get rid of it entirely and just
> write the filename directly in device tree:
>=20
>    domU1 {
>        compatible =3D "xen,domain";
>        #address-cells =3D <0x2>;
>        #size-cells =3D <0x1>;
>        memory =3D <0 0x8000000>;
>        cpus =3D <2>;
>=20
>        module@1 {
>            compatible =3D "multiboot,kernel", "multiboot,module";
>            uefi,binary =3D "vmlinuz-guest";
>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>        };
>    };
>=20
> Then we don't even need the binary key=3Dvalue pair, and especially the
> device tree becomes "self contained" as in we don't need to resolve the
> reference to "binary=3Dvalue ref" to understand it.
>=20
>=20
> (Also worth noting as inspiration the HyperLaunch binding that is using
> the "mb-index" property as index in the multiboot module chain. Not
> directly applicable, but interesting.)

Hi Stefano,

Yes this is an amazing idea, it will solve every issue without introducing =
new keywords in the config file
and it maintains the compatibility.
Now in the current code there is a check for modules that are =E2=80=9Cmult=
iboot,module=E2=80=9D, if any is found the configuration
file is skipped, but if we change this bit to check only for modules whose =
parent is the chosen node, we can
distinguish very well between the dom0 and domus kernel.

If we all agree with this, I will update the design.

Cheers,

Luca
=20



