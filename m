Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B013458B3D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 10:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228690.395780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5Vw-0000bw-Lw; Mon, 22 Nov 2021 09:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228690.395780; Mon, 22 Nov 2021 09:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5Vw-0000Zk-Im; Mon, 22 Nov 2021 09:21:28 +0000
Received: by outflank-mailman (input) for mailman id 228690;
 Mon, 22 Nov 2021 09:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XeZD=QJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mp5Vu-0000Ze-UW
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 09:21:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9059ca86-4b75-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 10:21:25 +0100 (CET)
Received: from AS8PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:20b:331::27)
 by DB7PR08MB3481.eurprd08.prod.outlook.com (2603:10a6:10:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.23; Mon, 22 Nov
 2021 09:21:23 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::be) by AS8PR04CA0172.outlook.office365.com
 (2603:10a6:20b:331::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 09:21:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 09:21:22 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Mon, 22 Nov 2021 09:21:21 +0000
Received: from 9ac51e9feb3a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 565EB4CE-70F0-4D7E-A3F3-05BB29B0813D.1; 
 Mon, 22 Nov 2021 09:21:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ac51e9feb3a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Nov 2021 09:21:15 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB7017.eurprd08.prod.outlook.com (2603:10a6:102:1df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 09:21:14 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.015; Mon, 22 Nov 2021
 09:21:14 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 09:21:14 +0000
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
X-Inumbo-ID: 9059ca86-4b75-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypy0E2zDODZ5qMPEXKzGJccxLsfBNu+Kogv5z5YM6fc=;
 b=7KgI3vufOiX83hz9/FeDJ0pO/byfbRSsZd7Kr6BouoG3xCZ/9pCQD2kNSG0pf1TYnpe3UjOtF6NhQFqA9Da1O2s0eQVQJ/KPLpxUTj5dp935YDgX8WZQq9mTyLOlcsK1qemADOHegcC+HJ3z0TcI9VLyTBVQ1nklbuFGQt5EjKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e13cb0202dbbe0f6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F66oIgP0Fwe9evaDEIV7iVLWVlHXvzlpmCS3wMN4wy+wdW9sYJpd2CgZ6b7gs/YL6A/wsqVYYpUGCwDxQrfh+tRO/VVI6HKhNuvj+tS7gKx03jFilLTMVT9EzMXltYm0AfQHJtfMbhadAy3+ck/9G2a0J+IuJSjja1CWLCo2Z1Tujh/Zf0CB1OI7ZcKscGzOP/e26rNeqrZAVkSzKQjYFhCd04MTX8JJzrE0ptN9LDSk6mS6FdAaXZLLGwZLFXcvx5S1vm9qbUELEz3J4LdS2KkM5ZILhJnoGvKJh8XKw//3cdl94xMgvWMgBhcc+CWIZIyT/isPqZeb2TPer6bfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypy0E2zDODZ5qMPEXKzGJccxLsfBNu+Kogv5z5YM6fc=;
 b=m2l5/iI4X7Wi1NR7oDz5N2u0LxWtTZrrFN9+Zw2M8bPL/xSdoxF7HenWS+y92MwDBLEELMgtHFx3R4upBiaP8QhT8YeTzIp8MhjsbXxVLbFyif6TkI0a8n19di7tjPl6gG9Sk37XRIE3FfroNjC1Jqa1m8gC2z1Q/Bqqy0x5jBx1utiiYySk+a2C0rQeV9zusUVlk7/lWWw3zA1YSQstYPjj5t0mE9BkbCPYQIm5UIcEcz/v/Gx8qZe/eokXe4g7nJ0d7Z/+JBLOKKjqBd7XfgicGUh72Aq2EBN1t2Hhc54HeMsQsl70Jx+soKx66l64uHTWK1oHvYLOKpteB1Wo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypy0E2zDODZ5qMPEXKzGJccxLsfBNu+Kogv5z5YM6fc=;
 b=7KgI3vufOiX83hz9/FeDJ0pO/byfbRSsZd7Kr6BouoG3xCZ/9pCQD2kNSG0pf1TYnpe3UjOtF6NhQFqA9Da1O2s0eQVQJ/KPLpxUTj5dp935YDgX8WZQq9mTyLOlcsK1qemADOHegcC+HJ3z0TcI9VLyTBVQ1nklbuFGQt5EjKI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/smp: Support NULL IPI function pointers
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <9ce22608-a1ef-adbd-6455-8ae1af88b388@srcf.net>
Date: Mon, 22 Nov 2021 09:21:07 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Chen <Wei.Chen@arm.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <310C7A35-DDEA-4413-9159-86C651242D2F@arm.com>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
 <c1dc1fed-8f07-5074-592e-b240f2bbdd44@suse.com>
 <9ce22608-a1ef-adbd-6455-8ae1af88b388@srcf.net>
To: Andrew Cooper <amc96@srcf.net>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a486bf79-2352-45a0-5d18-08d9ad99732e
X-MS-TrafficTypeDiagnostic: PAXPR08MB7017:|DB7PR08MB3481:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3481D31B5C358C4BE0F2C5C2E49F9@DB7PR08MB3481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TrjO+caeK01PUJ8UbR18DlZuUyY2HYnHNd2DQajosCM66G2WiYEWKfG+Vaa56FRLeAZiMxdiRcsGm22S/n0COsCRJ6LE4OMlBVi5403D9+RqmZCrRRMA7R8x4v1f1myFol5oZMBLmUKJr3fKoEuxLvKiQXwGbGjLvHjp1SDv1DHYrkyRNSZJ+uBvvwdZS5QVdKfLvJN51zUMqvZfrCHcSNV4/sVvr416Zy16t6q9XPGXps4o/AlPhvVzJHVmdBuIN2lFB/kEnww4OmI4lSnjZEeH6LNKQOIqbZcGSADkD/7ZfUZ3aU9t/id5DmZRLfFS+GzOlWFRX/nenjtsQ5dkijZsmkQC1e7GnXSjw6qtGZhaZlCsH+jeR9lXmSIMuwhSLF2vrO8c17AvYwjZUFyo6T0JKMIuTMMfjn6yZXg5xbNOz6lFBj99S5a8PafInd+Fpy2JRjwDNIZJhIkrfh7AGbpI52cC7zrv2exj0vbYXpinrWg57kUDEHrpSdtUmcki6+CuApF1rpVFwO2gz32JF7oi8krnPrPH0TUkNMl0TsbY6tp3JKUVkvWWPHGXVQY/Kv68u142mq1eBC6wrZaVidjRVwQrJTHco5L40/UyAPUWBF8ST0WiENBvUbjR7UstXhb/O/v4HUa2YkhSgRf3Gzb/XzmRgp8wM0+fqIprEGW6UpM+1V2UxyHDkZsZ+sLQ6D1ij0wmkOx2tLWzjfRApNAZqA9eK0unWM4A9llo4Xs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(53546011)(6512007)(66476007)(38350700002)(38100700002)(66556008)(6506007)(2906002)(5660300002)(6486002)(2616005)(36756003)(66946007)(33656002)(8936002)(26005)(8676002)(508600001)(54906003)(83380400001)(6666004)(4326008)(956004)(6916009)(186003)(316002)(52116002)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79e1d864-8245-4a5a-83fd-08d9ad996e90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qx2DIpwhnUFaDITutoxp3BdKFz+O4XUhEpCTM5O2eMXcDtmq/tWSuQQw4svXhr61Q+i5ivW0oyx1uLSvWyvNhTYuSx35hWfcV8R98eIZDvVEpcCnIs9wgiYYPQkZ3r20AnvWw9FbJzCVaNwXy22oPh4qWO9MgiRjaMu2DPgOwJ+EB7KTcRl/j5sF9Ftc9GiZ/xC8UTq90p2pG48pZfWc+PbTo4d3Tf2MwsD6IeGjDBR1wi1Q79VzAA9o3c7lrqW5pjL0O8VLWcrs9x7gpSe09hEmHOPPy/6z9/0tVaA1d6AszTYhXGFUWC8AYAm9QKKzjsm5suk/cwVMcFIHIl+7L45U0d7iRRvc9CvsCoO+GEvzZdYWgK+OfVH/e+DcTDKjQGpxytTgXRCH6NFH82Na0Ni69xXhafpeEkIl5n/I8orzZ1RnsMTcMQ0gpm6+TcE0pMbho1hDyqj4cM2xRv7OnekvOC3cHd/pbHInQ4DvY1oBw5HCV0KxUmvNrTdG7WQGsnYZrSIqY9w+VL+1XwhLEK+vhq9Mfe7G7IsPGmymfUsbSeNEvN2/YGImDgrGcBUIUQs/V8MsjsNi/ffICLLEdKR2jTv3/2Jz9d2yE67+q26rnScvFxC2UuASI0P8ruJBhhxpQET0EJGZgRuJFxsCQo8cDHMIbp9QbVRTAyO3cgyNKsqChaL8trN88YBhN1LokFvAdTwo/opRgkf2+HjYxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(53546011)(6486002)(47076005)(356005)(6862004)(83380400001)(33656002)(81166007)(5660300002)(186003)(956004)(86362001)(2616005)(82310400003)(36860700001)(336012)(8676002)(44832011)(36756003)(4326008)(508600001)(316002)(6512007)(26005)(70586007)(54906003)(70206006)(8936002)(6666004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 09:21:22.2526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a486bf79-2352-45a0-5d18-08d9ad99732e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3481



> On 18 Nov 2021, at 10:35, Andrew Cooper <amc96@srcf.net> wrote:
>=20
> On 18/11/2021 09:58, Jan Beulich wrote:
>> On 17.11.2021 17:48, Andrew Cooper wrote:
>>> There are several cases where the act of interrupting a remote processo=
r has
>>> the required side effect.  Explicitly allow NULL function pointers so t=
he
>>> calling code doesn't have to provide a stub implementation.
>>>=20
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>=20
>>> The wait parameter is a little weird.  It serves double duty and will c=
onfirm
>>> that the IPI has been taken.  All it does is let you control whether yo=
u also
>>> wait for the handler to complete first.  As such, it is effectively use=
less
>>> with a stub function.
>>>=20
>>> I don't particularly like folding into the .wait() path like that, but =
I
>>> dislike it less than an if()/else if() and adding a 3rd cpumask_clear_c=
pu()
>>> into the confusion which is this logic.
>> I can accept this, albeit personally I would have preferred the extra if=
()
>> over the goto.
>=20
> Just so it's been posted.  This is what the if/else looks like:
>=20
> diff --git a/xen/common/smp.c b/xen/common/smp.c
> index 79f4ebd14502..ff569bbe9d53 100644
> --- a/xen/common/smp.c
> +++ b/xen/common/smp.c
> @@ -87,7 +87,11 @@ void smp_call_function_interrupt(void)
> =20
>      irq_enter();
> =20
> -    if ( call_data.wait )
> +    if ( unlikely(!func) )
> +    {
> +        cpumask_clear_cpu(cpu, &call_data.selected);
> +    }
> +    else if ( call_data.wait )
>      {
>          (*func)(info);
>          smp_mb();
>=20
>=20
> GCC does manage to fold this into the goto version presented originally.
>=20
> If everyone else thinks this version is clearer to read then I'll go
> with it.

Hi Andrew,

I would vote for the long version if it=E2=80=99s not a problem.

Cheers,
Luca

>=20
> ~Andrew


