Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D183522EAE
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 10:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326614.549180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noi05-0007Dw-Ea; Wed, 11 May 2022 08:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326614.549180; Wed, 11 May 2022 08:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noi05-0007Ab-Ah; Wed, 11 May 2022 08:47:17 +0000
Received: by outflank-mailman (input) for mailman id 326614;
 Wed, 11 May 2022 08:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1noi03-0007AV-Km
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 08:47:15 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe05::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f474ac31-d106-11ec-a406-831a346695d4;
 Wed, 11 May 2022 10:47:14 +0200 (CEST)
Received: from AM6P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::42)
 by AM0PR08MB3427.eurprd08.prod.outlook.com (2603:10a6:208:d6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 08:47:12 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::cf) by AM6P195CA0029.outlook.office365.com
 (2603:10a6:209:81::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Wed, 11 May 2022 08:47:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 08:47:11 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 11 May 2022 08:47:11 +0000
Received: from 1751ae4f6d90.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDE52F69-F5C7-425D-A298-71D7B4062B44.1; 
 Wed, 11 May 2022 08:47:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1751ae4f6d90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 08:47:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5415.eurprd08.prod.outlook.com (2603:10a6:20b:10d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 08:46:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 08:46:59 +0000
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
X-Inumbo-ID: f474ac31-d106-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IsIPO0N/v/ZxN8X4R4HFMZjxAkdV03nAo+oyJ32ERjlBvx6RUSEvvRnrddyBjhrb5Zc86J2fHgQDYOEz/4sYH/MwmU8xOLv5EUMBQkt1IGGYDfTNV/R8MYKWbAdlzDX6V4puulAFz0ie0NZ/NgFksVO8V+WGbRyvDPtlzNXgqU3fs0WHq3KC5OEBOK5kmVM8f1zCSXgOeLkgltwHPgm931dRB/teNQYtfyRJQyCAyxkDoj7poPD3TT4nwj069FFmQQKcZfBHR6fubo9duLJKImqA3JpcesaBhArbWmvsHdAnp6nUAf6s17nVQQ7AdbcRzW7ClTzKFKXxCpK+np/kAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp8b2zNe43K5xxeta2aFqymt5LfwrsDjOUZBTj5Zun4=;
 b=gBGsi+dOgVYgFk4LXac0o/g1C7Rr56HkHWfys7W0Av2VLK+WF/xe0llbsUJF7cP5eIFpwfeBc/oAFwr3BPDvO0cvmpXEACObZ3U1cxqeYDdj8VqR+qBNa6vK7J5vfheYGqWaNnjIzM63binY/LkqiIiZJ5nsoNCZ0lOmKyDItCNZolgPk2JrmAeLPgHsywoRRgVEvJGGLUGf/Mv6YmOY7j4cFQXhe+2L4mOV+5jtaPTaE9QyME0GYGGffamlArrxeZq33UQsg22d1INNfCz7DnC4zx2fFmsIxjYqaBe7rJ69qclKu2KgAnuY+EjfwA3Zomo7/BGPFY4sE+6CP12R1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp8b2zNe43K5xxeta2aFqymt5LfwrsDjOUZBTj5Zun4=;
 b=53z2B8NZ8Q+kVwhBX82NoKg1uhQhB1p9m7v2FsHUe4SkenvyOSfOeElxC86fH9v04muUPPVDR9jppPGE8CIsoWYhMS/cf+n5CWZwKeZOBG4wBDF/1+W4tER5wVMv8eoIQW269Uu7VRuY7u3lzI0md6BDj7yhdmTpviL/YZtvp+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: eaef4afe11ba1b4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqPK3TJDm5QN9xArOcxVXbDi8VKEWhJbnJ473xuL8C7S/6d5TJNwh4U6FU0Cn16P0+goww0THMiZMGv8kuq4rxaAdmcUcHo4AZaC+CULUUvBKP0I+s9vQYDmZSlceQrBi0+doKlC2RAvia8y0SRfJzfw5ER6q3mEkrGSeCogjAxdZgCCuBKJ2CNE9jEpiUyeC9MLlZW0ZhQDNfqm1oichFl0UNrJ84C5XQ76kxrvFHiWx2A2+yCkLgg6emDN/PhAMe/T269lzlG8LAMLPQhHBLXVPvAKl2zPoxHZrNF0vx02eHcR2bXPgfvCGH3kDUKdHcFiNGkq9WwlDnbb/Y1Ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp8b2zNe43K5xxeta2aFqymt5LfwrsDjOUZBTj5Zun4=;
 b=XMnhZIsOc+dZsF7dQcLNESYBCwsnS48j/5tEi5yBldxOpep1e45FPuIJAd+ZzyMdDZu1Sx25fNC8RUg+rXsryP1yoXuiI62249xR6Fqxt1xscX0kWY0t/31iLtMDAPfC6RyU5SpQjFgzveqlFcmFoWnLxpj2kFY28UGMGL6nkdvr2x8bwR0GY68MLatLMl4qvACIHWFmIcdbQhFfAj7zzwtyYMLVwMKkGrCSkIRtFJH6CALUV49EKsFoIp6hHwhD9MPbMp2kjI5wE2bEtzkMeVGSqZ/8B8w60CBT/fsdUQIMzLa0aD2RvMljRa5SSCrF67wwdRrMiLG6wWoIrDW5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp8b2zNe43K5xxeta2aFqymt5LfwrsDjOUZBTj5Zun4=;
 b=53z2B8NZ8Q+kVwhBX82NoKg1uhQhB1p9m7v2FsHUe4SkenvyOSfOeElxC86fH9v04muUPPVDR9jppPGE8CIsoWYhMS/cf+n5CWZwKeZOBG4wBDF/1+W4tER5wVMv8eoIQW269Uu7VRuY7u3lzI0md6BDj7yhdmTpviL/YZtvp+M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index: AQHYYBV7IqUb0ECYF0+NQ9CCVyUDtq0YVm2AgAABQwCAAP62gIAADosAgAACPoA=
Date: Wed, 11 May 2022 08:46:59 +0000
Message-ID: <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
In-Reply-To: <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7e8b2900-5d9e-4c6b-b722-08da332ad73f
x-ms-traffictypediagnostic:
	AM7PR08MB5415:EE_|VE1EUR03FT020:EE_|AM0PR08MB3427:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3427A4B7F8D981B6A0B0408E9DC89@AM0PR08MB3427.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gjwHmQzUAY88ZtiPLyveN4GZTRzogayvYkuBlRBQg3jdZmdTQLKn7nAB+0RUd0NevKLh2xtDAk90XMkg3AyPv6MfntsysQG2Uzhg1UHRZXb0GVA7MuuFrlf1f5PaPAq8qbR4/lbggXKLILSf25nUGYcLF1EKWAPxIyaMsxE7++LwGQF4I9SOyK1MuUwMgRhHQZCji57NvUMAQAkL57S5+FXsfrTQYgCoRQM9XdkfsYc/IU7vWZq6aLs5rZEW14SEj2JLB57BTH5L58CXtAFNam5Qs0M1vNwKkN0UwR+/rzqS7sGxCijHOIoRLU95t37GCwGhzLOn5J7XYT+fH81GGs83KGyRu25/tRPKysAnZqQu5PtR4rRMhRJnr/kN6eyV/WQzqX4Vt8t4XYbJzMhl6n2jjMf0znrSB2q6Zck+ZTTz8HeuNQDAKkzo635vinVpkkybhff5xt83QfF29PYpdjf6+jnC7vrCX7rmKIC2dRNlunSwGMNwp/WOhOdWU14PAD0DDfP9XrN0iaHLeBsQWhK/aRkubcSXjCdY1gMWmrCXl48pqyeF0CVchq4mRkcLVGsfFgsdnyF1vj14DBJad+DY9NEtWa2/nDQ2DsYrY+qtJpQs8/j+qb5lp5DUyFiAp581hk/rxPn2vL82cEoD+YEhJMI+QTM+OVDS9jftQbpMEJ0k20flXQGb9CWm9MjMOcu7Rim2t3QCcaDfxhTx8I2OPy1lwkrveXcrR/gKAepKO53F/jUeystv8FPvdKmRLz7T4HbqtPICUXqu+mzRcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(86362001)(6506007)(8936002)(6486002)(33656002)(508600001)(5660300002)(2906002)(53546011)(83380400001)(6512007)(38070700005)(26005)(38100700002)(2616005)(122000001)(186003)(54906003)(66946007)(316002)(76116006)(66476007)(66556008)(91956017)(66446008)(64756008)(6916009)(36756003)(4326008)(8676002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E4B5D7323D95243BEF62C9EDC1B45E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5415
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6abd311a-1f5b-4ed8-69e1-08da332acfd7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85qOLI4qGy54rfWJMkMGzvfgQqtL+9daJty6Xf+W7i7EeXmuQtG73kvQmm8TBckgSFCflIQGPHnZNOHPZPOvvJsXzg3GjsCTYlzReItZ0WputkTvHXHVZZuIKDruorFOd4asSZ45R/iNjHlzfpHijarq8JZv1C28o2N2SeJOeA4L9tlNaXlbtXlsKKH+91JrJRW0yGLHNUzlo9IXJfEGW+H2DwKNHiHFbWhIU2XulJI/hbzpovsro59xIOFhcI1EABXMAbSHAzrhbyhipUIluYC+5pd2sSlkm/ZG3xra41QJJzAUuAXXYWjeVexb/F+BXoVxIaxALxO5Rr6cFvLqIM9J86yEnip8oZAl8K3zLcDsr0j6/1MeWA6Nq6nbsB34iR1tOBqDd5hkkxvCBLVrubHgjsxqOk3owJ8PaRzTffYTR/7Pvcj3eKq9ngkyaoUjsfzvtUn5dTVVoSFiVuzkiJIFkJ0T/P0QikJmoTrA3xJUMVzKRitl0MwGJbeXmn/2myDxQnmVEEkXgTWNN1vQB9HDTsiUKeQQ6RaZfNk1g8H7AT0wNBKSth7Jlq+GN7Q7Ri9FCbBCBrpTYD3OU5S3bPfPbKmmZE1ymqDS+8VJ2aj7CShkcAbMgN5+7VLvH+has34/HnBLn/YOeRm8YoycxudWm6fkMg3B8C6oylrN2C3/GpZO3lX9yugzv1CjsbYEx1PlcDc/0jGvL6kpe/v6PJ74IMHdRS7hM0FJ6Lrl5PkC9zD3pZApYW8kfmKxIUQi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6486002)(36860700001)(33656002)(508600001)(6862004)(40460700003)(8676002)(81166007)(70586007)(86362001)(4326008)(70206006)(316002)(2616005)(6512007)(5660300002)(356005)(26005)(54906003)(6506007)(53546011)(186003)(47076005)(336012)(107886003)(2906002)(83380400001)(82310400005)(8936002)(36756003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 08:47:11.8103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8b2900-5d9e-4c6b-b722-08da332ad73f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3427



> On 11 May 2022, at 09:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 11/05/2022 08:46, Bertrand Marquis wrote:
>>> On 10 May 2022, at 17:35, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Rahul,
>>>=20
>>> On 10/05/2022 17:30, Rahul Singh wrote:
>>>>> +    rc =3D evtchn_alloc_unbound(&alloc);
>>>>> +    if ( rc )
>>>>> +    {
>>>>> +        printk("Failed allocating event channel for domain\n");
>>>>> +        return rc;
>>>>> +    }
>>>>> +
>>>>> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] =3D alloc.port;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> static int __init construct_domU(struct domain *d,
>>>>>                                  const struct dt_device_node *node)
>>>>> {
>>>>> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain=
 *d,
>>>>>     if ( rc < 0 )
>>>>>         return rc;
>>>>>=20
>>>>> +    if ( kinfo.dom0less_enhanced )
>>>> I think we need to do something like this to fix the error.
>>>>  if ( hardware_domain && kinfo.dom0less_enhanced )
>>>> {
>>>> }
>>>=20
>>> Is there any use case to use "dom0less_enhanced" without dom0 (or a dom=
ain servicing Xenstored)?
>>>=20
>> Just being curious here but would it even be possible to have non dom0 d=
omain servicing xenstored ?
>=20
> You can build Xenstored against mini-os and configure the init script to =
launch xenstored as a domain.

So dom0 is not mandatory or should mini-os be started as Dom0 for this to w=
ork ?

>=20
>>> If not, then I would consider to forbid this case and return an error.
>> One way or an other we need to solve the crash but if it is forbidden we=
 must prevent coming to this step earlier as it means the configuration is =
wrong.
>=20
> I think this should be checked when parsing the configuration.

If dom0 is mandatory yes, we should still make sure that this code cannot b=
e reached so an ASSERT would be nice here at least in case someone tries to=
 activate this code without dom0 (which might happen when we will push the =
serie for static event channels).

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


