Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062F150A651
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 18:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310358.527166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nha5B-0006gc-IL; Thu, 21 Apr 2022 16:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310358.527166; Thu, 21 Apr 2022 16:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nha5B-0006dC-Ez; Thu, 21 Apr 2022 16:55:05 +0000
Received: by outflank-mailman (input) for mailman id 310358;
 Thu, 21 Apr 2022 16:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw+u=U7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nha5A-0006d6-6J
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 16:55:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8998330-c193-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 18:55:01 +0200 (CEST)
Received: from AS9PR06CA0494.eurprd06.prod.outlook.com (2603:10a6:20b:49b::18)
 by DBBPR08MB4300.eurprd08.prod.outlook.com (2603:10a6:10:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 21 Apr
 2022 16:54:59 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::b4) by AS9PR06CA0494.outlook.office365.com
 (2603:10a6:20b:49b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Thu, 21 Apr 2022 16:54:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 16:54:58 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 21 Apr 2022 16:54:58 +0000
Received: from 0a28f879592e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF45AE3B-BBBA-467E-9015-ED3B399125AC.1; 
 Thu, 21 Apr 2022 16:54:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a28f879592e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 16:54:51 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM6PR08MB4309.eurprd08.prod.outlook.com
 (2603:10a6:20b:bb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 16:54:50 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 16:54:50 +0000
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
X-Inumbo-ID: c8998330-c193-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHRpoSgnui5pu95/h9IpUp2du+0058QGwq+wflPXLNY=;
 b=4oALB1s3QZT0WdoK1ZjFUhwCrzEBnLikbIWTtx04LGpwOhY+ioddyB6LTScYWCcXQZZK/Zbt3OyuvQXerjjvTeG0sWFvLwYudm3ttkmieCH20fcKX82U0nXIUM8k881TY4tKoXUf1HjEOg7CHFaJXRLLaB6/H/sPS4o7PJ5wLDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed55f77455c6a3e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PshMOx5J781HywB16HUrabqRZXgWAS3Uyh7A21b/kXEZa8Ou4PAsx361ziUpvjzHYlnUY8fcikNrkdTZDZSwO/X4IYmYRbU0pHcU4+6CAmnmVYO8q05r1DNa2dAvokwdHwVi1tubo0RULGRbyRqmv3O3clzEQ05CeyUi2ls17tzmAHRFYytj2c9KvuiUYpGaKbKQN4XbYhNVBQqD25aycEMms97X9R2SCN4N4dhoxNx2dONv2AhZXpeeOu7xNV/vpILUiK2jKqIXtOOcyOeJ6vjUR86CTjDqPGeZl30xanWpXgwKdjbOV7E2YId0NVom3siMEOb1A4X8dpFw8ffjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHRpoSgnui5pu95/h9IpUp2du+0058QGwq+wflPXLNY=;
 b=FYbm5VV6Zlu5w1l3g4WLf57e9IwbuHjmgSpxsp2FRuIDtGw03AS1G9SH6IuGPWOvjpo+WSwytZTNbb9kwYiv8ZQdSeZQoWPfxNhHgLAj5I028wPW8lUWUPzyzE4m9YlBqG9tlpZlkcdEcFbzE4dkQqu74HJYMH/QTE1NkkTtWiWoSkveB09B3xm0GAJ+vVmFjAMgGYJAF2WHzE0eFaQ9kfIWTJfTDJb8ZRgBgqzezUsFrSeSMEvXwpHXy8kmho3P2cR3QVRbUsIW9CGV9fvaU3nQBTx1WBMLok4u1ALoAUHICm5JZBHv/i8KcSNw1IK/ABEpW9HG/jOrnT8voJxtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHRpoSgnui5pu95/h9IpUp2du+0058QGwq+wflPXLNY=;
 b=4oALB1s3QZT0WdoK1ZjFUhwCrzEBnLikbIWTtx04LGpwOhY+ioddyB6LTScYWCcXQZZK/Zbt3OyuvQXerjjvTeG0sWFvLwYudm3ttkmieCH20fcKX82U0nXIUM8k881TY4tKoXUf1HjEOg7CHFaJXRLLaB6/H/sPS4o7PJ5wLDw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Need help to debug Arm SMMU issue seen on guests with passthrough
 devices
Thread-Topic: Need help to debug Arm SMMU issue seen on guests with
 passthrough devices
Thread-Index: AQHYVXCysDCtUSKEqUams17wmJg+Jqz6WpOAgAA4twCAAALZAA==
Date: Thu, 21 Apr 2022 16:54:49 +0000
Message-ID: <09DE25B5-BAB0-4A8C-88A1-4F97A5BC12A2@arm.com>
References: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
 <98FE5BFF-4201-49F1-9F17-42E26FBE3FAF@arm.com>
 <f1a12f24-cc41-e731-b711-c1bd8e5cbfba@xilinx.com>
In-Reply-To: <f1a12f24-cc41-e731-b711-c1bd8e5cbfba@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c80d9385-e935-4f5f-a727-08da23b7ab53
x-ms-traffictypediagnostic:
	AM6PR08MB4309:EE_|AM5EUR03FT055:EE_|DBBPR08MB4300:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4300B7F4A7F560508CEAC350FCF49@DBBPR08MB4300.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VFG5g/r7Sc56ol9beophL5OWnhx4F3oZYEzMTEIJSztKE8uVhBFC50i3ZD9QQ2LVVdXkEXjBa+Ju1vrmWIKxx6yE5cUJbEG4rq7VWCFUff29Gi3MgmyNZE1qVpHh1NJPnC2NeBGYhxV8NbCyjupcBii8cX+TLKbWMPc/ObXwLZ7FMZ52nulveIVugQq/tE6eoU/ZscLOvfIpzP43HZ3fwFDy/PIrRysmqF7/j+r9m9QhbtmWwILKS5MlmSNZgBYPaZvTLWn0UuUv9ZtjbIxagauizyQu8glzmZsrxWN75ID6KFcD5rN+6jCGr4HEIZ1zj2pQc6egHZ0QdM2RlGRXf/EX+PPG3+Ssk1MO1uvMrpBrYKztGxjpIt/xbp8hso2Cpvh1sR3fhVjtWJc+73hPu/5kZAhKHwyEuIAtlv7iH3pc1GwsSphXrTHlcKTqLK/JPuFF0WbJoLL6e/uOKVndDPUxw0T7lvBhW5YN4w/qd2rbHUglkdhuwIQ0wamhWPsObt9x0zRP22GTT/xfutaLzWrlTocTkHR51eOp4bpvQ0IqP9acpNvZBqs+GwVqG4tR2pY1rvz33EBmNy7WuxxuK4OByWLWFAODNx3AkNJu2Yj7G2evhDKO6hekPEFNeXbI0KOzgaKI67wagQ79ztUuQyD53KqUNsUQHDWTMD0QeIl6/w05qRgFrYstW4Mx8StQ4DaQuKRWVcQ19tqkBCY/MIAgsWT6kNNnuIQDb4wLWYXQX3leuibQER+yAOgeEFU3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(71200400001)(86362001)(8676002)(5660300002)(6512007)(6506007)(36756003)(186003)(38070700005)(26005)(316002)(6486002)(122000001)(53546011)(33656002)(2906002)(6916009)(508600001)(4326008)(8936002)(76116006)(66946007)(83380400001)(2616005)(66476007)(91956017)(66556008)(66446008)(64756008)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D37A292E94E49746BDD72F903A939CA7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4309
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a1876b4-f6cf-4288-534b-08da23b7a618
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZOh5AOOJC2lAiy8nQiELcQHY66oNyV1ZdgcFgJujY8eodHCCITRHgviUiGh81mEcNl65+1EWTv60f9wEt6uiSBNnZ28+SUsX9T8qG0he4qC6+gmvF7V7oRmdAjXxaE1OQhqHeD5SX3FsZz0urdgJAsQaG7vAxHQLJXQ/f2WVimzeVVOpSg7xkl0Dp8pb9b5574HW4ce58+hQcm0V8Q0sBYfjqh4g10p+ffvYXSopVBKpfypkU+V2ehLdq7/jPaFqdjYdh0P81Z6J2MBxDVEqan1k2NF9g1NBx6cQsHG6MMUSqgbx3YcZ+F4Dxk+j8DRtU4yECKsKwwglp2g41ZVpNXgsPGO541TGahdI3+Dhl6d3q6AOLVNbtuhZPsn+9CCUFEwzQlLzoKTzCRC4/7K6OzQe/YWuvY6U2E241I1Y3bCeObaXXljfOxu/Cnl/SeEQnteFDnFKj3UHoh94TB3E2qtxfwVeUdbNow7akQJvjPm+Cz0Ha1rcfGwBeNDJsFpkeGf/bR1oj8kL3x5Gq0D/6ZINED+VfQdjrbyDJjMqJMlfOoEwYHnyncsBjc8Ja64O15MkvPhCSDTPWRs0ODDt+gAFugYGwaAyj8GRGLaXfnyj9wxktkq9YoE9JNhWVejQDncm1lTHdoka+KkpIDdrHiBlM0kcaqG8pfCkYt/xfmYLTC3lTDvlfCpQyn4eGo/b
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(356005)(86362001)(8936002)(81166007)(2616005)(26005)(47076005)(54906003)(186003)(336012)(40460700003)(6512007)(82310400005)(36756003)(6486002)(53546011)(6506007)(508600001)(70206006)(70586007)(83380400001)(8676002)(316002)(4326008)(6862004)(33656002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:54:58.6095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c80d9385-e935-4f5f-a727-08da23b7ab53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4300

Hi Ayan,

> On 21 Apr 2022, at 5:44 pm, Ayan Kumar Halder <ayan.kumar.halder@xilinx.c=
om> wrote:
>=20
> Hi Rahul,
>=20
> On 21/04/2022 14:21, Rahul Singh wrote:
>> Hi Ayan,
>>=20
>> > On 21 Apr 2022, at 12:12 pm, Ayan Kumar Halder <ayan.kumar.halder@xili=
nx.com> wrote:
>> >
>> > Hi Arm/SMMU experts,
>> >
>> > Scenario :- I am trying to assign a device (eg mmc) to a guest which u=
ses smmu. I start the guest using "xl create -c ...". It works fine for the=
 first time. I am able to access the device.
>> >
>> > Now, when I destroy the guest and create again, I see this issue
>>=20
>> Did you observe any other Xen error while deassigning and assigning the =
device ?
>> >
>> > (XEN) smmu: /axi/smmu@fd800000:  GFSR 0x00000002, GFSYNR0 0x00000000, =
GFSYNR1 0x00000871, GFSYNR2 0x00000000
>> >
>> > 0x871 is the stream id used by mmc.
>> >
>> > We are using SMMU-500. So from the Arm SMMU v2 specs, it is "Unidentif=
ied stream fault" for stream id "0x871".
>>=20
>> Yes, you are right above error means that Unidentified stream fault. Tha=
t means SMMU hardware is not set up for streamId 0x0000087
>> I just try to go through the SMMU code and observe that this issue may b=
e related to iommu group but I am not maybe I am wrong.
>> I just created the patch that is not tested. Please try to apply the pat=
ch and test it once.
>=20
> Many thanks for looking into this. With your patch, the issue is resolved=
.
>=20
> Are you going to send out this patch for review ? You can add my "Tested-=
by" tag.
>=20

Good to know that the issue has been resolved. Yes, I will send the patch f=
or review.

Regards,
Rahul=

