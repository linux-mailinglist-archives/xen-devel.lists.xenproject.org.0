Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC916368D71
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 08:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115895.221164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZpjV-0000za-Tx; Fri, 23 Apr 2021 06:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115895.221164; Fri, 23 Apr 2021 06:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZpjV-0000zB-QT; Fri, 23 Apr 2021 06:56:09 +0000
Received: by outflank-mailman (input) for mailman id 115895;
 Fri, 23 Apr 2021 06:56:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiSz=JU=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lZpjT-0000z4-Ur
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 06:56:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f339e62-9a3d-433c-8493-bc27f839cee4;
 Fri, 23 Apr 2021 06:56:02 +0000 (UTC)
Received: from AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) by VI1PR08MB4446.eurprd08.prod.outlook.com
 (2603:10a6:803:fa::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 23 Apr
 2021 06:55:57 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::49) by AM5PR1001CA0056.outlook.office365.com
 (2603:10a6:206:15::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Fri, 23 Apr 2021 06:55:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 06:55:57 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Fri, 23 Apr 2021 06:55:57 +0000
Received: from 1341a400273f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCE8AB21-8A24-4BE8-906C-526E10723F93.1; 
 Fri, 23 Apr 2021 06:55:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1341a400273f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Apr 2021 06:55:50 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1837.eurprd08.prod.outlook.com (2603:10a6:800:5a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 06:55:49 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 06:55:48 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1ab::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Fri, 23 Apr 2021 06:55:47 +0000
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
X-Inumbo-ID: 8f339e62-9a3d-433c-8493-bc27f839cee4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DVsJHlnkQQhwysEc4Ngg4uQiSHZykaLsy3ArtIIUSA=;
 b=nJaF8KJTPuH8ynP61qvNfaw4SNMoIlcUytW7SLlzwC6LVU8dI0BU9ZcVq06+E1AY5nn1U+UaqYQZnyKZWxUxX3cK7f7k62LTU3ZbVxyFT7yOrmncKGtk++0ERddOKjV9Zz5huYTVyU1StNxQY8g/tMcAO6y2Lsu9YCBJJbNw1NI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a6a0984b83e97ed
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT0zJojw0oBipAesJIar5F0q2Wa4399ifkkzU2YcPT9/zrjZnU++qBYXFcckbmPVSXmKFo9bF5QKHKaxR1ez0LwYymNC6JpQdjjNft5AYAxK4+3nI5AJogNyA7Lo73MMO5K/DlD5Xz8fBw7Jtj8T3w3K/H+z04pmxBjKGO7GVXBhale9apHSXXQxJ3r66weaxsAfgNttVh+sz3cIN+QmoviQrQTP7fk1re0iAzPfjuK8xXCaU8OAaOrBB1wyuo9ku+LXQ1jGFOgq2ekjYdr5DnyWNAhfqBW8LpEQWvkNxEkFVPch1KFsrMInMMe55ynceuaKrZKuj/WpoWFs7n4QCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DVsJHlnkQQhwysEc4Ngg4uQiSHZykaLsy3ArtIIUSA=;
 b=M2HamogndtNWl22uOSh1aEpW5KwrikNZiZnzKANOwjQ7XIH3fG7nOkvE3WwUdUMZPuB9Cu60MWjC7onsUm3bLxCsmkv/dXZMwgestWmsZOsqgT/imada0jtzILZSwqKOSZpCUuSWe6dRI2rNhJh8mN2COOX9FLE0bdutYcLBvGJXxWL+BzHBsrk7tZV29IsoyGktQ5AVhKVnsvxJeTKb8TMYZeLQ1NiZifDgGk1jZeM/yEXh5Tk0ah07n2U/0ilyO2Zyd32qMTd+RRzgLYEC5I5icT7iSmg1nctOibVLZK4u7v3U0khrYQY4nycytqsrcppJhk3O9QSzJwfNXWceAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DVsJHlnkQQhwysEc4Ngg4uQiSHZykaLsy3ArtIIUSA=;
 b=nJaF8KJTPuH8ynP61qvNfaw4SNMoIlcUytW7SLlzwC6LVU8dI0BU9ZcVq06+E1AY5nn1U+UaqYQZnyKZWxUxX3cK7f7k62LTU3ZbVxyFT7yOrmncKGtk++0ERddOKjV9Zz5huYTVyU1StNxQY8g/tMcAO6y2Lsu9YCBJJbNw1NI=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210423054038.26696-1-jgross@suse.com>
Date: Fri, 23 Apr 2021 07:55:38 +0100
Cc: xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 stable@vger.kernel.org,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <467B8109-C829-4755-8398-196E50090898@arm.com>
References: <20210423054038.26696-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97d83854-f99f-4115-b076-08d90624d8a7
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1837:|VI1PR08MB4446:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB44462DE54070747A63784CD8E4459@VI1PR08MB4446.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cYtB2DlWqZYF2EDZRcGjqNfxI444xQfwcM8o94uC6DgCmdEGbQhyS2PHS3n7R9F/9XjgIRLNoPj/pdrh5BRqZ2r+aNomeKJpuU5smBClXRcQ0LgBJfmrewAcWg2Kt3B96HF2KDWMomNLiVEFq39c+yks19/oWFCBRNNkxmg88S0QcJ9fSVV3tvcF9M2dRM70b3WZjkwqhHiB3UCd9FfsrcnxE1ZbRoEQAo0jywNqEI7UMZZ7pHwRpr3q18gaN+N03gFYYmqMJWnpzbrX5g782l3Yc4tK7J/1nNaR8Q3Jk1cQI9hqFZ55vVFrdoXNZfl5XtNyCA2nEiGOiwWHfNjyRIFupC6xP5mDA3mxDVMiIMswIqIrs8Z9RuyIA6dGi7PItQDvX3mcwaA+9tWmxnqNz7GiU9tGyHynX/7zUSSfEVnH7D78K/3/HEMc5CdFOZ/rFraUevy0RjpmlRHK9p7lpVKhYoEYlAYh70V41HA+hEqwKBNWXBkHtxuReoPXKEWXg0oI4vR7thCG2cJbKiwzoPeut24o6shptyL5ckuZae0h5fAzsvO2wcySfm/gizejQmoinjd9IX3QENHfGjyW34U/LolPAvyXk63z/dOFeDWyxRY/g/qzVYXzTfhyTljmnzyRaNOu3XC2V23AYbdLz1o0ywqVt+5ORBLCeF0DzGYDbNQZuA18u7Oj2H2z7nbR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(376002)(346002)(136003)(6916009)(33656002)(186003)(16526019)(36756003)(52116002)(2906002)(6486002)(4326008)(66574015)(38350700002)(53546011)(54906003)(6666004)(26005)(316002)(38100700002)(7696005)(956004)(8676002)(86362001)(83380400001)(66556008)(8936002)(478600001)(44832011)(66476007)(66946007)(5660300002)(2616005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?U2N0bEQzNUFrNWg4V3JUOGFWRVJZamZTa2FjUDE4OG8rQXp6b28yM1h1dnBs?=
 =?utf-8?B?NFlHWFZpbzdwOVp4bXgyYUVkTHUxWHdraE5HcmloRFZsaXo1M21FaWJLak1I?=
 =?utf-8?B?MFpNZ2JVdXpUM0k2WitRZlNsUFk0ZXI1bzJmM2pORnJKWXJOblNpcEQ4S0x5?=
 =?utf-8?B?ck1LQ3Ixd3BNUE1lci96TmZ1Q3RjNTA4OWl2TVR6T29mWXZyNUxZM3hHZmls?=
 =?utf-8?B?UkVXeDRlVTJabDkwSHVEVC9tL1RiQTFJWHdqelF1cDNyeVRxT0RCVVczaTZj?=
 =?utf-8?B?UU1RUkIvTk1tK1ZDNGxLTmlUNDN3akd6Y3ZrMjBnZzVNSlRnWkIvNGpQV3JV?=
 =?utf-8?B?ejJ4L1lMcTEzZzViSXVQSlIxb0NsOW9hVk9CR3NQOWRITVRrQU1GMENXNnM2?=
 =?utf-8?B?bmJlNXJ4dmRoSFlxWStKc3ZxQjNzcnhQZkJMWHlXZStJL2d5WjBMNGIxOStw?=
 =?utf-8?B?VGNjM3QxLzNka0NGdXhQTXdYYllGRGZVcXNneGRVK1NQeFB1QjliU0kxZDZF?=
 =?utf-8?B?MGJ2UVdhdHFVOWRrdVJRYnBjd0RRSW5GV1ZTT1ZZZk9zakx5Qi9FTXViWVhW?=
 =?utf-8?B?ME4zQ3I2TVY2RUJxdUcvQThHcER6ZXpSVG5hQzBEUmNWSGoyaWZ4a1FsZVRr?=
 =?utf-8?B?NXB4TWE1OHdMekZnUUJJMnpRMllOQmpjY3luMnNXa3BVTE5YNHBqN3hwUHlW?=
 =?utf-8?B?YTR4NHR1UEEvRlV3MlZXU0Era3RzV2tDVkZ2TXdIVEdHS29Ea1ZxVVU0c0Fu?=
 =?utf-8?B?Tm8xQ25wQUlhU1psSmNJSy9scG1wSlRocFVZdXRENitXWndzV3NnOFFNc2U1?=
 =?utf-8?B?eFM0bU9udEhHVEQrS3F2RHlxVVp0Y1V0UGxROXppOFVBZGptdkh0V1hWM0ZQ?=
 =?utf-8?B?WHM3TGxqNnAzOG1yVGV4LzV2R2VaYUxEb1QwUVdVbXF6aXU2MWE2K0IwU0ZI?=
 =?utf-8?B?N2xqUEpWYU1keDgzektnNytGOVhyNDVmYlRlL2JoRW1GeTRuQnV5N25MVmpz?=
 =?utf-8?B?VWk5OVJjbk1lTmJmNjgyUmYybGpEakJsQ3ZxT3N3WXZVN0JrbVRPN1pJSzFr?=
 =?utf-8?B?QzByZlo2TitPK25FejVuazdRSWIwQzA1em1OdXdSS2RxeUpFeHpKTHB3b2lM?=
 =?utf-8?B?M3pOZ1hpUzJkTmJnTGs3bU1MekZ2OEwreTJLTFlaTk1lQXhFdmgvblY1dEl3?=
 =?utf-8?B?RExCNDBWbGNoLzBSU3JXOC9aT2lVaG9jejdkZDlicVpaRUVKWDlzamUzUytz?=
 =?utf-8?B?TnV5MDFXZC9MUnlsalg5QXlNRG41U0I2cTRqcXhWdDcwY3V4d09WM3VKSUFW?=
 =?utf-8?B?Vm9TZjJNWE1oY0RMeGZ0N0NUL3RuTjBxNVJJTWNVZjl6YllJMnNydFpSNnYx?=
 =?utf-8?B?UkljRkJhdXF4Z09qM3Evd1pxR2d3S3U1TjVuN09JM1FFZkN2SVp5WmQxdm1I?=
 =?utf-8?B?NHNEQkpQMDBCSkVRdGJ0VHFZN2pwNGxsdHQ0VUR4RWJ0YmNMckdieE1Md1Bx?=
 =?utf-8?B?UWI4MWFQZGI2ME5oekU3eFRRakJZVnZveWNnN0lHeGIrSkF5amhBT2lDN1Bu?=
 =?utf-8?B?eTY4N3V0QmlpQXlCZVc0SDU2YVpNTDMzZ0JYSG1jV3crbU91VnRaQXNDMElZ?=
 =?utf-8?B?NVd4V1FnNFJvYzVsUk5Lb1VKMzJ0RStTSS9VMTB5aFBqYTRNZWM0Q01pWXN5?=
 =?utf-8?B?cjl0bTh3cmQxSnJxVmY1Nk1FVkRjckdpekt3V05WVFk0dlpJWTd3VXUwUTVH?=
 =?utf-8?Q?bAnAHxtzbBoeuCMKTV288oW/ZSJ3Ye7ZCoZqo+W?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1837
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1b3bab4-c5ca-4b8c-282e-08d90624d2c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jB3SXKfPm+owOHwQCEouMOg2LxjyMeiQCVJHfkFIlEXf+K3xN9GwPBRKNYdy+6RXbCFR95tsJtKoI7aRAWhw9zYk6C1ol/q0rSuOL1/DgjWYmIC7DYhvsFqH0VXPxUemdjHw9m02603KY+P63o+t2QEfvDWJ9eDv62JVcBERjfzUs/7q/SnZ7nX3lmidrdiS/6V/rb+apY+1VIPw7fndODATUiSbzgmUBc/NNluYGr+9sOgtTfZcuwDy7bQCSANW2A38CYkaBMiBmTn+Rh8d3Z5ghIsGY26L4TksXdQcVGzQZGvoVoyuGaQrk3cX3Rfo7Rc5B+zun1LXehwgYYgQye056+yFo1LxLD/zWt4l/x8y+IBwGDTdx7FwqAM6QdELXWActXOA+DnynkUZW5TNOXymSVinSDZ7rorVJ5EwMdcbYrgVnfAelF+HDihpCwbZinp6OrXqB902Cn3cqgWMyV9zQj3lI0M4wF3FqeEc+DFkUDeZ6PA/0Dbf5Mcz66EXste4+TX/35DTn3tlh58ZTmR3okgtmSv+uw/6hSg/1YdljTFi1i6lYNyQhT7tRjHSkZWCEKhHLj5elgbPd6wny9C7E+NUNTLlmFWTQIMh+pRo5b5E4LtUD2Nfhv2RLU1NPVrXH5JaGr3yc0ZnVn6VySJeImXdR/NmHVLAx0r853cuRkzHNrAyjvnjX41Z0h7v
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(36840700001)(46966006)(4326008)(316002)(478600001)(36860700001)(6862004)(47076005)(82740400003)(70586007)(956004)(6486002)(356005)(2906002)(186003)(44832011)(2616005)(8676002)(82310400003)(16526019)(81166007)(83380400001)(36756003)(5660300002)(26005)(8936002)(70206006)(6666004)(336012)(53546011)(34020700004)(33656002)(86362001)(54906003)(7696005)(107886003)(66574015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 06:55:57.1804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d83854-f99f-4115-b076-08d90624d8a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4446



> On 23 Apr 2021, at 06:40, Juergen Gross <jgross@suse.com> wrote:
>=20
> Commit d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
> introduced an error in gntdev_mmap(): in case the call of
> mmu_interval_notifier_insert_locked() fails the exit path should not
> call mmu_interval_notifier_remove(), as this might result in NULL
> dereferences.
>=20
> One reason for failure is e.g. a signal pending for the running
> process.
>=20
> Fixes: d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> drivers/xen/gntdev.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index f01d58c7a042..a3e7be96527d 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -1017,8 +1017,10 @@ static int gntdev_mmap(struct file *flip, struct v=
m_area_struct *vma)
> 		err =3D mmu_interval_notifier_insert_locked(
> 			&map->notifier, vma->vm_mm, vma->vm_start,
> 			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
> -		if (err)
> +		if (err) {
> +			map->vma =3D NULL;
> 			goto out_unlock_put;
> +		}
> 	}
> 	mutex_unlock(&priv->lock);
>=20
> --=20
> 2.26.2
>=20
>=20

Hi Juergen,

I can see from the code that there is another path to out_unlock_put label =
some lines before:

        [=E2=80=A6]
        vma->vm_private_data =3D map;
	if (map->flags) {
		if ((vma->vm_flags & VM_WRITE) &&
				(map->flags & GNTMAP_readonly))
			goto out_unlock_put;
	} else {
		map->flags =3D GNTMAP_host_map;
		if (!(vma->vm_flags & VM_WRITE))
			map->flags |=3D GNTMAP_readonly;
	}
        [=E2=80=A6]

Can be the case that use_ptemod is !=3D 0 also for that path?

Cheers,
Luca=

