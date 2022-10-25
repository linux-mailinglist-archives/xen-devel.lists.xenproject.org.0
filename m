Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13260C626
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 10:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429632.680731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onF41-0002Az-Mz; Tue, 25 Oct 2022 08:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429632.680731; Tue, 25 Oct 2022 08:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onF41-00028x-Ie; Tue, 25 Oct 2022 08:13:33 +0000
Received: by outflank-mailman (input) for mailman id 429632;
 Tue, 25 Oct 2022 08:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onF3z-00027J-PD
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 08:13:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e68fc449-543c-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 10:13:28 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 04:13:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6450.namprd03.prod.outlook.com (2603:10b6:806:1c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 08:13:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 08:13:21 +0000
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
X-Inumbo-ID: e68fc449-543c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666685608;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YX6jqx21pGMDg6Blul6hkJqC8sdjRaTf+MR4wZxV8eI=;
  b=eGcJ9ZhbXpcsdZUwjSvhFMdXjvu2PEE8/o0K/t6j4QA4ZF0D9dmHJeZ2
   0r+qRvAFmrES2HM1aZWWfYtR2z0LAM4HxLVvdf9ZwspMoYmBqPk5Batm6
   76NsCrYDm0JVF2nvEh8xkjwSqxOCtQzvVm7m90hYtt5B/hU8Jdx2UMIpw
   0=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 83456124
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Al52eLK64teSsJDXgsE+KmQxR2vbMJbbHMSYv2?=
 =?us-ascii?q?y7JWF8qXhjsoshV/T9vMzAtp4WMNckWm8diJPyAfru/5I5j2gKE5yuO8bbr9?=
 =?us-ascii?q?stcgWt1nkbNJVQgTP23j6yiff2+NX+0duchnxjw64xoPKRVkX05WPaRAcXcb?=
 =?us-ascii?q?Fp0/pW8tZ6AY+7rUjAD4mi3gllc1gjwXnTE6jC15i+XeJxUV14mxZ5xk0YSZ?=
 =?us-ascii?q?pOjKn9wEDsYQtD6sJMKBvP6gmuio/OEE45dEds7mXTOUz4W7bFwkmTgTtI7G?=
 =?us-ascii?q?VH0Wvg6jagK644JxJeeCoyRPhP98H18FI7aAC5f3JfIGi3WEcmHv8PN1PtE7?=
 =?us-ascii?q?VZbwWRo9NiAerGnlHXm+aJ8nRzb3eM7+aiLgYBoF/iY2zsDcHhrd4TPJWhUL?=
 =?us-ascii?q?jW0bqFgtToSunB/FOZfHRm5jaQ/ufwsiL7Ti1HPdEEmZ2uNx+A1CcxtoFfU/?=
 =?us-ascii?q?MXoMt2Kn+4gPTSMuNkprJor1GLq2lfPbqBJbi1fllEZhLBkzZIk8pqD+MJnS?=
 =?us-ascii?q?+ox9QYazUI9K9s5H+v8BnvEcao4WRbm3OxsamQlrbv4Lu3IXJscAGqBq9hMV?=
 =?us-ascii?q?DI4ZUmMKlStRCefpyWx3bg0RY0JTnqzMC15TNcnH9LbjRlAvBfbh2zPbv+ck?=
 =?us-ascii?q?G06QWNp6IQYuKCfh9KvmaWEawbo7QgmAWIzJp0C94eFneXmdv8N6PsigUnf5?=
 =?us-ascii?q?/dqeOKuAYriVU0BQXzwJoe6twAKVwj1zf2CCdKdtiGZOc6V1w0DlRpFScTZI?=
 =?us-ascii?q?2KynH/pgxgcMak0c1j7vyFzuzCCBFSdNh1IMqxxP99czo3k+31jD6NTGBu9i?=
 =?us-ascii?q?2KPjOHHqOO6BAhtQSWzmDC/Ggl1daSVJs7S1bvPl07zKNlVhTrH6e1tcMgn9?=
 =?us-ascii?q?sCTHdSBLYNw6mE6BUbE9TlO8/TV3FZ2EHCD8nlr922M94K6ixDFv8QZtamo2?=
 =?us-ascii?q?5krBYj3FGJviPGoJh8vpjLk/z0SaJeiaLX7K68xmpUDcV6YnubkxpPuFmu0G?=
 =?us-ascii?q?mIIkFCoIy8h2//K5PIMQ2KPbXwE0M3Mu05i1SSsY0FzW4JUC6hOQ9rJoRJ0L?=
 =?us-ascii?q?cNp0diYKRgwLDAmPQGp3poYahuKqlkEd9pU84pdjhb0UsrYEFur3uOLZu6nO?=
 =?us-ascii?q?vfDlGgrjNKgqrn/rjnuDnoann3j+xDhR9vnj1lV6FYcOWe5Q5gFYKAX5tbET?=
 =?us-ascii?q?YIl3TlaSoM1rMdkgIAjrrPdvFtmMcQKjftOHgsSjlGPpHnweUU6BPsL43+Iz?=
 =?us-ascii?q?PXO/5vxeQgj5vGxwUUerPwbssdOElqWgSTROXzCmoB7yw3rzcl80Kd3VamSw?=
 =?us-ascii?q?YQ0iOmBwEjanoLyOEak/1kx4ubMPlMUvV8x6Sc2q+Kqfddd/kwmoOEIJVhvO?=
 =?us-ascii?q?5RDsM+P0iRStXvER3ddef0tyHxySQpxJ/v3NRelQgX31Scu3SrOIIy2hmjgj?=
 =?us-ascii?q?RovceydGapAs/XS5DHUToN9Ry6LJvf/PEZkl/gx2Ylw0jNWIzovdz+CtiW3L?=
 =?us-ascii?q?5UwR0YZfc+yXJ/Pp48j9NiX2jXL+5h/d65T4EM+kYoH8JhjbTbBVdnkT9Hm5?=
 =?us-ascii?q?XegkSat7CxkIuDiIBO3uM1WuFAVbk+GPKYGk6Dc23J8dlxtHkoCtd/lsAdF6?=
 =?us-ascii?q?JUMUWEe9nqxPiX9b1sl8fXqsjgK6wbGXX1rZoHtW/jFGuWWeBRbtK7SuS8cw?=
 =?us-ascii?q?bK2fYPzgl0YE8l9hkXuspqhzP+hFlpvCvbExTafAQH9mBR3wR8iuHfzQNm+8?=
 =?us-ascii?q?iGZbxo+klOQGMVozZmikXQL8dkSpQqaQ/2SWHH/2AtcYUKdTvrtTrdoB6U2c?=
 =?us-ascii?q?rhEeN54aydFk/r6ahnm8Vq49DY2K8w/HSJ64at6b1tOGK+1FE5Rl879Iljdm?=
 =?us-ascii?q?U2wjOZKF4EEYJortxTDaUy4/MdiJ0FhN8RtdPjLK4RXvL/PvoVSPndFJd+Y8?=
 =?us-ascii?q?RcRepUtPqq3IFjG/SjUMzs1/svfizOXIXpgRJRx+XMw8ccSUMiM4OV2NElTQ?=
 =?us-ascii?q?7VD1CgPuFE21A3gJl1P8yT/6qRxU+UgFEh+R6S5nUN6Q4UtgWBF3YNzcPzZA?=
 =?us-ascii?q?F54rduPjki83XtvwZZepZLBwATwd46/VIszKpdTCnsA7B4W8TWlPnA6KTF5Z?=
 =?us-ascii?q?E3TBUgu8DzarZu67RHOuui0M0lL739A3kC0krlpKobBdKaHFce6Wpacirzmw?=
 =?us-ascii?q?mK4NCw2FJxh352uWNjo5f6q6YUmRLrWbtwzWFSOINQig+6JNx5C17Bjj5ysx?=
 =?us-ascii?q?EKT2a0LhF1+CA4rIu/DMHiBZWa/H1UvpM/+puVIB9FPR6IMdDqrP0QpPHDoL?=
 =?us-ascii?q?3piaM7WHG6U9Z+LC9jDTejiEfLrlL1xWGq3ViQPKE/jcfi4zkFTjr19qDWll?=
 =?us-ascii?q?GyvT8JWNONxra/RNca3k06xHPUlWJmXb9Kcv5ohmv+OzVBCKxXgcQ9Hc7B+G?=
 =?us-ascii?q?Thqp/UqQXNyzqGblZX2lMkcLHRef0GbSFozmPIZuU+KDF+WO/t9xQQdL0flB?=
 =?us-ascii?q?RRoa18Qb8ANkArsDcYuCbR+U0lzbpnlBOeALcCNxdsYEDRESbVsFwZw5sKRA?=
 =?us-ascii?q?oCaTMxKfVpbXj4QrD9l9G7HSpHddPMg2+UT7Nv0cqytJmXiCh90owIZbZ/CF?=
 =?us-ascii?q?OvGCFxapuE77++7Z1pz5sauN9jcFuFfUA4EExY=3D?=
X-IronPort-AV: E=Sophos;i="5.95,211,1661832000"; 
   d="scan'208";a="83456124"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxqvUWHDp4MOHLUfXaqoRuJNDHkkZcbIdF73FEG3Yt9DVV1pXOtidGU5b1noMmNhpRQQBAaObIVoePcAM9e2uS9f1gj3jP44KyEiY1CpYTKRxwjLTzkmS8dYEB+/CSNGTjIE8yUzXHhkj93FGIKtP9cXfSpBHqwIphd8Byzbq8gHoxlIl5p+T2ID6d5/IcdYvnMS6fSDNu2qaZWFtQ7MKDl8AoOfI1GN/wZ6P3u6DN3y9UI9r7NGRkTKc5sgpZxuEDffPgXsGo+aPCCXZPD6dQmCss/+yp7ruTaE8gORn9haZIX5BS0YmTOUzUNICn3FnVYLwsFbTKH4fY/74pSfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX6jqx21pGMDg6Blul6hkJqC8sdjRaTf+MR4wZxV8eI=;
 b=IYQMyZFEYwJDRvqyP6EK9jZF0SV4mcH4pbEEFz4FcTSF9120yFAUx6q4LW0sll91peIKlZOREIJ+5EVRAx9XJnLlxAxVZzfmRD7Bxu69T44t0d9rL5ZfthpsxIOePYY51JIzAWFyGCBgSu8T8ty0O6jlHmzJ+8/xynAhO8pc1vsLf3ndVSC/njMHeuDum2wNgONKUpjwVwWbZ5qH6+fW0/PLHTNBPELyY7P6AIG2NwWXD7+c/UUcvHw4hAwWooMFnYDeS8jegECo+8gGSQAh7BuwRSbJXzJCd15Wim6Q4Wyi+reot6JtPeEDAYyQTLMFkoGA1RuiEQQHsMg4rsUhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX6jqx21pGMDg6Blul6hkJqC8sdjRaTf+MR4wZxV8eI=;
 b=AIcGIEoqrr0BI4OcJctrVXz5pxOP/1c7AhLkCVJg/9DB/zKixgBqOwq/JmbsuArO/QjgyDyaPt4RU8ghqSRsiiRGGDkW6lrlsdoeEnsB9A1svrG4AJCwxHb+J6azc0EmTTtG9A0YBILIMPxO2YcAqLYPJtSz+HUy+S2tMXV63xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 10:13:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Message-ID: <Y1eamiBY0d+julWk@Air-de-Roger>
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1ba90c-460c-4a4b-57f8-08dab660c7b1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGXf6o3OiM560uymIG0xw6FtXfZBcX1aCMDhpp74EdCUOMP5GwGp0ajHSQo63zugTu/d2lh0fnU45cbZ/2zCxft5bfoxFJbswTfTLD1DdSanBNV/L+7FzBTsa7TZvN76hLnHfCqT2o94GESO3y4/v29/fHh+ZZUqYZUaIZIKa9dwDA1jitWrVqf7ehZuA14f6MQZpdx3gXx9L/n5mUGQ+E83mxFoX5W8JGgCqO/E5bTtsERt8jc4xzz2Ko+XaMptgh/U6+jGmdCsQMdxAMd+CW+T64AN0ly+fdvzcfHup/vq0caeOurTpEGS18EqEJylGUMcYMSDdiEDAmGuFx36I6oL3sgPfUfCrSjrQ8ob7yoMhBeTOvVkV2w5uqsFvYbvSM1DlNFfCE4jz1r6dLL2KGuDzmYgxPmIxliJFuwwwiDaorc4uVZH3zcOio+VFY11ywoGbOR/kUcdG9qRl/YOWfa+lgCQCG9dXwzMU1kpLooQ0GlCGAzAXsJ0Vu3ggZBDYHb7RhVeTgRs4c6UpPV6NwvTxCGIcv/9gULFG0KBYyvn2U/kQJTSJxLGDKmtfaE1rjh3o51W0bjKXfwIeRy3AiYTS6wtyjXePEOgPbYn37FEhsjSR4qZFPnoZEa3V8kYRHoDlvLq96aeeAkpVK1b1ROYWF5BpLB8qim8WPa3maGDOJx6u9uf/SQpbphHqMTciFXBN/91RChygqqLQEMxpQJMBwRVhpM8ND8EyIM4R+e7UOFMseZC65MTzY9yedYd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(478600001)(2906002)(6666004)(33716001)(26005)(9686003)(6512007)(6506007)(85182001)(6486002)(82960400001)(4326008)(38100700002)(5660300002)(8936002)(66556008)(66476007)(41300700001)(66946007)(186003)(8676002)(83380400001)(4744005)(86362001)(316002)(54906003)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEdPOGR6eDd2Y2pKRzMyM0JDQTMvd3BBd1hHbHNFY0dnNUNQZitFRTZFbU9E?=
 =?utf-8?B?ZVU5MVZkTWU0cEVjbGxoM2RFVmpURXRCMTA4SFRsTEgySGZkNStpZllGVm9v?=
 =?utf-8?B?Tm50SC9vc003ZUhvRmh5RFNsK21Kc3Qyd0V5djF2cEI2c0NoOU5hK1JQcGJv?=
 =?utf-8?B?TmdSZElOdzRjUUVrZzM4b0dhZGxTY0NsUVppSXRNT0x1Rk9mQldFajh1aHZR?=
 =?utf-8?B?azhmWm9IdmYzM3U5TTkvbHUwYjMxQm9kcDRhRG1kdjA3T0lDVkNzSHdOWktH?=
 =?utf-8?B?NHhDMFN6Y29zU0EvVW5oTGRGNFZ1R1gzNEg2by9hYi9SSVZ3MlNnUnV5UmYw?=
 =?utf-8?B?clpFazZWbFdEWW5WTVQyOUxQQW9xZ0ljcmNWZ0plUFJVWHI5aksxVVJvQ3RR?=
 =?utf-8?B?eUllTHJiOGRPeHFkVnpGcncwcVBYRjVsWEwrNnIxZVBuVWliUGg3L2p4ZTR1?=
 =?utf-8?B?aHZtcThwUmc4aGxSYStFSE1vSHV1di9OTEhQbERFa3JydUdoRExaNXJFRVRr?=
 =?utf-8?B?YThNM0grZUdJaGdaY0ZVL2tyaVRiVEJpdm8ybkJvdFYrSWMxUCtTUytoRElZ?=
 =?utf-8?B?MWxBbUs1cS9qc0lXZ25VWHMrOEpUM2d3YnYvVlljREthd1Z3VmxWZjlhNVMy?=
 =?utf-8?B?OWpTVnlUaElCc3l1QzlDcTNSQUc5UVRyQ3cxVk9lTzJHMUtwcmJhVUU0c0My?=
 =?utf-8?B?S3RzdlRMWUxTZVY5MUxUZVJoRlord1FEMTI2SlVVeTZOTnd6cFJ6ZDlKTXdo?=
 =?utf-8?B?TWlNdGVCNFdTSThkYS9XekREOUZoQVVDMWFTMG41d2JidGNoUG5RaU9MZTFN?=
 =?utf-8?B?RGR2bERMOGhIOW1hdDkvOWpybjMyVjFlWHlTYXJnUEVUZjhJSWNTWmtISDBF?=
 =?utf-8?B?a3cwb1R4UnozRmpNdktYSTNraW5IWG9XOURjdm1Lb2U4RmE0YmJTYW1Scm1L?=
 =?utf-8?B?ZUlsQTZWUyttMGIzTXVQd2VYZ2FGTEp0cjdXd1JjUktKbGJoNEF2L1Q5NDk2?=
 =?utf-8?B?clBKTndFbkNQWCtMdWptUkZxc2RILzJNQTZyTGhhSG9VNi9UMzVPZWNHZk4w?=
 =?utf-8?B?REJWZ28rK1pTSmMwSWYvVjREVmI3WnhlSVRZRU4xcGRRQW5SaXRJbzBXRXlp?=
 =?utf-8?B?Q0svZXgxdXVsOWErdi9qbS80U1YxamMxMmNjMFhBejNxSW11RjZoRldJUUxs?=
 =?utf-8?B?b0pDWGtvcE0zanZYYU9MUGxEOC95NDBaRUE2NTVodStrU0hNSitGYktPaTBo?=
 =?utf-8?B?TlltZEcrY1dtUkpBRjcrOHJreUJYRUJmZ2wwMkFHVzV4aGVsTGVuYWwxb3RN?=
 =?utf-8?B?V1daSXg2WW1tZEU2Z3JZRWxiSGJvMmNMeURpRS94MnpuUlpySWJEYy8yOG44?=
 =?utf-8?B?VGw4V2JFclhuamRCMVNKSmcwdjdtN2NkcFYrNDdlRlJJVXVFeU5yYVkxcEVJ?=
 =?utf-8?B?Wm1FN0d6bjNzc2xhZis1M2NsenBKUCtSbXV6TEM2N3E2WkhBNTV6TXlveThm?=
 =?utf-8?B?TTRQQ1pmSEt4UkVXK2lHclhZL0c0RXhIVnRSc3FNM0Y3Tk5Mendvdk05OFVS?=
 =?utf-8?B?MFk2eERjMXEyS0xCKzZ4L2JiRHI2Z09lYUlYSVFhYnl6ZHFHQ0F5ay9sTGdk?=
 =?utf-8?B?bzB1QXhyU0ZMY0w1Ym9kV05QcUdMeC9TRVVBWTN5WUdoZXorWWN2YmoyYkpG?=
 =?utf-8?B?djZISk9FZ2FmT3poengwa2x2WU9KNDNYek4zMWVIWEtKaXhLTG1MejZpSWZP?=
 =?utf-8?B?dFhnZEszUFh1ejA4QWlJQ3E3RDF5b21oOUVOYjZQOUt3V29Xekd0T0diRzEx?=
 =?utf-8?B?RGd2OVR1MENpMmdiaVpnV2dIeFlrdjRLWFl6V3dwNVdtdkVhQnRqcTVlOGJq?=
 =?utf-8?B?d2Z6SWtMREZHYm5YQXZzNEpOYS9yU2NpMXppNjNocVp4cS9mRm4xcGNNSUtR?=
 =?utf-8?B?SnBDUW5TY05naDRVLzk2UUhvSnBxMlN3bTRDTllYTmtoQTdiNTE4VnExVUtn?=
 =?utf-8?B?NlBaVWpxaVRlRFBvYzIxd3lBZXMvT051STR0d3dLMk9ROThVaW8rNlhSQnRQ?=
 =?utf-8?B?MFVtMkVWVVdMeUlZUE1yNlNDZGFKclZqUFJIenJsYlM4dVZlRkJVMGUxYytH?=
 =?utf-8?Q?vZqkToyPTBmmju6fI3heA9Nk8?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1ba90c-460c-4a4b-57f8-08dab660c7b1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:13:21.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML/8cnYrM+FS02yktgHn8WepsVSJx0pDyhw1F67xztb0VkQQjV1BcpbDpOhMv0ksVDDFkAyKjgLRwXjaptM4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6450

On Mon, Oct 24, 2022 at 12:58:54PM -0400, Tamas K Lengyel wrote:
> Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a handful
> of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by an
> external privileged tool is necessary, thus we extend the domctl to allow for
> querying for any guest MSRs. To remain compatible with the existing setup if
> no specific MSR is requested via the domctl the default list is returned.

I'm afraid I would benefit from some extra description about why you
need to introduce a separate hook instead of using the existing
do_rdmsr hook in arch_vpmu_ops (which is already hooked into
guest_rdmsr()).

Are the MSRs you are trying to fetch not accessible for the guest
itself to read?

It seems fragile to me to add such kind of hook to read MSRs that's
only used by XEN_DOMCTL_get_vcpu_msrs and not guest_rdmsr(), so it
would need some clear justification about why it's needed.

Thanks, Roger.

