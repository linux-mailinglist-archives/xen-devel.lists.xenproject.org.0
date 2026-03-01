Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIaeIAP7o2kaTgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 09:38:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC41CEDC5
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 09:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243703.1543311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwcJA-0000yk-27; Sun, 01 Mar 2026 08:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243703.1543311; Sun, 01 Mar 2026 08:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwcJ9-0000tm-V4; Sun, 01 Mar 2026 08:37:47 +0000
Received: by outflank-mailman (input) for mailman id 1243703;
 Sun, 01 Mar 2026 08:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSs9=BB=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1vwcHe-0000nw-9N
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 08:36:14 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09d3183-1549-11f1-9ccf-f158ae23cfc8;
 Sun, 01 Mar 2026 09:36:07 +0100 (CET)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6212HKN61732630
 for <xen-devel@lists.xenproject.org>; Sun, 1 Mar 2026 08:36:06 GMT
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6jcqj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 08:36:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c70f19f0f37so1923129a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 00:36:05 -0800 (PST)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa82dd09sm9177300a12.28.2026.03.01.00.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 00:36:03 -0800 (PST)
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
X-Inumbo-ID: b09d3183-1549-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h/J87S3x56AlWUvhsWA468
	cx/T1N6JOg3YVREGRvJqA=; b=Soibzn4N/ZkM5J3qoqIornB47kjVSoW4OSYFdA
	JxHI+jCEFG5AvcKA6uqJnh2JesMWopy+nx3HDqBpTUvNGDuFejcPfcLe9Wzv31dL
	lZmPlWfTua+C1ln4pDhPH3wO0uF/KAKlbaurOU0Lyvb/HT3LlRYDU5RicRjeIINR
	QpXTC9yyk0HMnRkljCIyNpxDx3575VsDL+yiy4jgj2xHmPPD5HbYk9UXvz0mnraL
	sorBjyjDTyJXLHZLUZX9b2mC5nbJ0Wy1mT6ghkzAsD2FR+BQU64qTD44WcqMK0f9
	o5vQEB9V06sSulMdm2F48Z6RTI7ze1Qmdf4VUiOntKatRtgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772354165; x=1772958965; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/J87S3x56AlWUvhsWA468cx/T1N6JOg3YVREGRvJqA=;
        b=F4VZ85rA7fmi9WGqjNz1ccAfUAcZWrC9ni7s6cRAVejT1OSWmKj0Ooc/OwdCmQu2g9
         9yvz12LRB7VSSu2ft/sx0UD2jJ01Grbiq59w9T0wWtMtW/kL3gYxFUt1ZXlBfHN+0nLR
         LFJ9GqRbAmT3MSj0O0zmK4SS/Y48rpL33rzAa5SGK6Duv2lCLPKWoJMsiYug3q6MqKh7
         k874+hzsLllyOj899AkRG2VCBc6MpXbvsFvLO0b3hU4GZlvMCBFVYbOdHmoE618RgxeU
         FlxKh+ve0JH7+YIZSAaEfEWq1qsdXseI8EsCbwc0IMMVfLU99CnyqCvpSqW8Y1FoXNrw
         ok9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772354165; x=1772958965;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/J87S3x56AlWUvhsWA468cx/T1N6JOg3YVREGRvJqA=;
        b=NjJ3U2xUvTJQO3svDjSIftyXuTNv2qEuhZcpiZrxQ6GJrnWbedetaiUeapY+Rvyl+w
         LK3TYabscE5an/ai75JdPXbghF+nCJDrZpGMTQq2/pibQh3MLDFauTu1rIf1KzQPmpCt
         Yrsq4RucpmplbZJBfiCu4lJ/FI/ET87uGU+c5XMtZyNikkC4jQ1oXQXAat2x9FkuFlbA
         dYEPLwItqxVJm8QBTY7/tyI6ezCjR+2J222EsVruWMNqPGoc20L3xRL80cXb/lYe+L3T
         sWpfLOeZr2Tn6RsMOTtShSnrP4mZ2mXOAStUQPgmf0xYQ3A4U+Dwo849DsvpxYBQTC2A
         jf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPXez4GCPPPG/Tc92DpodlOoKm/sa03R5Z+TlPDqr3D8OhQGC0h+knxZoHQjOYqlUMuVRnZFtSNb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMrsuu2juaqP8B8qw4K0XbZKpItTahCsnoSZH/aoN7BfreWpSF
	RsamAK6ElijoIgWZKOXhoETyfGdo3zXgG0kkxSyFQhGvHzQqm3tQxZbFXOfh5aKrkeSmXjCrVCB
	7FSFd4mz+2QJSS866Ww4yMh1vqr0eeBx7frcfxAmeJVHv6NVKNEoJGl4fx0IPS0AXeXRt5A==
X-Gm-Gg: ATEYQzxDb/ikAbAqPuYdZ6EQ8xMJamHHLMBNX9gTNjtIKP+GK+x3J06IZTuR2Mqe3cX
	aYfGkQkDr6FBBO46O8cQBjRXIxElrIVaWl3Gs62xaiukTMFsTzb1pPadzts4L28/yk4IQpTSjDB
	YpdVISdM065vFpPvvUPPgwGokCFrTTIfkYhvR6BdqofgYLgm6LEIVG8GmMRbLMiFtn/cwcyqkeo
	mj1zG28CERnfFGG8nBqsZOSRFXSuNUNn2AJgsxn79xCflRwg2Py6nojhQF0aPa5yF3tOPznFqZW
	i5TvBo7bSST1I6lY7OGr6dwW6d71c7Ju6ojbw0xxzbLsEfGYVSU/RPtGxE5TojwQlHH5HSc2qqf
	yu2dAdsNY6yoJ6y5b7iGan1pw5SHMnS522qWCzCIrrVH1q3SlLbP0DC8F
X-Received: by 2002:a05:6a00:1d14:b0:823:1444:7873 with SMTP id d2e1a72fcca58-827398630afmr9488137b3a.32.1772354164639;
        Sun, 01 Mar 2026 00:36:04 -0800 (PST)
X-Received: by 2002:a05:6a00:1d14:b0:823:1444:7873 with SMTP id d2e1a72fcca58-827398630afmr9488110b3a.32.1772354164035;
        Sun, 01 Mar 2026 00:36:04 -0800 (PST)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v9 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Sun, 01 Mar 2026 14:04:18 +0530
Message-Id: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAr6o2kC/x3MTQqAIBBA4avErBM0ob+rRIjZVANq4VAE0d2Tl
 t/ivQcYEyFDXzyQ8CKmPWZ0ZQFus3FFQXM2VLKqpZZKHDYxGtpDOI1D71kop3VTtxanyULujoQ
 L3f9zGN/3A61zjrxjAAAA
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772354153; l=4172;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=H6nPK0TK5n+SrUMyTi0tJArgcayT5+iAOxNLWT6jD+I=;
 b=0138PH3DyBpH6CTf5Gshrd2F5CdUzVc0F0MxX4wX0mhvTjGvGhC4k9OE5ekOV5Mibl6bnxqrt
 Gf0jdcWnaG7Anf+I2c3nVSolMIhssmbuOeaTts0urN2JZSagf5VqNQT
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: nC_k3CF1wKFDaDdcuCNCuxK_XTihnHsl
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a3fa75 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=hUMMoPFcHhpVZiwYRzIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA3NiBTYWx0ZWRfX4DRfWh8eFQGq
 qf/ONY1xYk9oZK3EdbvgJ8IplpOSpLyOsb8ka2msMNBZ3hAS7wV0f0d9QGb+XrI9A1R2zMEs0UZ
 EY/zz34HfzwyVA/yiu0SRVrApIAlY9J2scsUPWXNz9GSRjU7iHfa/R08E2fv5KVsdsCSiOokGtZ
 wzAlCeEyETCHaLtU5YSUUHA1QN7g+L3ozN7NuhfdbDlMEIFzmtmzwA5BPhCPCrAb7en3PCGY7of
 UyKsHlOG9IUotxYX4sC7rS94x+1vdgtrjvBGZsibDlc0273qxPFoUNejmV9laS4Iend1WY1kpvC
 TLvcsND3m6VPXfh4QCRLh0ow5NPxY6sxsjLlWOjL2wKum3ixP22odrQPCRwGeVlWbZT22+3SNRI
 +pNJmCJXJp3edb4aRnXqn50nsl5ORQgVhKPOenx7VUz8SDSQJJr3vAGNiVetbJKKplIWz5JCJnn
 OpjoYaPmmiooP9igLjQ==
X-Proofpoint-GUID: nC_k3CF1wKFDaDdcuCNCuxK_XTihnHsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:vijayanand.jitta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:
 charan.kalla@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 04DC41CEDC5
X-Rspamd-Action: no action

So far our parsing of {iommu,msi}-map properites has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
Charan Teja Kalla (1):
      of: factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   3 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |   2 +-
 drivers/of/base.c                        | 148 ++++++++++++++++++++++---------
 drivers/of/irq.c                         |   3 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  12 ++-
 drivers/pci/controller/pcie-apple.c      |   5 +-
 drivers/xen/grant-dma-ops.c              |   3 +-
 include/linux/of.h                       |  33 +++++--
 9 files changed, 152 insertions(+), 63 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


