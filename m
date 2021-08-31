Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF6F3FC899
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175768.320111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43k-0008MD-1V; Tue, 31 Aug 2021 13:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175768.320111; Tue, 31 Aug 2021 13:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43j-0008Ji-TQ; Tue, 31 Aug 2021 13:44:15 +0000
Received: by outflank-mailman (input) for mailman id 175768;
 Tue, 31 Aug 2021 13:44:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Zp=NW=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mL43i-0008IS-1G
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:44:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3423c8e1-37b6-4885-870a-bf8d8e9f100c;
 Tue, 31 Aug 2021 13:44:12 +0000 (UTC)
Received: from PR0P264CA0148.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::16)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 13:44:10 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1b:cafe::ae) by PR0P264CA0148.outlook.office365.com
 (2603:10a6:100:1b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Tue, 31 Aug 2021 13:44:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 13:44:09 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Tue, 31 Aug 2021 13:44:08 +0000
Received: from 75c49e412a17.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BD1E456-6538-460A-9CCA-A217897E0247.1; 
 Tue, 31 Aug 2021 13:44:02 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75c49e412a17.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 13:44:02 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5337.eurprd08.prod.outlook.com (2603:10a6:10:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 13:44:01 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:44:00 +0000
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
X-Inumbo-ID: 3423c8e1-37b6-4885-870a-bf8d8e9f100c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAb7vEZQADkHgIoesvFIBFZlYv5WAe5H1iBu4IqQCYA=;
 b=QDgTZX8uAlB30/r1OnIhObg8GOb0vixFCN4yX6gfijiRh/k+GmICUhYGQ2Uos0AlZiK5E24yuk+BpgwmC02ej+HlkXMSuS6em0BltabREavhdgAss4GC2KLYssmn4OKYBSAycHEUvcOj9Whdd4MR2voL1fVjapkBdJHPYn0wLRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fByrg1QmjyrREVx5DIbgLyyua3NDWthQF+6y8CDnBDWE6YhNOHH2GhjtNLsVvYQttr8zhqFLCBznHoCw5GFht64A59PXaf/vxDgLSNybEPjenaLgjvNlbPIQSqChSj9txEamaQMQUgdZiggnfhyWtGTfmJa1Ela4Sfmqq3Gh8Nti6ZJ4lqX4wr2TOgMCW0z5qFzD+qcrmuCEEB11xsWLv5fbKbhCpjmlhMfuD5Xh4Etosy/uthM0tx0e1G7m5q279LAvgkEy6H0Y9FNj8Fl5H5N+zlqXZU698jIUGhMjZvOjq4C3KGidG19LBg+ZioX0hBTJusDqngsRDfuv1JB0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAb7vEZQADkHgIoesvFIBFZlYv5WAe5H1iBu4IqQCYA=;
 b=nKdQmrS1Tnz4JdKskZcjzFMLGlQtLoCyHNpkfwHgnOnnU849G8y//JvpktqNxlbOg8h5WUjRm9sEjDc5m696rliM+hvD55z0iVuJGICQb2JoVmQLUIUfc76bTBSegs0YIpQKJSDvyoUECAXdRumIWNugfOts6cDzxzti2gJt1zNWHuwakzKu3dfxSuNcPGBrxAjt0Y5Nxr5/s/HownjyrJlLmmNH4WWUq5hQhwrvIsUbFb5P9v8RQwyLl9Jwhve8exoc+CJfQFq+3h4RKcGmd7fmJyHgph52mzlZISbTCCUYzn7J8CpxN+uptdb8jMOZC1L5OOu4CUWK00t/XERAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAb7vEZQADkHgIoesvFIBFZlYv5WAe5H1iBu4IqQCYA=;
 b=QDgTZX8uAlB30/r1OnIhObg8GOb0vixFCN4yX6gfijiRh/k+GmICUhYGQ2Uos0AlZiK5E24yuk+BpgwmC02ej+HlkXMSuS6em0BltabREavhdgAss4GC2KLYssmn4OKYBSAycHEUvcOj9Whdd4MR2voL1fVjapkBdJHPYn0wLRQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to
 support NUMA switch in command line
Thread-Topic: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to
 support NUMA switch in command line
Thread-Index: AQHXjptVFJvPelB8mUqFa8hfwTS7pauM+LqAgADCsPA=
Date: Tue, 31 Aug 2021 13:44:00 +0000
Message-ID:
 <DB9PR08MB6857A867F19FA0AAD62B93169ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-40-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301852380.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108301852380.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1E8F73CEF9BC4C4AB63E95693C926DA2.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 46010cff-6494-47d3-5008-08d96c8568dd
x-ms-traffictypediagnostic: DB8PR08MB5337:|AM4PR0802MB2178:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB21785B4AEA725E2B348CD4569ECC9@AM4PR0802MB2178.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Dp4UsTZHf2UA/1qiCZpg8fcbtc3FLLl4y+YsMYWghbFJyltSPLEZs9wDL6Rds3pGrg79XfbSq3rI3hrGXuIlG4hpoE37E4SpQMALuscc2A26Ur+kO1NAoaMpqSJLiwFPT2PgkyUbUe6ONeMCIaxm/fQPrX+rE3zCw87Mm8zS3JoWVSb6oeSczt28ynEMGGIL87OaDA2x2JyO32tqkZS+cbcc30pc5deG6vDFXHBxJFmSTfgEv182xtx1QmOEMttWOdw5RGsB6Sgj245nXZOFMxo3g7PpXFt9VF0LLuBsAZOcABz4vMRB9cBU4Xy5KvXwp6DsFMeFfsDjv3ixRP/JpA8Vv8uB3+qZ5IpFX2RaJ+qRKujUuBG42jrwOUXpAB2cLvq+LF2LhnHpv9+C6tUV4OoVAJ1/2NfRrDomImqCwIo3XPBwr1nYyLUwbJsCoGZD6+l7vZawRTGP39oisvX4BZdVpAPaOxUCh91VKCegcoPMN96MkD8uYY8A+C32BV1LUaU6VJ7cr0RWu7dV35cWLUDWlqwQpK7Cf0Y/XniUWAfS1UbotWkGxjDv9pbFqFBYBr1Uty6jet8Y12Et/DTBr/nJzlT1idz9SKngz+L92J3AKrBMUyWcSv08KOFzWsD76SqIy94KguJV7CeJhaQ8maxFTBPpCJcE5B7XWBNZvEQKfT/QcdG/m4Uz4m9dAKY6YCso0CzUWyHrLlSR+0puhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(86362001)(4326008)(5660300002)(54906003)(66446008)(53546011)(66946007)(7696005)(38100700002)(66476007)(33656002)(71200400001)(66556008)(76116006)(64756008)(26005)(55016002)(8936002)(9686003)(8676002)(6506007)(186003)(6916009)(478600001)(52536014)(2906002)(122000001)(316002)(83380400001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?WEFrcWVWTlV3M1cvS0toVGtDNEJ6TWFwZzNuOHlSYnI1bWZLMHo3Ui9yV3M2?=
 =?gb2312?B?bFlmMzdjVGpYellNU3h1YlNOMm0wc0ovU2pyNy9tenNVTWJTNXliRTlVVHVh?=
 =?gb2312?B?YnpSYmI1bnQ0ZGVpTHU3Ny9xQk9MRFZodUFNYkFEOEtiendjMzhWTkdwZis1?=
 =?gb2312?B?QkhRZXJFRzkvWVB1eEZGeUhzOFZVdXRQR3VwNEFnZjRzby9MZVByU0lIS0FY?=
 =?gb2312?B?ZUtPZTFxREsrQTZvMHRsNm5WZUlIWGFnN3R6bWRNRVRYWXhadjdna1Bad3Vv?=
 =?gb2312?B?ZlQzNkFPeTczQ3FDTDdoNDJRZGlHQUZXZU1RTUc1bGg1czBCRUhFN0k4cldQ?=
 =?gb2312?B?VklWdG10eDFid1RBejJDNjRORnExdHVMbnh2Y2Z3RG1YVTdyemp4Q0hITFJ2?=
 =?gb2312?B?ODFaaHhJSzJGMUEyM2NQMnR0cjBzeFQ0VWRJUkMzNXUxVXdZc0YxMlVoSUd1?=
 =?gb2312?B?bDVGTWVLZDZuaTk4TFRiTkJXcTBqN0llOWw1ZncyV1JuV3lQc25jMThkT3dw?=
 =?gb2312?B?MGxWWTJ2czNWT2o5dWNVTldldUNIVWxMS2RRSXNTRlQvQ3IrVjZ5cVpmS0g3?=
 =?gb2312?B?RUdWUDE5Z3R0ZlQ4TElNTDRYK1ZuZnV6Z2J0QUszWnhsbE81UWZqSXRwSitS?=
 =?gb2312?B?bS9BRVpFZFlEVFhoVUNOS1M0eXFuS2ZqQ2ZialhhdWhKTkljd2FxK1VHTWM3?=
 =?gb2312?B?VE1WcUVySnhsTWZhZkFyUGw4bTdIb2hNSyt2OW1WbkpzRmR2amNhNGhwRXB2?=
 =?gb2312?B?K0cwUktnT04zeE93QUJyRFI2bWxtS2s3cGh5YjJWOTFiMVBxTHVUVFVaNEpP?=
 =?gb2312?B?T2NEdXo3Y1FaRU0weU5ES1VNWDJmMjB1Qkovd0ZwYUlZVHkvMURlblJGSXJX?=
 =?gb2312?B?THpGc1pKOS9pVHh1UGhFYUlGTUNDM2tsZVhKdHNocExwbXZMTHBGTG1lejh0?=
 =?gb2312?B?WUVXUlE3UGYyVnVZWkl1NWhpdnNCdEFGTkZXM3Yxekt5UGVFQ2FUalY2NWFL?=
 =?gb2312?B?bzFJY2l5SFcxNjFNRjV5QVVvcnhpOFlBL2t5MTJCRmw2QXBCYU9ZSGN4NWZV?=
 =?gb2312?B?Z2JON2ZoeGtTM2Q1aU9mOGJBY1FYMVUrbWJxTVhhZmZ5TExlditBUTNRNWV2?=
 =?gb2312?B?MDJTd2JMYldzbzZJZHFXNFRrdFhMSWNYaFJBeWVhMmhsL0Iwa1k1eFFkaktP?=
 =?gb2312?B?cEFhaGk5WmE3bFFxU1QwNEZmWjE4bENmWDBQV0FZL2NtUzJtaFJLM0NrdVFz?=
 =?gb2312?B?empvdlN6S3Z4K2t0SjZaSlUzYTJMaU5MYVVvR2U2bFFuTlEzV3J0a0VVM2oz?=
 =?gb2312?B?VkFSSy9adzYrbzJFenJneDRTU3VzWUxxZi9GU2pNeTZNNnJRNGJ5NkF5K3BO?=
 =?gb2312?B?SUFrUHZiaTVlRFkveW0yT0ZXckFQUlhLZnRxblBsSkd4aXRoNFhXcjZpR2lS?=
 =?gb2312?B?S1VPbHRxalJQVTNLQllzQjRkNTNkK1FFaXg5M3FiZnB0NWh5OVhtM2JkTTh4?=
 =?gb2312?B?OEZkSXNaUVZKL0M1SnNCdUZXa2pxRDJsOEpNK0dPNUxvMHlaRUJFL0tUanBy?=
 =?gb2312?B?MFljQUxKWkxLbDJzV1FNUHJrbS9HaUVBTytTYnJiVmUwUE8yeWxyOE9qNlBy?=
 =?gb2312?B?NS9ZUTlZLzJvU1JSNXVwYjl5U29udFI0aWFsa2ZUVFJvd0NhN3V1Z1ZIQXIx?=
 =?gb2312?B?MU5ab3ZtQ1NuVERxQ3A3cFBqN1kvWENKMnUraWo4N3labG9aS3l6QWNwOFBK?=
 =?gb2312?Q?4PhuIoQXwxOnDEWuqTAurtHFWZPZ1lDjQZ7UZbS?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b4c1bd3-7c8c-4aee-e464-08d96c8563c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hPoNLdvvfpgHnkafjJ/MLNuWMya9A3D58GA5/87mxXPBC46TXgjDz0iZ/ho11ERSyORVGEMzfXYl2tSYrRDfUMP63PAoHSLavjY3aY9c2wd/71mX29V0EgzjUO4QXH5nhUWa9g2owjmT4/uOpfeMI0Pu2OZEyyCP13Nc3RwwcXIqZj6PIyUb2YwaaudlunlME0HjAiANdCK7/loPigIeKbiEhu1kltwhOU4LbQZWFBl4eMqyfteWxeHi5RGJS31HLX0j++ROrOBAkqLfwAQEVakD5UwOxgHjP9cpJTz6fyZ/0Bu7mwHRBbKBfj6dq4ozGQbzcxpHKKJ1x6N63dXrqgAOBLBbifbKjxF0ZWY5Mmlo8ZSHaDSv9ykcr1GnYTv+wHZSgYyHJOnyUjsCUO05/4y/gp7/a9GI/a3KefEHzVkHe4M0aUzceuYHj9jIBKMJ+Q2STml8b49muriF8G2IxgEZwdvpM34e69lsn766WDZVq8I2QKFiYkiynYO6TE3fWOXm0rlmQKvn/zhzC8fMBHuLmuA3y/3aNAq42vVEaWJnxd2eg/bGfkHhp2vX6qHXqzLWvFiffT3VzbAOYm/UfB2Bizg9dsrZl0tR4ihiN/XoKW+oncoKLiSxKCBPOv2dwjRdlNSKmlEZVneSCLkbY+wcqKttGoMWQSK4PlkbrwhySPjS5LGynDBN2fqTnu3GpGXBcNbjM+QurqUIh4gP7A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(36840700001)(46966006)(54906003)(356005)(82310400003)(36860700001)(316002)(47076005)(33656002)(26005)(5660300002)(7696005)(83380400001)(4326008)(8676002)(52536014)(6862004)(6506007)(81166007)(55016002)(336012)(70586007)(86362001)(53546011)(70206006)(2906002)(9686003)(8936002)(478600001)(82740400003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:44:09.4342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46010cff-6494-47d3-5008-08d96c8568dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjMxyNUgOTo1Mw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzkvNDBd
IHhlbi94ODY6IG1vdmUgbnVtYV9zZXR1cCB0byBjb21tb24gdG8NCj4gc3VwcG9ydCBOVU1BIHN3
aXRjaCBpbiBjb21tYW5kIGxpbmUNCj4gDQo+IE9uIFdlZCwgMTEgQXVnIDIwMjEsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+IFhlbiB4ODYgaGFzIGNyZWF0ZWQgYSBjb21tYW5kIGxpbmUgcGFyYW1ldGVy
ICJudW1hIiBhcyBOVU1BIHN3aXRjaCBmb3INCj4gPiB1c2VyIHRvIHR1cm4gb24vb2ZmIE5VTUEu
IEFzIGRldmljZSB0cmVlIGJhc2VkIE5VTUEgaGFzIGJlZW4gZW5hYmxlZA0KPiA+IGZvciBBcm0s
IHRoaXMgcGFyYW1ldGVyIGNhbiBiZSByZXVzZWQgYnkgQXJtLiBTbyBpbiB0aGlzIHBhdGNoLCB3
ZSBtb3ZlDQo+ID4gdGhpcyBwYXJhbWV0ZXIgdG8gY29tbW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNo
L3g4Ni9udW1hLmMgICAgfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gIHhlbi9jb21tb24vbnVtYS5jICAgICAgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPiA+ICB4ZW4vaW5jbHVkZS94ZW4vbnVtYS5oIHwgIDEgLQ0KPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9udW1hLmMgYi94ZW4vYXJjaC94ODYvbnVtYS5jDQo+
ID4gaW5kZXggOGI0M2JlNGFhNy4uMzgwZDhlZDZmZCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJj
aC94ODYvbnVtYS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L251bWEuYw0KPiA+IEBAIC0xMSw3
ICsxMSw2IEBADQo+ID4gICNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPiAgI2luY2x1ZGUg
PHhlbi9udW1hLmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPg0KPiA+IC0jaW5j
bHVkZSA8eGVuL3BhcmFtLmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vdGltZS5oPg0KPiA+ICAjaW5j
bHVkZSA8eGVuL3NtcC5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL3Bmbi5oPg0KPiA+IEBAIC0xOSw5
ICsxOCw2IEBADQo+ID4gICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4gPiAgI2luY2x1ZGUgPHhl
bi9zb2Z0aXJxLmg+DQo+ID4NCj4gPiAtc3RhdGljIGludCBudW1hX3NldHVwKGNvbnN0IGNoYXIg
KnMpOw0KPiA+IC1jdXN0b21fcGFyYW0oIm51bWEiLCBudW1hX3NldHVwKTsNCj4gPiAtDQo+ID4g
ICNpZm5kZWYgRHByaW50aw0KPiA+ICAjZGVmaW5lIERwcmludGsoeC4uLikNCj4gPiAgI2VuZGlm
DQo+ID4gQEAgLTUwLDM1ICs0Niw2IEBAIHZvaWQgbnVtYV9zZXRfbm9kZShpbnQgY3B1LCBub2Rl
aWRfdCBub2RlKQ0KPiA+ICAgICAgY3B1X3RvX25vZGVbY3B1XSA9IG5vZGU7DQo+ID4gIH0NCj4g
Pg0KPiA+IC0vKiBbbnVtYT1vZmZdICovDQo+ID4gLXN0YXRpYyBfX2luaXQgaW50IG51bWFfc2V0
dXAoY29uc3QgY2hhciAqb3B0KQ0KPiA+IC17DQo+ID4gLSAgICBpZiAoICFzdHJuY21wKG9wdCwi
b2ZmIiwzKSApDQo+ID4gLSAgICAgICAgbnVtYV9vZmYgPSB0cnVlOw0KPiA+IC0gICAgZWxzZSBp
ZiAoICFzdHJuY21wKG9wdCwib24iLDIpICkNCj4gPiAtICAgICAgICBudW1hX29mZiA9IGZhbHNl
Ow0KPiA+IC0jaWZkZWYgQ09ORklHX05VTUFfRU1VDQo+ID4gLSAgICBlbHNlIGlmICggIXN0cm5j
bXAob3B0LCAiZmFrZT0iLCA1KSApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgbnVtYV9vZmYg
PSBmYWxzZTsNCj4gPiAtICAgICAgICBudW1hX2Zha2UgPSBzaW1wbGVfc3RydG91bChvcHQrNSxO
VUxMLDApOw0KPiA+IC0gICAgICAgIGlmICggbnVtYV9mYWtlID49IE1BWF9OVU1OT0RFUyApDQo+
ID4gLSAgICAgICAgICAgIG51bWFfZmFrZSA9IE1BWF9OVU1OT0RFUzsNCj4gPiAtICAgIH0NCj4g
PiAtI2VuZGlmDQo+ID4gLSNpZmRlZiBDT05GSUdfQUNQSV9OVU1BDQo+ID4gLSAgICBlbHNlIGlm
ICggIXN0cm5jbXAob3B0LCJub2FjcGkiLDYpICkNCj4gPiAtICAgIHsNCj4gPiAtICAgICAgICBu
dW1hX29mZiA9IGZhbHNlOw0KPiA+IC0gICAgICAgIGFjcGlfbnVtYSA9IC0xOw0KPiA+IC0gICAg
fQ0KPiA+IC0jZW5kaWYNCj4gPiAtICAgIGVsc2UNCj4gPiAtICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gPiAtDQo+ID4gLSAgICByZXR1cm4gMDsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAgLyoNCj4g
PiAgICogU2V0dXAgZWFybHkgY3B1X3RvX25vZGUuDQo+ID4gICAqDQo+ID4gQEAgLTI4Nyw0ICsy
NTQsMyBAQCBzdGF0aWMgX19pbml0IGludCByZWdpc3Rlcl9udW1hX3RyaWdnZXIodm9pZCkNCj4g
PiAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4gIF9faW5pdGNhbGwocmVnaXN0ZXJfbnVtYV90
cmlnZ2VyKTsNCj4gPiAtDQo+IA0KPiBzcHVyaW91cyBjaGFuZ2UNCg0KZ290IGl0Lg0K

