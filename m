Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B033F24BD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169188.309064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuC7-0007Uw-0O; Fri, 20 Aug 2021 02:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169188.309064; Fri, 20 Aug 2021 02:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuC6-0007Sk-SQ; Fri, 20 Aug 2021 02:23:42 +0000
Received: by outflank-mailman (input) for mailman id 169188;
 Fri, 20 Aug 2021 02:23:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGuC5-0007Se-La
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:23:41 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a177752a-015d-11ec-a67a-12813bfff9fa;
 Fri, 20 Aug 2021 02:23:40 +0000 (UTC)
Received: from AS8PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:312::32)
 by DB6PR0802MB2389.eurprd08.prod.outlook.com (2603:10a6:4:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 02:23:37 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::81) by AS8PR04CA0057.outlook.office365.com
 (2603:10a6:20b:312::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:23:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:23:37 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Fri, 20 Aug 2021 02:23:37 +0000
Received: from 025bedae9462.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 597643C1-B9F0-4F99-BD16-697B8BE0BD0D.1; 
 Fri, 20 Aug 2021 02:23:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 025bedae9462.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:23:31 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3050.eurprd08.prod.outlook.com (2603:10a6:5:22::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 02:23:29 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:23:28 +0000
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
X-Inumbo-ID: a177752a-015d-11ec-a67a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8K+sDOeLj/uGveFzG8lh7PT3T8X+fb2/lNmZv6VrK4=;
 b=sqm5nwpBYcY3r3rPpwoMSKF40B5Cx7EYCmeV2Q52UiwApeg8p9XWDfx4VCWuzZEpWavuGPzyqwdeFZykcVYluMGRg98fBlgpL/7zB/zMLuhWvv3Q7ib0rpjO9mDXpeU0eSr9QEBzHvMkJftgh+VLayx6KICC+H4jQksEKNTDke8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc2rGHkZQrBQJxyF4jI2VXfm6afFxBaZbbZunTsnhCp1uIRPua8J37CFSqYpaZD9KcyGDKwQQ+a04H74XrGqOos24l+1UKUH+OOn7jmsoWXOgKgAI0PRl7YDJuWWUdhLxx3z6soFe6XNwaTcTwhvP3piPmak/AJyZOjQqy3v57usggnVumS9DkgEzlmEiLJAXY715urQdRIrTfQou0zBis9okcNueEjr9f60/QJdFUxHEbNzwO484MDFOy/FlOw+tA7CeJs58K5oVLU0sc3+JtJJ7ZT0NMuhKkgOqzuyesjofs8NCJDuyEixAxZ08OXwOhiGSYlV8TPnLkRHTnd+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8K+sDOeLj/uGveFzG8lh7PT3T8X+fb2/lNmZv6VrK4=;
 b=W44XALhmseEjYuk/WYjp3PvvAoJ9g8ryOcetDhj/szkZ6OolyfVuiD8flO3PtY7PUAzX3Zb6vVot+TcVG1Uh/AhkarTlVrvmRTUxeyHZ/j5FDvWsKcc0INneuAAmOxN+tsX0Jh3qBcl4lv9rmDptwyOmjUEnqR2mU5hZ//Hj+JZbUm/KNX7w+hzuhURl4c17IY5c8BC1dhQQSwWtjTq/RrwDxz2qTo9ybGSiVjWBjnPpd2X7iYekCmGaIBL9Y9NpViXHN2687M5eBlRLNNhS9ggFfYOlpB+HAwB57SzgsLjIRvo2E2gltLP8tGvfZR8HI2BqIWnxnslr7GugzJiYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8K+sDOeLj/uGveFzG8lh7PT3T8X+fb2/lNmZv6VrK4=;
 b=sqm5nwpBYcY3r3rPpwoMSKF40B5Cx7EYCmeV2Q52UiwApeg8p9XWDfx4VCWuzZEpWavuGPzyqwdeFZykcVYluMGRg98fBlgpL/7zB/zMLuhWvv3Q7ib0rpjO9mDXpeU0eSr9QEBzHvMkJftgh+VLayx6KICC+H4jQksEKNTDke8=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Topic: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
 device tree processor node
Thread-Index: AQHXjps9W9pBfq916EKAfG5ObJRyjat7LowAgACIpGA=
Date: Fri, 20 Aug 2021 02:23:28 +0000
Message-ID:
 <DB9PR08MB6857105F17F529CCD54D83E89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <b52884fd-da4b-f09c-8ed9-cefd7c5b6e97@xen.org>
In-Reply-To: <b52884fd-da4b-f09c-8ed9-cefd7c5b6e97@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 957C194B5BAF2E4A8D22BAA4D228B391.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: de5ed87e-52dc-45e7-7ffc-08d9638184a8
x-ms-traffictypediagnostic: DB7PR08MB3050:|DB6PR0802MB2389:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB23891C72FBF028040A3B7A8E9EC19@DB6PR0802MB2389.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I//9udkMGPvejeFOGvBjQ6gKZJEBhwSnTBhp4QR0jRnwIjl6/ucQ5bdm/Y15I545OJblkYC3rHug+t930oEvAGCaU2kAcsAzD0N/kXKbI0dzR2s3MqE/rHNnKlLw54+TZqiPNlDqPMnG88crkknrCr0kIuYzcraaRZfAqNsHwr0ieb480Ylf6YDrXMMtOK8wos8rka5Im+/4Dbdxube2bK/VVUw00+AvWdXuJJwxXuo6Tdx1fYnRKiUHk6MTm5wTfKqV9nm6KfSJlvNzCvkYlORyutGPRRTborjf5+f7JjuabvYLotPe8r2oV9K9dMs19WAMP1UNqfKZPWjm5GE8LyNV8xMGTKLNkg2Q5pNFsrb1+IgpLWn09AWmtCNO93abPHGJbXqFwKXeW22Q0a/jml9xpmHXONi/qZ2diz+EG7A/UpA8wyECiHIMMp0G0hXSvRT9Cx9rcbZpYHiFfaUHdI5BVY08f548xc02mypS7vlBMeOYw1t3iiz5+KqNBu2gvFffvSIOUQkHCPCVoWY5vJ5Af4AoGlGd+MRVnoLUAUpdD+ISZp1YVbRNDPnZfgKpw02sqgy72YIZ81MuBtTwOEpU05Y2i0TMMprsmg8eI91pQsn3BpoVh5fnqyY+hRXtqaohv5OnvZrLxrtL5LY5xlhyanWukk2cInIKmJVka+uj0pUQWAjIKLMAdtm3ryiYPufDgViXXlUQ9vFte1BL/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39850400004)(376002)(366004)(66446008)(66476007)(33656002)(66556008)(26005)(8676002)(66946007)(122000001)(478600001)(76116006)(38070700005)(6506007)(53546011)(71200400001)(52536014)(2906002)(5660300002)(186003)(86362001)(83380400001)(4326008)(110136005)(9686003)(55016002)(8936002)(38100700002)(316002)(64756008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUhUWUtCVVlNeWE5V0xRenlyaG91VzlWbldlWnNqQjRIUjY5OGVGT29pZ1Vl?=
 =?utf-8?B?U0k5SlRnUkREaTVobGxJTWNsaTNhV1hBYzF6QnZkSG5sbDVRZHNrb1E2ay9s?=
 =?utf-8?B?QVhHa2dUd1lqaFhQS2tjL3BlWDZOazloYi8xTlUzRnNZYnlFQU9CNzkrcjRn?=
 =?utf-8?B?dWcwbUlmOWE3aWU5M0RzSUxwZUh1aXdWMlV1UmlWUzN0TmR4T0NmODRqbTVI?=
 =?utf-8?B?YlRUMkt6cFhMcmRXUzFFM0JSUVdDeFJoUWFGL1NBR1EyOXRyZTlOLzdGNnRQ?=
 =?utf-8?B?OHhFR0E3VFdZRFhJRUo2eFFBTm4ydHI5UXkrcC9OR3F2QzJ3RE9pUXNkdDZO?=
 =?utf-8?B?bFdmM2dhZlc3TEpOcjJ3dkxRS0g3TUpOU3RPRnQrcXM2NDdLZlN3TTlxTnFS?=
 =?utf-8?B?ZE9rbmJXdVdzb3Y0b2RWUXYxY0RjY0dCYU50aGRmWXhpck41UUJZK2FPWHhM?=
 =?utf-8?B?eFU2aG95Ull6Rjd5d0s4eFlQa0QxS3A3Q2U1WmMyL2o0RTlMWmxmVDA4T0JK?=
 =?utf-8?B?c28wRFlqNjk5bEVvQjNQZnNyQnE3TmVMZWxUN0lZeTFQZmNkVHRIblRHdW5X?=
 =?utf-8?B?QndCeklLSVZZNEp6SEZqNXdWMGtpMXlrRkpmajczUmhiQlhIWDNlWHdOa0dX?=
 =?utf-8?B?RjJNcCsveVExQ1BYVERyM3Y5TWl0V1pxNXJsNExZU01mNUVlMktGTDFick5x?=
 =?utf-8?B?MDV6QVRlQ1N6Slg3STNxeHN0eDMxMWNzS05ZemZrWVJadG95c2twbU5tbWQr?=
 =?utf-8?B?cWJJWnplZEJveC8vYjBCc1ZGQmZaZ2kzOGZaNWtXRFdQNFVtTVc0enlheDFY?=
 =?utf-8?B?YTN1VDErR3MzNmNmT2VUUkk4MDNFOEtxR1VsaUhtaUxFS0tPang4c29HU3pI?=
 =?utf-8?B?UTZURGZOU2xJNzJRVTRKcnlOdkVWK25nNmVkRHdid2NoQ2ZiTGFqeGRDaFZs?=
 =?utf-8?B?RlRBUFo3UmlDckVheVBRc0lHRm5kUThFV01wMVdaMEkwTnAvampHQ1VrMHRM?=
 =?utf-8?B?M3VtVHg2bS83WEtya2phSE5qM0crVXQ3OEEzNVhCNmc1Y3NLL21HMUlyNnhK?=
 =?utf-8?B?a0gwOWlBdVZlNTdMM3BSSnJHOUdhSjdla3ROMjBIMURLT2ZFTTdzZHZIMXBD?=
 =?utf-8?B?VWNwUW5zUmp1SUVRS20xTnEzbDZKWGNxWm80cnNRbjJSZWVyazlhSkcxZDdm?=
 =?utf-8?B?cUtqVXJCdGFCc2Y2Z0ZzWC96cFU1WFhidXp4b1FVcVJTTG1VZ2YxaDYwRUNj?=
 =?utf-8?B?SG0rRzBtc1M0MVJLUlJnUzhHUTFhWS9jUUVmMUVmL3ZRN044RE5xY0E1bzhv?=
 =?utf-8?B?aVpsQlpmWUxnaGxMYUh4VkZxS3lZWVpnb0RlMXBSZ3NCTDk4UmtmaTNwdHdR?=
 =?utf-8?B?bXJDVUg3SVM3TVlNbWJRQmJsanFTRlgxZ2RJQ1huakc5S1dGVk85WFJ6NERZ?=
 =?utf-8?B?WXpCMjZKSloxSFJEU1F1R1hqMUZMaDRWZ2NUVDErSEFvNG1VYW5WZGhaUVRL?=
 =?utf-8?B?UDdlTWY3S1RKR3RlNE5XL3VmcWxlSWhkQ0x1QU91RUxodEFoN2pRUndxMUR0?=
 =?utf-8?B?MjhFS1NuQlJTZnkzSExBWDNjKzA5eVVvSUVJejE1YXBIY1VRMFl4T1VpaS9p?=
 =?utf-8?B?ZjdhNXIvYXRuMUdGRzhITWRQQ09uUVQzMXkyb3p0TzVaVHF5R2lIV0podGVi?=
 =?utf-8?B?ZSt3RW5QMElLRXhvS0pXeDRvMjN2ajhLaGdqUWVnbnVickZtYXFEOTZkcVF6?=
 =?utf-8?Q?ylfyQ6dfqIyVnTpRGhDA6AxGOmPUiIGmDclDYC4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3050
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef8c117a-5e47-47e2-362b-08d963817f70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2w8GVmsPbH+scLEuh/XLmxulZopYI8HMAW5luQ2m0s4vqhA7CQCMgL3T8dKsHhdRpvTb2Bvplffhm4NbSxuETGtmYvUg7GUYx9VMHuBlpStbsvCxo4XK2pbm5AjpIwLtDdTE18t0wadXNCD0kF2gOnqp/JFe2pNBlQD2BWqvRg9vZdD8ymRHZfC/GrykXjp5hdRORRxG99hy+UWvzG5oqULVojWQE4AgmAXQQ0/d0zZc2TbXLUkeVW8sNjGiahTWvq3SYxptfqBQ53ERSLh+2cqosnO5F3J97tTJu1aCkDXaXvb/TrI6YG8Csj58jPeGJoaAw3ixfmLC8T78KACW8ouGyeSNWEoR87HzbomLYauvIw3jgw6MmKcJAHtDisSRBcWLaumtdKx6V47cit/LkuL3HBZ2BAckg4ecUX8NldNVsrJGtuWZtYgvXIy1h4pR4yBAJE5uRMiI4CSiEnHpuzHkx8uOsdMLsI+mgbih/7d1Ce0WrzSxY/mbGibcXY4zD6uo99cxQighxnmjmYRn8XRy2/PQu5V9dfpLlFI9mFVvauemKIopoc8P0PsCuT4Oewi7/18SpRJdsFn+0b9riZ9tFlclMMDdWY4cOzr9UhT1ch+D/idAwGhMPrtabKpo6JfZZFa1biF16Hr/X2hRmYqSmnIJktKVrSO7lX1QUfFD4A41gnXSSe4h7oNnGZidHlGjiQKJ1DKl2xCzSktww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(36840700001)(46966006)(26005)(316002)(53546011)(6506007)(86362001)(47076005)(55016002)(33656002)(70586007)(186003)(7696005)(110136005)(478600001)(81166007)(2906002)(83380400001)(9686003)(70206006)(82310400003)(36860700001)(82740400003)(52536014)(336012)(4326008)(8936002)(5660300002)(8676002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:23:37.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de5ed87e-52dc-45e7-7ffc-08d9638184a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2389

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMjoxMw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyMi80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVy
IHRvIHBhcnNlDQo+IGRldmljZSB0cmVlIHByb2Nlc3NvciBub2RlDQo+IA0KPiBIaSBXZWksDQo+
IA0KPiBPbiAxMS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBQcm9jZXNzb3Ig
TlVNQSBJRCBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZGV2aWNlIHRyZWUncyBwcm9jZXNzb3IN
Cj4gPiBub2RlIGFzICJudW1hLW5vZGUtaWQiLiBXZSBuZWVkIGEgbmV3IGhlbHBlciB0byBwYXJz
ZSB0aGlzIElEIGZyb20NCj4gPiBwcm9jZXNzb3Igbm9kZS4gSWYgd2UgZ2V0IHRoaXMgSUQgZnJv
bSBwcm9jZXNzb3Igbm9kZSwgdGhpcyBJRCdzDQo+ID4gdmFsaWRpdHkgc3RpbGwgbmVlZCB0byBi
ZSBjaGVja2VkLiBPbmNlIHdlIGdvdCBhIGludmFsaWQgTlVNQSBJRA0KPiA+IGZyb20gYW55IHBy
b2Nlc3NvciBub2RlLCB0aGUgZGV2aWNlIHRyZWUgd2lsbCBiZSBtYXJrZWQgYXMgTlVNQQ0KPiA+
IGluZm9ybWF0aW9uIGludmFsaWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8
d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9udW1hX2Rldmlj
ZV90cmVlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gYi94ZW4vYXJj
aC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gaW5kZXggMWM3NGFkMTM1ZC4uMzdjYzU2YWNm
MyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+IEBAIC0yMCwxNiArMjAs
NTMgQEANCj4gPiAgICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9u
b2RlbWFzay5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4gKyNpbmNsdWRlIDx4
ZW4vZGV2aWNlX3RyZWUuaD4NCj4gDQo+IE5vdGhpbmcgaW4gdGhpcyBmaWxlIHNlZW1zIHRvIGRl
cGVuZCBvbiB4ZW4vZGV2aWNlX3RyZWUuaC4gU28gd2h5IGRvIHlvdQ0KPiBuZWVkIHRvIGluY2x1
ZGUgaXQ/DQo+IA0KDQpJIHJlbWVtYmVyIHRoYXQgd2l0aG91dCB0aGlzIGhlYWRlciBmaWxlLCBk
ZXZpY2VfdHJlZV9nZXRfdTMyIGluIHRoaXMgcGF0Y2gNCndpbGwgY2F1c2UgY29tcGlsaW5nIGZh
aWxlZC4NCg0KPiA+ICsjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+ID4NCj4gPiAgIHM4IGRldmlj
ZV90cmVlX251bWEgPSAwOw0KPiA+ICtzdGF0aWMgbm9kZW1hc2tfdCBwcm9jZXNzb3Jfbm9kZXNf
cGFyc2VkIF9faW5pdGRhdGE7DQo+ID4NCj4gPiAtaW50IHNyYXRfZGlzYWJsZWQodm9pZCkNCj4g
PiArc3RhdGljIGludCBzcmF0X2Rpc2FibGVkKHZvaWQpDQo+ID4gICB7DQo+ID4gICAgICAgcmV0
dXJuIG51bWFfb2ZmIHx8IGRldmljZV90cmVlX251bWEgPCAwOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
LXZvaWQgX19pbml0IGJhZF9zcmF0KHZvaWQpDQo+ID4gK3N0YXRpYyBfX2luaXQgdm9pZCBiYWRf
c3JhdCh2b2lkKQ0KPiA+ICAgew0KPiA+ICAgICAgIHByaW50ayhLRVJOX0VSUiAiRFQ6IE5VTUEg
aW5mb3JtYXRpb24gaXMgbm90IHVzZWQuXG4iKTsNCj4gPiAgICAgICBkZXZpY2VfdHJlZV9udW1h
ID0gLTE7DQo+ID4gICB9DQo+ID4gKw0KPiA+ICsvKiBDYWxsYmFjayBmb3IgZGV2aWNlIHRyZWUg
cHJvY2Vzc29yIGFmZmluaXR5ICovDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGR0Yl9udW1hX3By
b2Nlc3Nvcl9hZmZpbml0eV9pbml0KG5vZGVpZF90IG5vZGUpDQo+ID4gK3sNCj4gPiArICAgIGlm
ICggc3JhdF9kaXNhYmxlZCgpICkNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAr
ICAgIGVsc2UgaWYgKCBub2RlID09IE5VTUFfTk9fTk9ERSB8fCBub2RlID49IE1BWF9OVU1OT0RF
UyApIHsNCj4gPiArCQliYWRfc3JhdCgpOw0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArICAgIG5vZGVfc2V0KG5vZGUsIHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQp
Ow0KPiA+ICsNCj4gPiArICAgIGRldmljZV90cmVlX251bWEgPSAxOw0KPiA+ICsgICAgcHJpbnRr
KEtFUk5fSU5GTyAiRFQ6IE5VTUEgbm9kZSAldSBwcm9jZXNzb3IgcGFyc2VkXG4iLCBub2RlKTsN
Cj4gPiArDQo+ID4gKyAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyogUGFyc2Ug
Q1BVIE5VTUEgbm9kZSBpbmZvICovDQo+ID4gK2ludCBfX2luaXQgZGV2aWNlX3RyZWVfcGFyc2Vf
bnVtYV9jcHVfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlKQ0KPiA+ICt7DQo+ID4gKyAg
ICB1aW50MzJfdCBuaWQ7DQo+ID4gKw0KPiA+ICsgICAgbmlkID0gZGV2aWNlX3RyZWVfZ2V0X3Uz
MihmZHQsIG5vZGUsICJudW1hLW5vZGUtaWQiLCBNQVhfTlVNTk9ERVMpOw0KPiA+ICsgICAgcHJp
bnRrKFhFTkxPR19XQVJOSU5HICJDUFUgb24gTlVNQSBub2RlOiV1XG4iLCBuaWQpOw0KPiA+ICsg
ICAgaWYgKCBuaWQgPj0gTUFYX05VTU5PREVTICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBw
cmludGsoWEVOTE9HX1dBUk5JTkcgIk5vZGUgaWQgJXUgZXhjZWVkcyBtYXhpbXVtIHZhbHVlXG4i
LA0KPiBuaWQpOw0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+
ICsNCj4gPiArICAgIHJldHVybiBkdGJfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChuaWQp
Ow0KPiA+ICt9DQo+ID4NCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

