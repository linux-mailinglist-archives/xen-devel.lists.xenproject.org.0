Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5334372AAF
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122356.230765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldunz-0000eQ-QE; Tue, 04 May 2021 13:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122356.230765; Tue, 04 May 2021 13:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldunz-0000dv-MP; Tue, 04 May 2021 13:09:39 +0000
Received: by outflank-mailman (input) for mailman id 122356;
 Tue, 04 May 2021 13:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8884=J7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ldunx-0000dm-RV
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:09:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b324017d-e981-45fe-be44-863ad137db14;
 Tue, 04 May 2021 13:09:35 +0000 (UTC)
Received: from AM6PR0502CA0068.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::45) by AM0PR08MB3107.eurprd08.prod.outlook.com
 (2603:10a6:208:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 13:09:33 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::c4) by AM6PR0502CA0068.outlook.office365.com
 (2603:10a6:20b:56::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Tue, 4 May 2021 13:09:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 13:09:33 +0000
Received: ("Tessian outbound aff50003470c:v91");
 Tue, 04 May 2021 13:09:32 +0000
Received: from a858f6b1c09d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DECB788A-BE9A-4E67-BD91-207C6C5325E9.1; 
 Tue, 04 May 2021 13:09:21 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a858f6b1c09d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 May 2021 13:09:21 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB5520.eurprd08.prod.outlook.com (2603:10a6:803:135::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 13:09:17 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 13:09:16 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0313.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:197::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.43 via Frontend Transport; Tue, 4 May 2021 13:09:15 +0000
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
X-Inumbo-ID: b324017d-e981-45fe-be44-863ad137db14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8dFEG5o76gj/8Zyki+POmpxp3gzwAy7gksoi/WRfFQ=;
 b=McDgnugKVhUymVghASUQJPfcM24ECMhyLCNLYYB+er5RGJT/VHC8xlzJUasGzBtY8qBQN4MUe6r75JJqvIERhUNbb+bKnqDJy++Y5MwsSAbvQnrxZw+vt06pm2pPp8Le7EBVBwHsB18WJ2EW+a8iNYJAuK3gI4aS+eqeqsmMhT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a59e3e2be832c0ce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIYhVptjxI3wrwT8OGi6ofFr7U3VQxfREcX+Zs22NNiSe4QHzLkp3ZK2HSmgHgGCBPuzDxurMj0C/yrTE8ztCGMVOgdZCcwifWAasK4XTRu+gJFTKcMxSVhjirkK/OO4B/4ia8ZcW/oMqxnZzFMcm4aEBmZxA48AagqfswLbLR+1fUBYbf8y3qii/9p6PLgFVj6gUDGwJuWICulDxT1QoKN1J7uLLWtIs1dGhHMttoe8cda31Rz/BmFjVp7vRr4CKIWNfP+HagKNs244Z/kRLk8ZGyZ8Ywe2aG7z+LaLM48JNeYqsk8sQgfXjykHqjI/l7xhu3uj1jJR8UY57AOAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8dFEG5o76gj/8Zyki+POmpxp3gzwAy7gksoi/WRfFQ=;
 b=TdbeRfAerBSyDWQ3NhWGXRWZOg6LkjXOOPOMAvi1d755KMkl135hCZDP2vbuvPT8/z7WiJkVCnhaOJO/3xRqasiUYt6O95yhJc8xh7GXBPeVKJGspCw28V1eFYgfN+LZezTTQWv0/U+SytZwAraLH8i+IYP+6+rty40499wnfTr2jWQTbqMUI7KGHzA11SfRS3hdA5uYSOnke0PZZORaAYTAGSLy2ilx3dOFiT/p+/c8cyEARsEtxAc3TOcrrIq0Oj9GGZafoZYJwOXKarp95GQ4CBL6SFsP7PJZLG4JxWfhSzGDiUhDn5iZ4BMg+qDyZ7LlG8m3TAsnk7kRHBDqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8dFEG5o76gj/8Zyki+POmpxp3gzwAy7gksoi/WRfFQ=;
 b=McDgnugKVhUymVghASUQJPfcM24ECMhyLCNLYYB+er5RGJT/VHC8xlzJUasGzBtY8qBQN4MUe6r75JJqvIERhUNbb+bKnqDJy++Y5MwsSAbvQnrxZw+vt06pm2pPp8Le7EBVBwHsB18WJ2EW+a8iNYJAuK3gI4aS+eqeqsmMhT4=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <37e5b461-40fe-ac78-59b9-033ff8cdc6d1@suse.com>
Date: Tue, 4 May 2021 14:09:09 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1853929B-AC45-42AF-8FE4-7B23C700B2E2@arm.com>
References: <20210504094606.7125-1-luca.fancellu@arm.com>
 <20210504094606.7125-4-luca.fancellu@arm.com>
 <37e5b461-40fe-ac78-59b9-033ff8cdc6d1@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0313.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::12) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dca6f1c-1aa6-44e4-5953-08d90efddc17
X-MS-TrafficTypeDiagnostic: VI1PR08MB5520:|AM0PR08MB3107:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3107E4360815A6DA0D858C4EE45A9@AM0PR08MB3107.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wuw+d+3Dp3pJXqrslqEDLCs9k55bqqMxcn4iJu9ZESPPmcp/VTY6VITjrWTn2JAPVrKVljVmJVK3GTPKVd6nSD6iNMqb/g7QeBLZNfUWBMwBw18Z2jJ86ECUbSYIpCAS9tagiSwA20H2I0FCaIiDzRpN7rUS4peQbzd+5Tk3zhcxpL1Q8/KRTBTQdbD1D0QvRhsBN36+o1MSkWRi4P7vFIYWHkJrU0YmEv4GnMa6uZCO2q1K+abim7RcTRskNfoL81C731D8EeTo1Wzr27aFqW7a14Fv/e4IY9ATcRzHQv3S+8Ca5LT6shDlvh9oHpPKwxHTzz/JgjZ1igm4AksZFvkZ3Sqk0d0q0kOAakSVDzuVPw2tmkC/FQacMMryYXtHz0Aapps9tR8QSnGOvVGA9ae7sOd5LdtJPjxLoDqV9JPBxkPUqVDe2aTwAPgGMfAPdMBT6I9Fmn4hvRUY8wQdiw5TsJWDieYu3LzrapXHV32w/VxZbjpJ14F4sIMRd99Flmw9NKkN9FeJli3uezaUF6S4SKX1zH0SigffrKKojG7XsfWCJ1ADuuCDuQGlBZKQqE2PVI6uWTR7YKEbGkaLC+wVEuUxijuzbHDPDPFqdwp/SeCEhXBjJ2fj9FVaiLg8WgkRFDZ62YfQWSnpztoLr+yh6lTLIA9SZJqETJy7XBYm/tolgG6uASjmNgmcqrhf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(478600001)(54906003)(2616005)(4744005)(44832011)(86362001)(316002)(8936002)(2906002)(8676002)(5660300002)(52116002)(6506007)(956004)(4326008)(26005)(6486002)(16526019)(66476007)(66946007)(6916009)(66556008)(38100700002)(38350700002)(36756003)(33656002)(186003)(6512007)(6666004)(53546011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?dSsweldpTVorclY3bkYwOS9hbDlVajZxaTNZR08wRnRVYUpPRXJQWTFUY2Zr?=
 =?utf-8?B?UG0rdEdEK3JwRzh2OGc4RFRKc1VYWUdKVFlWWEFTSjRpcnJBV3JuU2hwdVhP?=
 =?utf-8?B?SXNZaXcreDAxb1pwVEVtT2FUeGhjd3AwcXdDaFhNcGhGK1VJVzV2bTBRS2FD?=
 =?utf-8?B?Wk0wclcybXJPMTMwV05vTVZ3WkF3alFzVFp0bld3NXRNR2RPbStnd0hHV3p3?=
 =?utf-8?B?cmRtSGVXbXFuWXRiRDdIdlYxVWtLWnhsM1VWa1NGclgzbTJNbXhQTXd5a1Ar?=
 =?utf-8?B?b2d5ZEtkRlJHNlMyUncxMHhPYUdQdEJJQm5ISzNjWUErdGNadkRtU2UrMmVu?=
 =?utf-8?B?TGpkK21ZZGdpQXlrUVVtNG1JWTV3VzBDUWFwcGt0QUdsY2hyRHJQRkNjcEVn?=
 =?utf-8?B?V2NFb3ZpTjFWMVZMR0FzVDhabk8zVW9IUmVoS3NNQ28vTFppNFpIL2pqTGpD?=
 =?utf-8?B?T1VzdzZVcm5EMG82VkQreEtHWGFDamUzZzhOSTVGdHFEaGpQUm5lWVdlRmI0?=
 =?utf-8?B?U1JJUmRyV1hMSGNSRDFqM0lndVp3dTMxOWpBVFlGRktQZkZpZkNXWmRxbDJ3?=
 =?utf-8?B?WHZSN3kxL1Y1V0VMY2o0azFSck5qejN2bTJ6Q0YwOG9MQU4ycUM5b2tHRE9E?=
 =?utf-8?B?aTJmbm1mRWFaWHVnOFhnaXdBWGVnNGxFcVRmR0dORi9Cb2JrOGk4LzZZNFJJ?=
 =?utf-8?B?OU5HQmhmeGxFdXdGRE5vYW1aQUpyOFVqckw1YzV3NkhXY1VEaERBNGF1STdz?=
 =?utf-8?B?K1VGNHk3cWdWMWxERjd4cW8vL3ZTOHhULzlHeVZxMDQ0bDBjN1Y0QkZhdGZX?=
 =?utf-8?B?Z3dvdERjM25XMU9SL29OUU1IYjhsK3N0bVJUK3dTL2I4REtJeGcyWC9oQVNX?=
 =?utf-8?B?L1FoNHRBdmNrT1V5dytSVzQ1ZDRlRFR5amtDQ1N4UCtNaWdHSDVjZjlmbFNr?=
 =?utf-8?B?UHZZelU4bVZrcExJTVQzeHNzdFJFMEdOandkVzhwRSswWW1zb05lYytQcENu?=
 =?utf-8?B?TkJHQmM5cDRWb0xuR1VMdEhDbzIzdk0ydlpSMmxtM0h6TU5PSlV3amRHdkhC?=
 =?utf-8?B?bXYyZDJZaE5uVXF2SjU2aFk2RjJMcVQ1ZnUrSHgvWDNzcHgzcjcyZFhZS2JN?=
 =?utf-8?B?M3RCckFFZ0ZLZkloZnZ2Ym5VTkI0Z1hOd0I2aFVvaUdTVkdVZE9BMmo5YnJE?=
 =?utf-8?B?c2dRUjgyeXNMTW1HMTFVc0YwUWRTdW4zT3VadUtUOENrZzBMaFN3TVNqQlZD?=
 =?utf-8?B?QkozZjY3R0Y2ZzdhT3J2MHhzYno4em1KekVoUFZQYnhScklMaithVitKUFVy?=
 =?utf-8?B?V1B5ZElhdVpyWlhCKzJKa2FwYkJFa3ZZSC93L2JGQ2hBTDJTK1M1R1liUHdZ?=
 =?utf-8?B?S1NOUkY2VnhPR2lTNlpaUHdJZEJHRmd6UVVOdU5IYWtEZ01JaXpKckxPaFZN?=
 =?utf-8?B?cThLdWliWVhJNDhsbGlrM01JaTRPdnlWU2hBWEtXVHhiL1c1RytJblQ1cWhQ?=
 =?utf-8?B?eTRVdnpVeStkaGdNdTdYbUZDREJVcFFmUFhXaUpHck9WYllWSG1ObEh3K1JU?=
 =?utf-8?B?dmdGN3IyZUFvWmdtT1FqQjdiNldOSnVvY0krc3MwMm81VVpmNWN6ZU5SRmxj?=
 =?utf-8?B?SzNuZHRpK3ZPaFdMQVZCb3hCTGJzZUJjTjRONjhoeDEyRFFHUlVQN2NLbmJK?=
 =?utf-8?B?OGRsUlMzMnoyeVZKV1Z2RE5xdmgzQ1R5V0JjQ0xXODBJSDlOZ04rbFhia001?=
 =?utf-8?Q?IT+95+MedffNm8ryRRkOb06EqwfM2rn/ANH1A8m?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d08ae94f-b275-4249-7ac5-08d90efdd1df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Q9IRSx55+JUSHqMoZHy3QpGm5p8VgCIMv8ycnKWoqC4dLvQtpRwe4WTDYDwdZMyCPyRM6T4nupFuMdfJN/tXCiXumUKAudKQEX3eA9Dw4r/8Sjiv7AH69sJ4pune4LvxgbJuBazQ99LXqsmFFd+VhOiTFQfoQRwxbbgYKiytX4HdGHUa2t48kOG3M2tzRZ4HYVDiKf5z60J4PowZliKFCN9lPFV5UdMR+NPVWvipf1/GIuDIrxVmSzBNifM0EJBe7j+Co41A+ORieLN3+KnFGbrctlDVNEgb/RiUpEPtKu/o925Fe4NnYBjzCH0WtjTq3YmzWpJX7B04yHyyRsBsdPXTwQFS3Qjyn2ZCU/Z/pLmVFkqF7+zfyBvUTSHVBCw3VAvCrymHuGD4Pnk/beie0cCqKopss7qn5scpc1Vq1OAHG19OBzuX7jTQG4gQq9/2XkezzOaIZkpOedokfvhebx1Z+b1wLkO53B+WixdQ0HLoQtF2enYHTNIT6p88VzOTeUBgv/8WODDpePeM2uJTwBrF7Qu9raFFyYwELvL2GxeLsrylQ6Cn/qG3bBFhtfsk2bbPB33eWDv6vh5i4SNHrwn0ipjD3xcg5AwGpYaGmCFkheCESWLpz5d3iMZFsnpuC7WtzoujwxrjBs5iTfkqhGyoEkmcTFmTn81vhXZHWs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39850400004)(36840700001)(46966006)(4744005)(2906002)(33656002)(44832011)(6512007)(6486002)(8676002)(4326008)(70206006)(70586007)(82740400003)(47076005)(316002)(8936002)(86362001)(53546011)(6506007)(36860700001)(5660300002)(16526019)(186003)(81166007)(36756003)(356005)(6862004)(82310400003)(54906003)(478600001)(336012)(6666004)(2616005)(26005)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 13:09:33.0408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dca6f1c-1aa6-44e4-5953-08d90efddc17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3107



> On 4 May 2021, at 12:48, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.05.2021 11:46, Luca Fancellu wrote:
>> @@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>  * bytes to be copied.
>>  */
>>=20
>> -#define _GNTCOPY_source_gref      (0)
>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> -#define _GNTCOPY_dest_gref        (1)
>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>> -
>> struct gnttab_copy {
>>     /* IN parameters. */
>>     struct gnttab_copy_ptr {
>> @@ -471,6 +481,12 @@ struct gnttab_copy {
>>     /* OUT parameters. */
>>     int16_t       status;
>> };
>> +
>> +#define _GNTCOPY_source_gref      (0)
>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> +#define _GNTCOPY_dest_gref        (1)
>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>=20
> Didn't you say you agree with moving this back up some, next to the
> field using these?

Hi Jan,

My mistake! I=E2=80=99ll move it in the next patch, did you spot anything e=
lse I might have forgot of what we agreed?

Cheers,
Luca

>=20
> Jan


