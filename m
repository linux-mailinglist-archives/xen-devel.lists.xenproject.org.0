Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F307B7CB7BC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617967.961143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYTt-0004pr-Fc; Tue, 17 Oct 2023 01:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617967.961143; Tue, 17 Oct 2023 01:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYTt-0004mV-CS; Tue, 17 Oct 2023 01:02:45 +0000
Received: by outflank-mailman (input) for mailman id 617967;
 Tue, 17 Oct 2023 01:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsYTs-0004mL-DO
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:02:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e038e76d-6c88-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 03:02:43 +0200 (CEST)
Received: from AS9PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::26) by DBBPR08MB6314.eurprd08.prod.outlook.com
 (2603:10a6:10:20f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 01:02:39 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::f0) by AS9PR01CA0022.outlook.office365.com
 (2603:10a6:20b:540::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Tue, 17 Oct 2023 01:02:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 01:02:38 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Tue, 17 Oct 2023 01:02:37 +0000
Received: from f62bb415c8ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A972A1EE-B7F1-45AC-93A8-55759847BA16.1; 
 Tue, 17 Oct 2023 01:02:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f62bb415c8ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 01:02:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8405.eurprd08.prod.outlook.com (2603:10a6:20b:558::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 01:02:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:02:29 +0000
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
X-Inumbo-ID: e038e76d-6c88-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekQvGqXYkcI8LaosjYeBIv6kfj2Eba46wW2OXj9K0zQ=;
 b=6E8P+JV++k1+ESZHA/89kKC5AUaQX63ee2zkKni9Fx3Ww+s9+lnLER2GfQyG/zbk2xgZp3Bf4F0l6pWDu26IiYTi0WKmR681Be4sJs9dkAJUBnAf3kzaM0hOmiAKitSN7qEIkSoocGl6pMZe/tOF5c7rtgagqrnwS61PiagEZno=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93955e5a60a68d29
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/uRu7tft9X7wth+yydw1DW0FlmCYY/8mmvUDL4UEyAYlpYfBZ6vVjSxVrlKSsWHlOKC3yeIMEI9dpzLwaWeWSU5zJPRwLCzXe491pXh6LKbnpJgBmfdXnxSGGCSH+4lfg2kTtu5tSY0SKSTiZkwxlfgkZl1XD6Lsllbh9/EnVq52Nqi9VRbBb4Wxu1pAVUBFBc4NOJD9kNBL+LFlgnqtBFpXhl4/QRdOeurc2z6yEX8dvkAv8wbwrz1zkmgG9slrFMH5iEi880hqJT2Lq+v3kRjyRMqwm1kuZq5SmasWNFUuAa+YUg01fu/FDIvNEa8fxqA8jTehMFScbmx4IcNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekQvGqXYkcI8LaosjYeBIv6kfj2Eba46wW2OXj9K0zQ=;
 b=LfBP1gH3HqbYkL+yQVeCpDWKST0hg30zvQ6mInVoiJxEO3Z/u037f/GnAdR2fOKxDg523ddiGz4eq1Cdhtv0AinnthjskjAJeLtEAI9LG7PUnceeWBJ/yNLr/vF0pD4lPxAXQDqC7SJLUf0y0OcL5f+Tq7mAQgk68/5SUEKR6/XQCMglgACxbjo16MzKG+imFeLIAZU2waxwjdLUGLRIcz7DWg+nK2RXqz/CGSU+LmmVg8Y4c5hSo/+h+teffPUqGu2WY80+pHgsMvmcL5nA9BwsY9VuMLfalVJaE8mVnk6urJXDezmbs0pBXdR4K3ghK6I3Q/BIcr33Sr8ojKq3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekQvGqXYkcI8LaosjYeBIv6kfj2Eba46wW2OXj9K0zQ=;
 b=6E8P+JV++k1+ESZHA/89kKC5AUaQX63ee2zkKni9Fx3Ww+s9+lnLER2GfQyG/zbk2xgZp3Bf4F0l6pWDu26IiYTi0WKmR681Be4sJs9dkAJUBnAf3kzaM0hOmiAKitSN7qEIkSoocGl6pMZe/tOF5c7rtgagqrnwS61PiagEZno=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@cloud.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	"jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
Thread-Topic: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
Thread-Index: AQHZ/in5rn86ZQ9wkk+3c1ZjNJ43H7BNEK2AgAAeJQA=
Date: Tue, 17 Oct 2023 01:02:29 +0000
Message-ID: <04B22EBC-4766-45B1-A5E0-44E1A7EC2FE0@arm.com>
References: <20231013230624.1007969-1-sstabellini@kernel.org>
 <alpine.DEB.2.22.394.2310161614080.965337@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310161614080.965337@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8405:EE_|AM7EUR03FT025:EE_|DBBPR08MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: c29f9806-b248-4dbe-6d8a-08dbceacc1c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gKqwW0//EK6Zeia4vst6ViNY3iIIjBjQhi4VvokLw2GZ//fscQcR46JCKO/Sh73wnfcTTG8DP+W8NxVyBGStEj2HDSztsaQLRS2bjChT02SmhTCEawiy6wYrFvR75hwQjq0KhoFKtIGuuDZa/ufK0utee4GViE3aP1BbBCZtz/gB2nlhf32HZDITyZj34nkGgyD3AGX2QxtoPO0fxGCAbjR538VoRJfCbm3Qn2ypTZ5ZzDISY0Dr956Nq3WDsdpdanF2NVMsiR3N/zsLzQVguu/jayVQYeBW9eDG7MGs6/deySvVCUL7gtCVuYzqqXb3taf48InAau6pbMKN/tnykbbeqaNJUQ2bKT4Kdm4gXWKTPspmLYENDBp+lClannD9okZXu8oGpGnUr8U1hTtjnlp+3jLkQvCddkRXJ9p/8bHyAjNB//iQYmxarpQZaS5XhVoGMYS5S/nlIbo+VPaUzgHiufHFnBbOHVyC3eDcE5WFPF9WkIiIUpXnajreDQ+9VOJIKpVRfbBDt0II0g52tTHfXRiCuGq5OSBPYHAi8rmsNehUFBj/qvhmVr01sd9f81/N1LSj24BJ2iCztD/QhVlzqLuFbCCfHKJrBPYWTb9jausRKzIyImpuU/5f2dHbkNQTVcMgvDgOA32tC+KLwvz+b9qaYfuB48j/75cljX0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(6486002)(91956017)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(71200400001)(6916009)(83380400001)(86362001)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(33656002)(38070700005)(41300700001)(36756003)(122000001)(5660300002)(8936002)(4326008)(316002)(2906002)(8676002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1E92130511D30B44AEEA18F794E3FB9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8405
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	774ca699-7e53-4726-2199-08dbceacbc6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VSIMhaeQq2w63Lw39/eMCsaTU1BKJ7jWFT/3L7mdnHesIvOfxY7DF/b9Jyha4BX3FtzPDip7ZeV/Uy8F9J/tuNPjX0UEvL2hWkVD1BkL0x78YQ9xECcKWM7CbeYXu62eKCcDPi19turUHrm3Lp+fLZiSYwHrmdlJQJENSLik5UtVkChKwRCbAQ4gXz70OfLE2dz+/+TY6GSbrepJDkXnMRiQueo5q45ohreyFMjffSdZsroE15zjXAF+VVLU7tSIovXoGGURnCHQYOhMWWsIXF2+dHILgBb0gpPI1aN0WSAtCB9Ul+4W8Yk0hMLophMMXeWgUgO+nF0IFaCLK/KCFhg3lJO75LIoHcJCgBmEaMph5cQAmvGS0LoWnPyGekk5jfe4IGTRRHU1BVkqytIhfb9xWDtd9ZZ8VQwwEb7Whb3h1CN1dwBXxaDzwE7sLRZvaKhwsiPE/mSjTrDColV14aKikP4xC9hw/iOwwUBcTyUAjvX66vgxzUE6pB3ClNUaLtiRjNYLIEIgFjwiM+MlPEN0+nb+xAXy6+kZjpxvLVrHy+ITYVuqWY0G8jGSVl4NCqP7OcbhZHd1dSx/TeMzkb8Lg+s3ZhZCyPr9Nzt23YnMuhukV746jp5pp0K2IWJ+xai6k/g6Me9ln5HdOE+kRtg0xvMKXeFrSSXe3QGA5CzJyUCS41mbIs/DiTbP8BUipdzXZufX9zsFNNWbFWMJM9IdvtgQFQVr6HRZT2PKa2nrieLCJiCuKmf35xFAvb7M9mDDdbAe5Y8wvrRdUXXfIQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(64100799003)(46966006)(36840700001)(40470700004)(70206006)(70586007)(40480700001)(316002)(54906003)(86362001)(2906002)(40460700003)(5660300002)(41300700001)(6862004)(8676002)(8936002)(4326008)(36756003)(33656002)(2616005)(81166007)(478600001)(6506007)(53546011)(6512007)(47076005)(336012)(82740400003)(6486002)(356005)(26005)(83380400001)(36860700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 01:02:38.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f9806-b248-4dbe-6d8a-08dbceacc1c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6314

Hi Stefano,

> On Oct 17, 2023, at 07:14, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> +Henry for release ack

Thanks, I think we did have Juergen for reviewing this patch so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>=20
> On Fri, 13 Oct 2023, Stefano Stabellini wrote:
>> From: George Dunlap <george.dunlap@cloud.com>
>>=20
>> Commit fc2b57c9a ("xenstored: send an evtchn notification on
>> introduce_domain") introduced the sending of an event channel to the
>> guest when first introduced, so that dom0less domains waiting for the
>> connection would know that xenstore was ready to use.
>>=20
>> Unfortunately, it was introduced in introduce_domain(), which 1) is
>> called by other functions, where such functionality is unneeded, and
>> 2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
>> introduces a race condition, whereby if xenstored is delayed, a domain
>> can wake up, send messages to the buffer, only to have them deleted by
>> xenstore before finishing its processing of the XS_INTRODUCE message.
>>=20
>> Move the connect-and-notfy call into do_introduce() instead, after the
>> domain_conn_rest(); predicated on the state being in the
>> XENSTORE_RECONNECT state.
>>=20
>> (We don't need to check for "restoring", since that value is always
>> passed as "false" from do_domain_introduce()).
>>=20
>> Also take the opportunity to add a missing wmb barrier after resetting
>> the indexes of the ring in domain_conn_reset.
>>=20
>> This change will also remove an extra event channel notification for
>> dom0 (because the notification is now done by do_introduce which is not
>> called for dom0.) The extra dom0 event channel notification was only
>> introduced by fc2b57c9a and was never present before. It is not needed
>> because dom0 is the one to tell xenstored the connection parameters, so
>> dom0 has to know that the ring page is setup correctly by the time
>> xenstored starts looking at it. It is dom0 that performs the ring page
>> init.
>>=20
>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> CC: jgross@suse.com
>> CC: julien@xen.org
>> CC: wl@xen.org
>> ---
>> tools/xenstored/domain.c | 14 ++++++++------
>> 1 file changed, 8 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>> index a6cd199fdc..f6ef37856c 100644
>> --- a/tools/xenstored/domain.c
>> +++ b/tools/xenstored/domain.c
>> @@ -923,6 +923,7 @@ static void domain_conn_reset(struct domain *domain)
>>=20
>> domain->interface->req_cons =3D domain->interface->req_prod =3D 0;
>> domain->interface->rsp_cons =3D domain->interface->rsp_prod =3D 0;
>> + xen_wmb();
>> }
>>=20
>> /*
>> @@ -988,12 +989,6 @@ static struct domain *introduce_domain(const void *=
ctx,
>> /* Now domain belongs to its connection. */
>> talloc_steal(domain->conn, domain);
>>=20
>> - if (!restore) {
>> - /* Notify the domain that xenstore is available */
>> - interface->connection =3D XENSTORE_CONNECTED;
>> - xenevtchn_notify(xce_handle, domain->port);
>> - }
>> -
>> if (!is_master_domain && !restore)
>> fire_special_watches("@introduceDomain");
>> } else {
>> @@ -1033,6 +1028,13 @@ int do_introduce(const void *ctx, struct connecti=
on *conn,
>>=20
>> domain_conn_reset(domain);
>>=20
>> + if (domain->interface !=3D NULL &&
>> + domain->interface->connection =3D=3D XENSTORE_RECONNECT) {
>> + /* Notify the domain that xenstore is available */
>> + domain->interface->connection =3D XENSTORE_CONNECTED;
>> + xenevtchn_notify(xce_handle, domain->port);
>> + }
>> +
>> send_ack(conn, XS_INTRODUCE);
>>=20
>> return 0;
>> --=20
>> 2.25.1
>>=20


