Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA942DAC21
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 12:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53095.92654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8cf-0008IK-02; Tue, 15 Dec 2020 11:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53095.92654; Tue, 15 Dec 2020 11:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8ce-0008Hu-SF; Tue, 15 Dec 2020 11:36:04 +0000
Received: by outflank-mailman (input) for mailman id 53095;
 Tue, 15 Dec 2020 11:36:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kWjD=FT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kp8cd-0008Hp-3I
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 11:36:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cc8be07-c3c6-4cbd-b770-c5a6a3eab845;
 Tue, 15 Dec 2020 11:36:02 +0000 (UTC)
Received: from AM0PR10CA0073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::26)
 by VI1PR08MB3917.eurprd08.prod.outlook.com (2603:10a6:803:c1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 11:35:57 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::61) by AM0PR10CA0073.outlook.office365.com
 (2603:10a6:208:15::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 11:35:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:35:56 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Tue, 15 Dec 2020 11:35:56 +0000
Received: from d61d644f091e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93FB9DF2-9855-48BA-BC9E-4E423CBC8AC0.1; 
 Tue, 15 Dec 2020 11:35:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d61d644f091e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Dec 2020 11:35:50 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3515.eurprd08.prod.outlook.com (2603:10a6:10:50::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 11:35:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 11:35:48 +0000
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
X-Inumbo-ID: 4cc8be07-c3c6-4cbd-b770-c5a6a3eab845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S+sumwMhV7vwb5FPrnwzi2Mt0E0bIqP0QfNLsZalRs=;
 b=W5SGgqAubS+EPhDcGSUNiYGDIJB8EFVCUdCIXeYgxxxH4mMy+XsqnrrcGp1Me2Wyw6NDoCJG9yk0j8XZYM4JzqYAaR3yn+9jSij9cdRnc1pdYLt8KE+9u5PaHEbsM+ucjkiRY/mOHZ874WKnqLYjRSfYhDtEsmU7TZnK2Jhszhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9563fd1642f84854
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUIAxPi8xBQUqN+gAa/dIonK7DciA8EXUrM+k2BKjSZV0f1QOwvnCaapF4KsAmbBg7Zp2dbxysGD1qhu13OUpjLLDVOj8/k4ArFze3qmmk0Dj0koJTvH9o064CBQEn0WT2cXlFGT0JiTAUT2Iwr1C6CTN2Cwa5aDE0D8XA1j8fH8vjzM8Fz9vsIGg5L3SN/yxnD+gzF2dnUBTcOvrlc8JxioRdePW/T2VBgF0GtFgM57M8aRwKoH//LmHIt1ojc4i8M7R6bGezc16T6qG0IYBufeDA+qjdTq8vB8paAnAvpvwW+h3TokVIbUZUKj4lFLlIA4g3reS6fWmJeR7E0SBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S+sumwMhV7vwb5FPrnwzi2Mt0E0bIqP0QfNLsZalRs=;
 b=gVPnT+twnGcx+ZEx8IiaAGvy2U+AF6xUAJjTBdpWzf36+rb7aDtZstKitrM8zFhrgPYgot97d50I5aJpH7WAtkJPG7BtfHPOOE6CBGysZykf8vSWlyLO09/JRMNVuuYv+APzL1eK6LIHjxXBBHDDHNWBnSNaDRoBzRTC7LnMAC0PbEmfiLn0N7V2eU8A2sUz/2WBD59cuJrN0e5qCNT+qkbtK8r3rWd76lcJPWlOB9l4MpIQbh7vRYKM+36Z8LNiDVrPhkdSZtwnZ4VFAdS56N82G0tfR9HUxZoMcozqk0YEonasEoDfPnTEnIlxYCRPh6L83Swk8jY2lGLKRDztnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S+sumwMhV7vwb5FPrnwzi2Mt0E0bIqP0QfNLsZalRs=;
 b=W5SGgqAubS+EPhDcGSUNiYGDIJB8EFVCUdCIXeYgxxxH4mMy+XsqnrrcGp1Me2Wyw6NDoCJG9yk0j8XZYM4JzqYAaR3yn+9jSij9cdRnc1pdYLt8KE+9u5PaHEbsM+ucjkiRY/mOHZ874WKnqLYjRSfYhDtEsmU7TZnK2Jhszhs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Index:
 AQHWzxYvVX92i8NXPkeNMctPP72KNqnx9LwAgAUGOoCAAAdQAIAA7OAAgAAIcgCAAAqfgIAACyuAgAABTQA=
Date: Tue, 15 Dec 2020 11:35:48 +0000
Message-ID: <E6B7D158-F767-4D69-AC54-CC2BDEAE4A72@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
 <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
 <6d693361-220c-fa1b-a04f-12a80f0aec4a@xen.org>
 <CD549B7A-97C8-40F6-B762-6661A7EFAED1@arm.com>
 <da26c36c-97ec-d9f6-abfd-642017c3df5c@xen.org>
 <99C334D2-B77B-4B8A-8294-00A811CFB80B@arm.com>
 <f90df909-8815-878e-88ad-077b55a9ce1e@xen.org>
In-Reply-To: <f90df909-8815-878e-88ad-077b55a9ce1e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a658e96-4aec-4852-39db-08d8a0ed96bb
x-ms-traffictypediagnostic: DB7PR08MB3515:|VI1PR08MB3917:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB391727CD8756EA9F2BB367CB9DC60@VI1PR08MB3917.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TDBTkhKJyRgryQzh4rk/9npmHpaVj+VbfhG7G7cdynRjkm9Il+pFAYqtAf3rcPoAzG01Uy+mmbLzwiLcIxZY7ZQh1JEWouaG9db3zDWufnO6zJlLKcm9IZEViwGkrqzHUpR91JlkbFlTBsckIWfJh2TpZWlcFZ1r179qIxT9gG6hwHWOBJ3pY4hQIfdlW1NUhTGW6CkRWlBxdZyoZq99GwX9/nCKUmBbUoX3Y3QgpgJ0rTMQBMnyyqyua/+5GlXRf4u62JW63wBm4pO9b1RseIu5NZ5LXNCWaqDeqxm/MWc8RBXfrXJtZAxfsAKhhzsfDv66EhD9XZkIBmokoM4TH7esr6zLN6FbFuJCuhs5sXD0VObRvudQvWmO/UHr8irGUsI1oPH3Iyzc2mcxRtgTc00VXC6LwRIDHqIkTletGImPrASpNZ/t5ETaRKtnO/d0fD1rlyJqi68xOnNGcMFSVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(66946007)(86362001)(66446008)(76116006)(6512007)(53546011)(4326008)(91956017)(5660300002)(478600001)(8936002)(66476007)(966005)(66556008)(64756008)(2906002)(26005)(7416002)(54906003)(6916009)(36756003)(83380400001)(8676002)(186003)(71200400001)(33656002)(316002)(6486002)(6506007)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?mcwqKF2PG32PrlJyrYHD+WsYE2UbS4qZM4X4SKJ0J4wssi5+7sC1V1At8vO6?=
 =?us-ascii?Q?GW+4+ETZE19oQQV7XGsMiN3nKKDM88R35WZUgrUqTVMTQqyEzQlI+Wqr5pAz?=
 =?us-ascii?Q?jW9sCHjcD7nKEPPUappQxty3NXk7ppe5lFKu3k0tQqEJWINeJaYhn3jHBb94?=
 =?us-ascii?Q?LcnKiy+m+ySbfyYnZxNmkOIfgthGeZRm//2gd65KNCfjdohtuSBRgbbZeBsF?=
 =?us-ascii?Q?gENoJVmUwDt04ZNrrCCZEVkqlJ8oiIy0k4lo2VfK6LRF3wkr+KsfP4gYU24A?=
 =?us-ascii?Q?YBWAC7E0M45neqjUP3C2+oiSNmi1OeERrOPHxkPEmM2O2+MMHbFDl7rOKfKA?=
 =?us-ascii?Q?FQLYdqEzgxnpIIyhJJkt4AQhDMSCtpBb5lOMe3NfFqvUoKJ8Qo9vZt6gkcRu?=
 =?us-ascii?Q?7D7k+A01NwYPMMZi3+tfmPTg/xmQ8yIVsu6GsyljfESsEnYLIRV3Dq0GQEGj?=
 =?us-ascii?Q?e14zh2jlsgn5YCZq316c7geyNG6CbF74bu9J7RvGYxL5ars3yCMETw8j8PKG?=
 =?us-ascii?Q?3j6GFCcz7VhW1GHYmc3kLOEfu9fx1hFXJ4dKOcutnQSeEfT6pgtw4Z8Bu31N?=
 =?us-ascii?Q?+Vopo52HYnO04FIZJFuM0FFHuL3Tx31y+Y48CMhGbHTTgVGFIWijryHBPuSM?=
 =?us-ascii?Q?LAqZH9oZIXGhPkXQ8etqitJkAPXVwGPLPKMrvaU/KaIkwRpVeCMjtpBVzTrr?=
 =?us-ascii?Q?qOz9PdnUQa2NGpbZAznM0lSllkAO7SUGFyNgVj9OSeZCmDPePlEn003IRGrQ?=
 =?us-ascii?Q?HFi6518pg51F+rrzSbH4CSvDCgIXeZW8b8vzbhws7pzIK8Wtzpfgj9n6VWMe?=
 =?us-ascii?Q?1QCIpqZnQTURNMaPvzxeYUHFVLmaVL4xLMhcjqyaMUNQoC+ad6XqePgOaecl?=
 =?us-ascii?Q?+/nexJbs7Wr5xl7wFejbokKwvzgUNHZDgivqVRF0uUjhmNB5C9rJODdICPS7?=
 =?us-ascii?Q?QB20AaRDdZqJ6JwVvo25Pj732y9jiQej6VYiygYt+PcLT4X6iZ9KVoQaaBwU?=
 =?us-ascii?Q?n8LV?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4B07A0B4265ABF44AD1E8881D0A3AEFF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3515
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2744eadf-e06a-402b-678a-08d8a0ed91e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XmyI544D0PdQ+23E/LhUzF/TLQuEizN4SYm/erIbpg81WFuRVqiNDkQeB01Iy+fhivrCRwS8j3u9bWSyjmFaemST6gn2cqyIdDfFCe4ZY92/EPrLqfuB7oTSK97r3oyCnFhkxYamvPY26sWceEfG+2YvAt/HHGTdBjN117jN26HqthwdFxGQmTswIpiIe1qk0tzcnlM5d7NzXenF2CEBRml6rgBVfdHDxXpvvtG2JPHTzvoLVK3onvw3tPnH9B7+vSNbFt9keENU/Z0GeEurIafQ7t6NJvWbijp7xnF/tEEBghx9viqi5S5LTt7Ogj7lXGA6kdTXqZ+ooOXwa41Vt2qUakPJ1ERK9UPEB+UvCeW33VIHitxB/bi9Vr7oPQBrQsO3zH2Y1pchJUhOLSKS10Bb6YBRcx9F3Mb5fbYw9g3bLK6yTtvnQw56bPC3uCT3hJPNieV+YiQ5zMiPW+rXRhMC+dffJf2bPamkHiwt+kI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(136003)(46966005)(8676002)(186003)(82740400003)(316002)(6512007)(70206006)(336012)(356005)(86362001)(81166007)(54906003)(2906002)(4326008)(5660300002)(2616005)(33656002)(6506007)(36756003)(6486002)(107886003)(83380400001)(26005)(82310400003)(6862004)(70586007)(47076004)(478600001)(8936002)(53546011)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:35:56.8691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a658e96-4aec-4852-39db-08d8a0ed96bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3917

Hi Julien,

> On 15 Dec 2020, at 11:31, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 15/12/2020 10:51, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 15 Dec 2020, at 10:13, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 15/12/2020 09:42, Bertrand Marquis wrote:
>>>> Hi Julien,
>>>=20
>>> Hi,
>>>=20
>>>>> On 14 Dec 2020, at 19:35, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 14/12/2020 19:08, Rahul Singh wrote:
>>>>>> Hello Julien,
>>>>>=20
>>>>> Hi Rahul,
>>>>>=20
>>>>>>> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>>=20
>>>>>>> Hi Rahul,
>>>>>>>=20
>>>>>>> On 10/12/2020 16:57, Rahul Singh wrote:
>>>>>>>>  struct arm_smmu_strtab_cfg {
>>>>>>>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>>>>>>>  		u64			padding;
>>>>>>>>  	};
>>>>>>>>  -	/* IOMMU core code handle */
>>>>>>>> -	struct iommu_device		iommu;
>>>>>>>> +	/* Need to keep a list of SMMU devices */
>>>>>>>> +	struct list_head		devices;
>>>>>>>> +
>>>>>>>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>>>>>>>> +	struct tasklet		evtq_irq_tasklet;
>>>>>>>> +	struct tasklet		priq_irq_tasklet;
>>>>>>>> +	struct tasklet		combined_irq_tasklet;
>>>>>>>>  };
>>>>>>>>    /* SMMU private data for each master */
>>>>>>>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>>>>>>>    struct arm_smmu_domain {
>>>>>>>>  	struct arm_smmu_device		*smmu;
>>>>>>>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>>>>>>=20
>>>>>>> Hmmm... Your commit message says the mutex would be replaced by a s=
pinlock. However, you are dropping the lock. What I did miss?
>>>>>> Linux code using the mutex in the function arm_smmu_attach_dev() but=
 in XEN this function is called from arm_smmu_assign_dev() which already ha=
s the spin_lock when arm_smmu_attach_dev() function I called so I drop the =
mutex to avoid nested spinlock.
>>>>>> Timing analysis of using spin lock in place of mutex as compared to =
linux  when attaching a  device to SMMU is still valid.
>>>>>=20
>>>>> I think it would be better to keep the current locking until the inve=
stigation is done.
>>>>>=20
>>>>> But if you still want to make this change, then you should explain in=
 the commit message why the lock is dropped.
>>>>>=20
>>>>> [...]
>>>>>=20
>>>>>> WARN_ON(q->base_dma & (qsz - 1));
>>>>>> if (!unlikely(q->base_dma & (qsz - 1))) {
>>>>>> 	dev_info(smmu->dev, "allocated %u entries for %s\n",
>>>>>> 		1 << q->llq.max_n_shift, name);
>>>>>> }
>>>>>=20
>>>>> Right, but this doesn't address the second part of my comment.
>>>>>=20
>>>>> This change would *not* be necessary if the implementation of WARN_ON=
() in Xen return whether the warn was triggered.
>>>>>=20
>>>>> Before considering to change the SMMU code, you should first attempt =
to modify implementation of the WARN_ON(). We can discuss other approach if=
 the discussion goes nowhere.
>>>> The code proposed by Rahul is providing the equivalent functionality t=
o what linux does.
>>>> Modifying WARN_ON implementation in Xen to fit how Linux version is wo=
rking would make sense but should be done in its own patch as it will imply=
 modification on more Xen code and
>>>> some of it will not be related to SMMU and will need some validation.
>>>=20
>>> Let me start that this was a request I already made on v2 and Rahul agr=
eed. I saw no pushback on the request until now. So to me this meant this w=
ould be addressed in v3.
>> I think he agreed on the analysis but he did not say he was going to do =
it.
>>>=20
>>> Further, the validation seems to be a common argument everytime I ask t=
o make a change in this series... Yes validation is important, but this oft=
en doesn't require a lot of effort when the changes are simple... TBH, you =
are probably spending more time arguing against it.
>> Testing is important and effort evaluation also depends on other priorit=
ies we have.
>> There are 20 WARN_ON in Xen and most of them are in x86 code.
>> If we do this change, the serie will impact a lot more code then it orig=
inally did.
>=20
> What's the problem?
>=20
>> I am not saying it should not be done, I am saying it should not be done=
 in this serie.
>> Such a change would need a serie upfront and then rebasing this serie on=
 top of it to prevent mixing stuff to much.
>=20
> It is trivial enough to be part of this series. But if you prefer to crea=
te a separate series then so be it.
>=20
>>>=20
>>>> So I do not think it would be fare to ask Rahul to also do this in the=
 scope of this serie
>>>=20
>>> I would have agreed with this statement if the change is difficult. Thi=
s is not the case here.
>>>=20
>>> The first step when working upstream should always to improve existing =
helpers rather than working around it.
>> I agree with that statement but we should be carefull not to ask to much=
 to people who try to contribute so that they
>> do not feel like all changes asked are not too much to handle.
>=20
> I am well aware of that and I don't think this request is asking a lot.
>=20
>> I am open to create new tasks on our side for the future when things to =
be improved like this ones are revealed by a
>> serie.
>> If this is a blocker from your point of view, we will evaluate the effor=
t to do this extra work and the serie will wait until
>> january to be pushed again.
> This sounds like it would require more effort than it is actually necessa=
ry. In fact...
>=20
> ... it took me one minute to check the existing use of WARN_ON() (all of =
them don't care about the return so far), another 2 minutes to write it,  a=
n extra 5 minutes to test it and 2 minutes to write the commit message.
>=20
> So a grand total of 10 minutes.

Sadly what takes 10 minutes on your side is not taking the same effort on o=
ur side for now (due to internal review, validation and required tests).

>=20
> Anyway, please see the patch [1].

Thanks for that.
We will review it and rebase the SMMU serie on top of it.

Cheers
Bertrand

>=20
> Cheers,
>=20
> [1] https://lore.kernel.org/xen-devel/20201215112610.1986-1-julien@xen.or=
g/T/#u
>=20
> --=20
> Julien Grall


