Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF159DABA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 12:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391883.629900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRJb-0002Li-Pa; Tue, 23 Aug 2022 10:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391883.629900; Tue, 23 Aug 2022 10:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRJb-0002Jt-Kv; Tue, 23 Aug 2022 10:39:23 +0000
Received: by outflank-mailman (input) for mailman id 391883;
 Tue, 23 Aug 2022 10:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQRJa-0002Jn-LY
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 10:39:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f3d460-22cf-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 12:39:21 +0200 (CEST)
Received: from DB6PR0601CA0022.eurprd06.prod.outlook.com (2603:10a6:4:7b::32)
 by VE1PR08MB5152.eurprd08.prod.outlook.com (2603:10a6:803:109::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:39:17 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::ea) by DB6PR0601CA0022.outlook.office365.com
 (2603:10a6:4:7b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17 via Frontend
 Transport; Tue, 23 Aug 2022 10:39:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 10:39:16 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 23 Aug 2022 10:39:16 +0000
Received: from c31e74a7fedd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBC4D754-9B29-47EF-9D79-D4A02F68EAB3.1; 
 Tue, 23 Aug 2022 10:39:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c31e74a7fedd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 10:39:09 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 10:39:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 10:39:07 +0000
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
X-Inumbo-ID: d8f3d460-22cf-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IFDPfggZZVcMzKGwRGCe0nN2kEDHPc/2gFJg6a6H6EQEbCO9cAi/0+HTP+B84CXad3vlHUlDx081cUnp3cX1h/RZlTBAleddc3hJJOVKXKwz2MNYUIXDh1eDRzvpBxxBP7ouJ8ztEHhorENqZaq+KDgPzaoD+6+EgQTDWjfTOz7cPTYoZUGvPqMsEDlt+jmNFvizJuhXESeo5Z7h2HGO/jgWOe9sehgJhe/1LydmStbHKHTviDL+gXToTfqkVZMyrh2UXhJ/vLiwSOr6X42GddS517jJyGSgshPyil8MSAmfDuvXyeWR+3fC+JFBCTArNZQPcw19e6B42zwWykD/cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67ItMaRV6CnPRegcDgkzeYAkKcWeBdl9bfFATgdk+RA=;
 b=jSfJIiQPHp5FkH1Bri0iicPU6KjeONx7dM2MHoh1HSMMzIYqIokajP5Der3VouR3e+gvgZd4FszJ66aKX+IcT6sVP436mEwhOAEDrQbvBx0Op1d8Q0xRkt/E7sZKsp47/obS45xdNnbcONdU5RpLzHQ9q/0+IsEO7afXiKn2ZpzigNWrrWI6lwAKl9ab5nrhb/qAsQ/otvfOzpDeCbkq6GPV8RTrKKd8Va1UoRmLOMWLiSrXN00jTzYkMl4wrlH+qtIXc8rAbHspnzm5ZOkBGeQsD+YUP8vfzVbmz/oR+fA5i9gskkwT1Ein0rMhv9anZTat3yMj5E/MAsSw8coygw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67ItMaRV6CnPRegcDgkzeYAkKcWeBdl9bfFATgdk+RA=;
 b=wqJVEruAZri+C8UXEliAUZeoqlqqy909RJlWdJACw7zTSL5o1cUFD19N/UslkzucfUu8S+4AZ9dMe2X3g6ylWbnAUsp2kiqLY8/F7SwU3ggezA4Q2JdjctpctYGkfgpMiMoQiOvliWMW2nl20rp7I4E4eMyPgKUinAK12jVeLBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc99bb621771d314
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSY8TBLQyradO6tQz5PUTvlng2k+UHKuebZzNeG2RXFwRHwwjr7EVH/lGkw+PlozAX83RuRleExjloFXob6ae+WvDeQSwXwYFmFKcDLhP7EYbG7Mx4u2rJs76Ylroju5J0rOLNzU/JuLLMh8RLk9+HigEJyqCvfXP2X9YDZlkzrRQWH7f/dfQUojzx6/BjTETKYaee4GBi6wAlBg0VgQ9A54dIaXz+OvJGo2YA4pKj6+75TCO8hf7fsiKw8BV5SsX/d/6CiNDhlw8Mb1Jt5FnRcHZ5gVCivhrUNXNyblQ2D2oaGvOcvWrxnG3aQWRKJgHSYTJ+ITJG1BGr0wt2QPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67ItMaRV6CnPRegcDgkzeYAkKcWeBdl9bfFATgdk+RA=;
 b=G0arPPZ6P+x1D58c1zpJ27KQYPl5lvHn46sYCsB3KnSwjNo5PLf+OKhRY6RWJh9GYpmpEovPBFsuMpsH560FTgrdaHuGloOISqNGC+wsmOKEknz+K5AnpvqSwwIPZ5WFzZjljXeIlIA5Vmv4pGDEg82Va2HYfnwqUQ3dRPYcakmwziPEFo+DvcStLc5RG+G1fnjxF+d4mnhQGPhHcVE0NGR/pm3T5KxeU3laksjm4ZZJWfP94QYAeFiNSREx+46Nc6BPjts3AqRF2e/O7hp17lEU8XbDlQVp9HlCVd6x7DI16nsdGvxp4hU2nnbWkXUz+55vbZ4ZiWAbRrfk1qkkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67ItMaRV6CnPRegcDgkzeYAkKcWeBdl9bfFATgdk+RA=;
 b=wqJVEruAZri+C8UXEliAUZeoqlqqy909RJlWdJACw7zTSL5o1cUFD19N/UslkzucfUu8S+4AZ9dMe2X3g6ylWbnAUsp2kiqLY8/F7SwU3ggezA4Q2JdjctpctYGkfgpMiMoQiOvliWMW2nl20rp7I4E4eMyPgKUinAK12jVeLBw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Topic: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Index: AQHYs7MVCCbVCzB/DU2JPHyjxuVOOK269JmAgAEvmICAAAk5AIAAJFMA
Date: Tue, 23 Aug 2022 10:39:07 +0000
Message-ID: <6A4EBDE0-60A0-46B9-A9BA-C689B9F8F129@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
 <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
In-Reply-To: <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e1017a23-dea5-4367-eec8-08da84f3ba59
x-ms-traffictypediagnostic:
	DB7PR08MB4217:EE_|DBAEUR03FT058:EE_|VE1PR08MB5152:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1qfuhe08TIkYXuaFqjyM+XHCYYeGGLBtKZaYT1OZWTCn2Mi1O0JrBqp0CLgCVtLK1jGDg9sCiYTGlSt/DcOjrZoBjNODlLIQnUNFoyDqxLwc25gjdd44fDqhSkuW6FI18ISgigxcsnYChDKuzbP0LaQvPxjCTglfqVNCOacBCj9B+4kJKa+s2vLBdfDpgMf9oHK2JKAoUwwsMCvh533u5Ru71QR6Y/n6xY3a2yX2DlWCcpbpdaSFqYIJljjcBloEYrSgxfe0HYXl/+rdGhlxDoEJSeenThJUr8omvpb3ChbiKGSX/MEq5tZS0HCfrArrGRya133I08Z9FVGNmuFeMdLO0Np3zFPCeE84aF51BpO4BKiIeEhkO8II/xHMUPGFXPwLf+5YxYMrmwW/XI1kpwZ1Wp/bPq5Noc3L0fiknybkAncuajwKRNBsFuU0rwKTqibORMtDvpBV82nyhegp/OW7L8zgLHX4Fdl5Hb1HKnbN6TOB7wJk66n40CTq0kFXlGlED49JewwERD9HnDRDojt8jBqeVNnCHOZXBI2RutN9yYiNUp8Z4CXI8YCQ+/uHeVx5j4k+TFXh12HFSx5t2d+OXdAFiNfZrbBhUY/Pg57Xc1A5MIKGSzC+WR0DYO4z965OwEP3JxktaIikDQKyvfhXTlN+XqyyUoALEfc5yNfnRwBGnB2X8rzGiYk5kw7p6+AN8n/YHxn69F+QIX4QVCvwYNqJu+lc0ND3TAdydMv+0rPf0Fac/QnhJ8TmS19mkABQxWmZrEH6PQPW2EW3uFCtnXBXvq/2u+mpFe+w34s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(6486002)(478600001)(316002)(6916009)(26005)(71200400001)(8936002)(6506007)(5660300002)(6512007)(186003)(2906002)(86362001)(2616005)(41300700001)(54906003)(53546011)(36756003)(38100700002)(38070700005)(4326008)(76116006)(66446008)(122000001)(8676002)(33656002)(64756008)(66476007)(66556008)(66946007)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0FF7194C7199034A91767D69297ECA6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4217
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5929df7f-4cab-4a7f-e1f0-08da84f3b4e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5EJPtuOtn3HWkOaVeoAKjcEz4cNhcNjKgrZA0MRyGDptZvyH3x/GaD1vVmDeoMrmn3WLvfsZN9Ly2iGiUhKcrYC9+FeXUcZciLjFfZz9+WTjbe2iIGNiUUdtx1zaNfieQ95MFwXg5wP/Nv86L3xgXEPNEDcMHz/tLXwC4Q+h7WiX9WRzxqRiRbK1pv3fq1grDn1xKhQZzkd2LrQKC+A+KLk7Wph3pClWQEQOqFK6IgAU2i77QC+dPJmRxZbpzG3/2/vNvY5yKoz5TyeMT3HbgmC9r7jx85nEmgxAzJ9OSoDH0wHtZsvRRfKdTXzx76FvC8Q3DkxOUt5dyOrJI99FzNd1CE4MRzY+MlWCSjVLl4qVCZMxoq+/fBV+cLOhxJ7PS3Xg9rV1p16myGP1ZN3a9pDKJFndaUasBCRB0yZTG/nTs9o8HuVzu3UiTG+b4SPD1eKQcgl//13yDgi9pSIHCc2eW5jZf/FZOgQH9XjkOfTHrXqXorrKOgsYOS5vL0gkB9ktfeF07XCf0YqHBobIHsQj9Ta3V2ZGAOgGzK8CPF1jMMmJtLR0NErxhZTrrN2QROJIi3YY3TKLRGsxHigPxBoftQKxCGyLVVDaougQ48ysov+j4jZwuWzb7Mx52HvNC5EssWn5uc1xHPLOXMHxwDnN0h42vmtsg0OmiCL76gl4sYqxUqA5nhgZBqJhL4ylGmK3+FF9wYRUB7YedXzKHk54DB2pjlr+mD6RxoL79b0Fl7pXyKwZFlzeJpTR8P1cwoiCDOPSBY8A20hjA1gqHg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(6486002)(316002)(5660300002)(70206006)(70586007)(41300700001)(82310400005)(478600001)(4326008)(54906003)(36756003)(40480700001)(8936002)(6862004)(8676002)(33656002)(2616005)(6506007)(26005)(53546011)(6512007)(336012)(2906002)(186003)(47076005)(82740400003)(36860700001)(86362001)(356005)(81166007)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:39:16.4721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1017a23-dea5-4367-eec8-08da84f3ba59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5152

Hi Jan,

> On 23 Aug 2022, at 9:29 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 23.08.2022 09:56, Julien Grall wrote:
>> On 22/08/2022 14:49, Jan Beulich wrote:
>>> On 19.08.2022 12:02, Rahul Singh wrote:
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>>          struct xen_domctl_createdomain d_cfg =3D {
>>>>              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>              .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>> -            .max_evtchn_port =3D -1,
>>>> +            .max_evtchn_port =3D MAX_EVTCHNS_PORT,
>>>>              .max_grant_frames =3D -1,
>>>>              .max_maptrack_frames =3D -1,
>>>>              .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_v=
ersion),
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>>  /* Maximum number of event channels for any ABI. */
>>>>  #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHAN=
NELS)
>>>>=20
>>>> +/* Maximum number of event channels supported for domUs. */
>>>> +#define MAX_EVTCHNS_PORT 4096
>>>=20
>>> I'm afraid the variable name doesn't express its purpose, and the
>>> comment also claims wider applicability than is actually the case.
>>> It's also not clear whether the constant really needs to live in
>>> the already heavily overloaded xen/sched.h.
>>=20
>> IMHO, I think the value would be better hardcoded with an explanation on=
=20
>> top how we chose the default value.
>=20
> Indeed that might be best, at least as long as no 2nd party appears.
> What I was actually considering a valid reason for having a constant
> in a header was the case of other arches also wanting to support
> dom0less, at which point they likely ought to use the same value
> without needing to duplicate any commentary or alike.


If everyone is  okay I will modify the patch as below:

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..fde133cd94 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3277,7 +3277,13 @@ void __init create_domUs(void)
         struct xen_domctl_createdomain d_cfg =3D {
             .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
             .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            .max_evtchn_port =3D -1,
+            /*
+             * The default of 1023 should be sufficient for domUs guests
+             * because on ARM we don't bind physical interrupts to event
+             * channels. The only use of the evtchn port is inter-domain
+             * communications.
+             */
+            .max_evtchn_port =3D 1023,
             .max_grant_frames =3D -1,
             .max_maptrack_frames =3D -1,
             .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versio=
n),

Regards,
Rahul


