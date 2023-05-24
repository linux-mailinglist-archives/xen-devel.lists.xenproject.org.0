Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569170F0B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538878.839209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jt9-0004Z9-L0; Wed, 24 May 2023 08:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538878.839209; Wed, 24 May 2023 08:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jt9-0004Wl-I4; Wed, 24 May 2023 08:30:31 +0000
Received: by outflank-mailman (input) for mailman id 538878;
 Wed, 24 May 2023 08:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1jt8-0004Wf-28
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:30:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aff8bfe-fa0d-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:30:27 +0200 (CEST)
Received: from AM6P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::20)
 by DU0PR08MB9079.eurprd08.prod.outlook.com (2603:10a6:10:470::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:30:22 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::ce) by AM6P192CA0007.outlook.office365.com
 (2603:10a6:209:83::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 08:30:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 08:30:21 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Wed, 24 May 2023 08:30:21 +0000
Received: from 2ea2d9c5bfa5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A17A1631-65C6-46EE-A673-B62BA9585E51.1; 
 Wed, 24 May 2023 08:30:15 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ea2d9c5bfa5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:30:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB7684.eurprd08.prod.outlook.com (2603:10a6:150:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 08:30:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:30:09 +0000
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
X-Inumbo-ID: 3aff8bfe-fa0d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar+Fa7NV0qRGHdNkrriyS/Ocaqk+MyoSIP+/dFJENMM=;
 b=Lbuys9yrrREnOZKe13crnEylh0dkxDahm9CdSkwI71lw8ZmnML0SjCsS7j7o0BhFbW9OClwlV+4lQPNfnbJi/A/wo9bMRqzm8bqmtDktT7q2I7sIUdIuIgchOblyoUutJpyfnFhug9jTY9dF0GR/JCYdzj/RLSe20dbxAp+TuMQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 73c2e526052f83df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdA5uq+FoQL3KEkfJYaA+vT5SfjSaB8fsw80pWDSKUF4/DuGAfjxRtViONSB/TnHwqxcwGp0tB5nfUFK/FE4eAhzJyao/K4xdCxxJXs7LJ1/O8znsbjXiH7z7rjlZ7ZRvciuZevm9UsJYxQIlB5mh/VSAIG9WBL8FT4QphYmmqlF1uocWszwxaA1j0R+RWRd5Q7nW0GSYGlS3T8BibXhigIUuZrSHNHe0Ab6ZFxv2ko3Ewc3ab3C7KAF7NCPKoCxuOydqModpnD7Ux+zsM6yO5E5YH5z1IdDkE0rJ8FdLg5rBdZAnZoGIQh2I6Fvz51ZVEa64mnLev+/hk5Qt7/IjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar+Fa7NV0qRGHdNkrriyS/Ocaqk+MyoSIP+/dFJENMM=;
 b=JqVThb/jRHjPpwlAw38qjjmAWxggCISnR+ZqibjJyNUB2FUBYkNnb+Z9xASVJXJbqUfcSsi7mSfTfdDdL1Jqr+KJid3Y05ML6Jb7h0VM8gaO4hCHsKGdhN5sXCwf2JNhoiNZELYrEsPO0dulMzjWhSMf89qdVx3AZxLYtH99RK2nkXdcbT/KR420LBWWj3yFpe1bFjN7O4ETcqr2vf4jfjbYaJKqjCk2aSK34st6iZkQ4SjJXuMo2lMWMkNTdfWugaYWbT26FaxbN+Ey7e3e5G4CPl7iKlasbipJ1IOyC17wKNARVJxCYCzDHqZ4Y7GRf5IcD97VdhJZQuNdPbBHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar+Fa7NV0qRGHdNkrriyS/Ocaqk+MyoSIP+/dFJENMM=;
 b=Lbuys9yrrREnOZKe13crnEylh0dkxDahm9CdSkwI71lw8ZmnML0SjCsS7j7o0BhFbW9OClwlV+4lQPNfnbJi/A/wo9bMRqzm8bqmtDktT7q2I7sIUdIuIgchOblyoUutJpyfnFhug9jTY9dF0GR/JCYdzj/RLSe20dbxAp+TuMQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 10/15] build: rename $(AFLAGS) to $(XEN_AFLAGS)
Thread-Topic: [XEN PATCH 10/15] build: rename $(AFLAGS) to $(XEN_AFLAGS)
Thread-Index: AQHZjZZTzywyLasu2UeN6RTgzfRGn69pGKwA
Date: Wed, 24 May 2023 08:30:09 +0000
Message-ID: <17CC7699-2B73-499B-946B-E423F7C9620E@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-11-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-11-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB7684:EE_|AM7EUR03FT048:EE_|DU0PR08MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: b15cea1b-c9dc-4746-39c1-08db5c311d49
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xQ+Z5EVi6HtJEsi3fo4oX3DOk1A3oc1/bwGJt/kCcyMxWAtRfLaM55tKDR0rs0rLEyqKPlGB53mwZkrJmQO7exCWr9TKqbfzw4SgJIUld3sUzgjkF6b3cs4glPq+JwR/s3rcNmeje/OqsCghSdpTplkhvEzQ3Eh7YQQT1U/p5fZ5P6GdjeATK78/7/RRRKfuIrZRy7lFKGhRL6oOSkuzFSHQGJKBSY0X0833wBkCRYbRyRNG8y+Vdr0Lfld2u9EZaVrkoqydAa4iDJg9aCMFf7Q3XaQVvIP9cIiAKRkq7O97HmwHJrE15Mu0ithziicys6kpE3wcKtFKKGife42sHvoi29dLd5v5Md3jWYbYxBp4XLbYypqMlzsj9fLmEDEXBWfeGSuXL81RXJKsiVYV1HIBeVb4FfiUKZ4Oq/IjNdnsvZWekXZnrviLcKU6jIGfLDK8sHvnKBegcc8USnUFUDz8e78UN3dRCrAs/8bloSKfKimfSL6p4yPF8NgTBYPVGjcAy5N2f8U+onGtW9Gmb6xtMWh4imq9CyQoeKpb/1uRtazjVN4SSCnw5vTmKb0yTpFgD5VYMeW57kcG8jFrv9Jd2cxWoQzZ2qFM5JXYtSFWz5hnzd+Y1Txd0ZwHhWmwEsgWEwW6PT1nhrZMPOKw+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(6512007)(26005)(33656002)(53546011)(186003)(122000001)(6506007)(38100700002)(4744005)(2616005)(36756003)(2906002)(6486002)(71200400001)(316002)(54906003)(41300700001)(478600001)(66556008)(66946007)(66446008)(66476007)(76116006)(64756008)(6916009)(91956017)(4326008)(38070700005)(86362001)(8936002)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <078600B4A242364AA9A4027BD93ED7F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	311dfa14-3fe2-4419-2269-08db5c3115c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O0/po+DxlbFedtoOYxPlRqL8M8I6sxXEWv3qxwVPnp1I00/7frP1itug11/tEQL/41D/SIotmUjP2Gxs9ecqy0iS3YlUWV+m3nnIket3VP70fz6c3xl4ZTAbLKKf2Kgu/FXkYiNR1glpM+bujX+431kitXZpBqUDPEqT6snMqVH07Ak3d7FJBuelujSdABwtI0DIxCuZaPuwqAGGz+f188ZFJ90p69yxBo0iwLsqE/8C37LdmuD8H5dTY05mWOZ2DDXb+jD/NMvNQXGCRLQaVVCHb89xYagoICQOfx0gu9vTyvxHumai5EHNO2zq14yhss7kegS9dXzLygt8byjyrGpCrcB/MC/pmGfZiBsE19Z2EgouJc55yZM8tZz2RtSrdR2gANslDmi6Ta/aqnNwmbPDP3MvGgUB9DC7aVXUQuTNp779bYJ1BrnKuwZS2mfdaRu0gvqOJgt5q2f0GkOS58JaP3Sv78tfQiXmq0m4ePX7jI5sd8hb5m+vWEqoWFE2tWKdkU52cqfISFgVzQV0fMUQcTBEqqZz7NH0xV/St6NoRMqM7BJX7DmBoJ7WSjPOVX5Fk94rfQsbEKBLK+xysD02dNTdXBZa5HPfqzZFqdofcB/qOuH4Kzj5yhBrKIHIMBUGQ7EF9Hw0jYi/sQa2l0UFEX/g6w8fVNy+Lx7iaZkGCHHfObC3JChETi5NmRbDYXgeED55AQ7rmLTARSlsoDTxJODYrh/Ro3pRxTqDLyo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(26005)(33656002)(6506007)(6512007)(82740400003)(356005)(40460700003)(53546011)(81166007)(107886003)(186003)(2616005)(36860700001)(47076005)(36756003)(336012)(2906002)(4744005)(40480700001)(316002)(70206006)(70586007)(4326008)(41300700001)(6486002)(54906003)(86362001)(478600001)(82310400005)(6862004)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:30:21.6767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b15cea1b-c9dc-4746-39c1-08db5c311d49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9079



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> We don't want the AFLAGS from the environment, they are usually meant
> to build user space application and not for the hypervisor.
>=20
> Config.mk doesn't provied any $(AFLAGS) so we can start a fresh
> $(XEN_AFLAGS).
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>




