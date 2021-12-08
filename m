Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AF46D4B8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 14:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242262.419047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxHW-0002yU-V2; Wed, 08 Dec 2021 13:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242262.419047; Wed, 08 Dec 2021 13:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxHW-0002wM-Rv; Wed, 08 Dec 2021 13:46:50 +0000
Received: by outflank-mailman (input) for mailman id 242262;
 Wed, 08 Dec 2021 13:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0Nt=QZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1muxHU-0002wG-Qw
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 13:46:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496d64e1-582d-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 14:46:47 +0100 (CET)
Received: from AM5PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:206:14::38) by AM4PR08MB2900.eurprd08.prod.outlook.com
 (2603:10a6:205:e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 13:46:44 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::3) by AM5PR0301CA0025.outlook.office365.com
 (2603:10a6:206:14::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 8 Dec 2021 13:46:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 13:46:42 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Wed, 08 Dec 2021 13:46:42 +0000
Received: from 22e22816fbae.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 031EE663-0762-4642-BF53-9A86A1041417.1; 
 Wed, 08 Dec 2021 13:46:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22e22816fbae.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Dec 2021 13:46:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3207.eurprd08.prod.outlook.com (2603:10a6:209:42::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 13:46:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 13:46:26 +0000
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
X-Inumbo-ID: 496d64e1-582d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/fLOhJ8rRPRloLpiFmv5pwlcTPy2Ymt5Bv9DIYvP40=;
 b=xGzSi7zFkaUSihAeXErF4dtTOg5nD13k5GTfdTlqMITc09sGqth25vRyVaL+688qEq8x2relbpFaSaU59IUr0oAaAVNAQlDVVUlc2e2MltRbw5Yn2iVHPrfb0Clmh6tCYwpq4DxP7+/vJ8Iaar5Cj95jc1cSy1PMMSgWFEqLK0M=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93a9b01d29f25717
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxls+uMcbMwPuBmOMhyIjb4dVE6YM9LlWYIs/eIdGzzQuKCMaGiSh9HIOx+So0JUhr7f+niVW/xZDnQZ57kORy5/RF/2hmcVGoJ3h8uMki2dEWgwFXuKYBLwIOsJ7pe4ho3oXeh/XWCy+13VSvSOgbTpxlmXbHfNH5826+Y3/ndy0XMWf5tNrdoc12XQqvZn9sUXNqVhfNkUrDTZnkGmf2vO/nzC2jlM5JTDblj4qGrdAXOxXfQYBq+k9xxp9wjAA98A19ahAnx1EBYH5Nlq0LLRnbLuNzdhW1cZJfQNCJjz0HbBK9sNzyYDDE1XXOusT8ZxdssbnZ3suHCutT42nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/fLOhJ8rRPRloLpiFmv5pwlcTPy2Ymt5Bv9DIYvP40=;
 b=mEPfZ3fnRS9BSWHVTamAGOetEpC9nSvZ9p/CVjMvak3NK8aZoYproCesBP6qePL8rYB5ghAv+tSv1fXtNMxcwXYdHRItey+ZeAnL9j4v2kbN25ZgpQMLISFQQSbsRsURYyqKnLS+sCkcIVqCS5JTySPw8JdD8WsVpIzXynP4tMJlWfmNYERmVXB4JvRix9E52pPwFwFxusTz9xzAYuLXf9MvTB3ck8kYMIjirRioFDMdODuyAoCzWbwW2P6vzBCX5j2zp2EuZVskowT5XTDxtdphTzego8pc4Jl/XO1C55vi6nzGkzIcOtiCgrJwTHOmEjltih4oQVdy0QvEtk83EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/fLOhJ8rRPRloLpiFmv5pwlcTPy2Ymt5Bv9DIYvP40=;
 b=xGzSi7zFkaUSihAeXErF4dtTOg5nD13k5GTfdTlqMITc09sGqth25vRyVaL+688qEq8x2relbpFaSaU59IUr0oAaAVNAQlDVVUlc2e2MltRbw5Yn2iVHPrfb0Clmh6tCYwpq4DxP7+/vJ8Iaar5Cj95jc1cSy1PMMSgWFEqLK0M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <Michal.Orzel@arm.com>
Subject: Re: Aarch64 stand-alone application for Xen
Thread-Topic: Aarch64 stand-alone application for Xen
Thread-Index: AQHX4lBBRwRMWKF0UkKA2OLT1/6XFKwVnPuAgBItSwCAAOUVgA==
Date: Wed, 8 Dec 2021 13:46:26 +0000
Message-ID: <5E51B1B3-9864-4F2F-9C8D-BBC22F7158DB@arm.com>
References:
 <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
 <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
In-Reply-To:
 <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5be199e8-a4ea-4fb8-d0bb-08d9ba512b0e
x-ms-traffictypediagnostic:
	AM6PR08MB3207:EE_|AM5EUR03FT019:EE_|AM4PR08MB2900:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB29006F1AE0E635BBF776D2E09D6F9@AM4PR08MB2900.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DuUM6VKpNx1b7r9tFrNp3g7ubFpiJVWVOH9qfajOvVRHgpuZN0qSbmyEgASiwEy4zgBay5B/1K5MAlbUP9oEtdU1NkU/zhwYDUKLFfh7jizVEG4zZPJYDY8oOlR1PdWpYIvSlSjHPLEYXTeu/y1fNmlN4+6SdtNnB7tHFxf2/tEX0kJllFLDcA+Wjf5mHd0MSpmMOYU2QhyexaL4ZHrsljqhWKLaXcLjFjiFcFUfm4zq8y1/fw6DbElC7AwXAcKExyu+MvLOwUS8eqcVcI7IKahgjpuqOhWysRm0c2r/DtzVjwRm6znqQu6tmj0MpOb5AAXcgDiS4JvPyPp6HfuEglJkYEDYkMiCmvSyoa1eVYWv9ayPzds7B9pxmqeKp0wpGbgVtJ9vPHWpKofB7Hn7SMoqn/e7ZqjMHu0HIVUEbOdwIc61nIv1//qX1vkFYrVNHHiw8XHByQijugI7V1iW29Uxv2EFBK9S7UyS2ZrgeNcxb2kV1X4HRp3Qxmisu0BmPsgoB2chkjweTmjpELsdYpalJv8XwuLp7oElJh0QWmw08bDb/NQROiHNZu9K9lUYD4aZ1U3mBDegfTs4g08RSfa2x1TjGC6/Rf8eUFUEIJ0IS7v6kxzssBfhp5Lms52fNj1gQYChZns7dw4TjolwmHJvmYmNB3UiKdw6xgJ81jmgcqIeWIaHEjLDVpZHJ7yUv02MCvBzq9YJVfjJB6vcn6n9JRgNUpEfHLXmoPfyklCe7daMfidiUSXY3Dw1EKSLfLlC2KatzVm7sHR69nLwJzLW+UNbBU5cv4W9hPzqSlmiygOTv3oJ2f61x9vcE8hju7Rb40GwatG4vJJP6GqS2gb5E/HOtjNDbjAfCZDxcwc7M8LBNb65RwbAXflR5biD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(122000001)(8676002)(33656002)(966005)(4326008)(508600001)(86362001)(8936002)(316002)(54906003)(83380400001)(91956017)(6916009)(6486002)(36756003)(76116006)(66446008)(64756008)(66946007)(66476007)(66556008)(5660300002)(6512007)(6506007)(53546011)(26005)(2616005)(71200400001)(2906002)(38070700005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <006581CB0012B348BDDC4DAE0571BF10@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3207
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1d231ca-a438-48f4-e933-08d9ba51214f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U6oIxIo14ueXY/Cv0B9D71KB7VLquc04wLBI+vj1ryDoEwIDxBae+zUtTbUybsSFEzUJMt3W6AZ25lks7syXT3sEv4h6BfZSvHJi1k86HkZ2BfpDUuDSZ7V85wUK7+kInzMRyDcprZEwPL8gB8MFcQGbmgwHmlPX34GPpK2Vi5wqtM7Lkzm12KJdWGKElFqWIuOVeEeBd8rg8oSGCjxSds2HrIyNFCzztcjRGHXnWn9D0AvTkVK0cQttnIPwGdrmcQGIshyEOxTGSpEOXpziHohBK975jCEiYQAOcd0oKXBzb4p/m3HnUALsn6hu4TXF7CftUW2kimyxH4ygtRIhkcEwXHizIc3s4r4VX5lRJIFSioq1Ba9MVtKNwRvB2XKs6g6M/rFAwUfj13wbrjrRMdJq62H0jrm0N5qVHH83sMB4nh1/TnUW9wYVslvZadPWGktBsRg3kSXVDzIHfb6Nmc46vvdqbhRwXZs3QLTQ6+J6nRXxaZeF0rGoWGVC0qDuTiwtURZ43tw+DTjrL9pX7I7Scb1u2IaUAp6KTTr6u+ntyAE3S2FT21FVujLzFQQDtDYhPPvryA+fX0lvkVsfUGhj+xzGpl61SeJaR3c4lN4lHAD4RE7UoYWfGUfNCAdiok0GSZjvtt7a5sxMwiVuwD75FdgkCGqLT+cx3ddsuYcF3IsE891GOIGiUHpjFqP6PwuDW9Ko7MUfm2/buaOJpeaJIEdN/mT25+aWYqjGtq0qWxWxP6sXNjmwLCdcDDu3LdpM39wYDB1jbx3MuvUHev0B/ByguKUD9g20+bfxv6uzeT1HAHfcsvVonvTl4zyG8a25oJr0tQAoMqwAndBD2F+YmgIgmTpZGlqn8qcAQWDHJUq5bPm34w/Ez+WCY+WwYrkPzBrwnv0G0ye3M9DWudLaYxBEXJodYL/sJYm0W6s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(8936002)(54906003)(47076005)(6512007)(186003)(63370400001)(53546011)(63350400001)(82310400004)(316002)(26005)(40460700001)(6506007)(83380400001)(508600001)(86362001)(356005)(6862004)(36756003)(36860700001)(5660300002)(2906002)(70206006)(6486002)(33656002)(4326008)(70586007)(8676002)(2616005)(336012)(966005)(81166007)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 13:46:42.6363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be199e8-a4ea-4fb8-d0bb-08d9ba512b0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2900

Hi Mathieu,

> On 8 Dec 2021, at 00:06, Mathieu Poirier <mathieu.poirier@linaro.org> wro=
te:
>=20
> Hi Bertrand,
>=20
> On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com>=
 wrote:
>>=20
>> Hi Mathieu,
>>=20
>>> On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> =
wrote:
>>>=20
>>> Good day,
>>>=20
>>> I am in the process of adding support for aarch64 to the xen-sys
>>> crate[1].  The crate currently supports x86_64 and includes a
>>> stand-alone "oxerun" application that can be used to validate
>>> hypercalls.  My goal is to provide the same functionality on arm64.  I
>>> am looking for a stand-alone aarch64 example, something like an "hello
>>> world" to help me with the assembler startup code.
>>=20
>> We are working on porting XTF to arm64 and already have something runnin=
g.
>> I think it could be a good starting point for you:
>> https://github.com/orzelmichal/xtf/tree/arm-devel
>=20
> Quick one - have you been able to get the "test-arm-64le-example"
> application to run?

Yes we are running this.

>  So far Xen gives me the following error:
>=20
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Unable to copy the kernel in the hwdom memory
> (XEN) ****************************************
>=20
> I wanted to check with you before starting to dig into it.

Probably a setup issue here.
We are running most of the time XTF as a xen guest but we also check that i=
t works as Dom0.

I added Michal Orzel in copy who is doing all the work on XTF, he will be a=
ble to help you more then me :-)

Do not hesitate to provide more info on your setup and target if you want u=
s to help.

Regards
Bertrand

>=20
> Thanks,
> Mathieu
>=20
>>=20
>> Regards
>> Bertrand
>>=20
>>>=20
>>> Many thanks for the consideration,
>>> Mathieu
>>>=20
>>> [1]. https://crates.io/crates/xen-sys


